import 'dart:core';
// import 'dart:html';

import 'package:bams_project/color-template.dart';
import 'package:bams_project/components/App-string.dart';
import 'package:bams_project/components/cancel-button.dart';
import 'package:bams_project/controller/Service_Provider/app_repo.dart';
import 'package:bams_project/controller/Service_Provider/login_provider.dart';
import 'package:bams_project/data/database.dart';
import 'package:bams_project/fingerprint.dart';
import 'package:bams_project/textfield.dart';
import 'package:bams_project/toast.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import 'controller/Service_Provider/api_calls/request.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool visible = true;
  bool buttonStatus =
      false; //the button is used for loading spinal of the login button
  // bool butStatus = true;
  void checkButtonStatus(bool status) {
    setState(() {
      buttonStatus = status;
    });
  }

  Map<String, dynamic> auth = {
    'email': {
      'validator': false,
      'controller': TextEditingController(),
      'focusNode': FocusNode()
    },
    'password': {
      'validator': false,
      'controller': TextEditingController(),
      'focusNode': FocusNode()
    }
  };

  Services service = Services();
  final _db = Hive.box('DataBase');
  String message = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).viewPadding.top;
    return Scaffold(
      // appBar: appBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 80 + height),
              appHead(AppStrings.capLog),
              const Text(
                AppStrings.logtxt,
                style: TextStyle(
                    fontFamily: 'Airbnb Cereal App',
                    color: AppColors.txt2,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 50,
              ),
              // email field
              TextField(
                controller: auth['email']['controller'],
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  setState(() {
                    context.read<LoginProvider>().email = value;
                  });
                },
                decoration: const InputDecoration(
                    label: Text(AppStrings.email),
                    hintText: AppStrings.email,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.all(Radius.circular(7)))),
              ),

              const SizedBox(
                height: 20,
              ),
              //password field
              TxtField(
                controller: auth['password']['controller'],
                label: "password",
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  setState(() {
                    context.read<LoginProvider>().password = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(
                    height: 50,
                    width: 266,
                    child: ElevatedButton(
                        onPressed: auth['email']['controller'].text.isEmpty ||
                                auth['password']['controller'].text.isEmpty
                            ? null
                            : () {
                                final body = {
                                  'email': auth['email']['controller'].text,
                                  'password':
                                      auth['password']['controller'].text
                                };

                                print(body);
                                service.doLogin(body).then((value) {
                                  checkButtonStatus(true);
                                  print(value);
                                  _db.put('authSevice', value);
                                  Navigator.of(context)
                                      .pushReplacement(MaterialPageRoute(
                                    builder: (context) {
                                      print('login successful');
                                      return const Toast();
                                    },
                                  ));
                                });
                                // context
                                //     .read<LoginProvider>()
                                //     .login()
                                //     .then((value) {
                                //   context.read<AppRepo>().user = value.user;
                                //   context.read<AppRepo>().token = value.token;
                                //   Navigator.of(context)
                                //       .pushReplacement(MaterialPageRoute(
                                //     builder: (context) {
                                //       print('login successful');
                                //       return const Toast();
                                //     },
                                //   ));
                                // });

                                checkButtonStatus(false);
                              },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.btn1,
                            foregroundColor: Colors.white),
                        child: buttonStatus
                            ? const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('loading...'),
                                  SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              )
                            : const Center(
                                child: Text(AppStrings.login),
                              )),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: FingerPrint(),
                  )
                  // fingerprint layout
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(AppStrings.account,
                      style: TextStyle(fontSize: 12, color: Colors.black)),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed("/signup");
                      },
                      child: const Row(
                        children: [
                          Text(
                            AppStrings.signup,
                            style:
                                TextStyle(fontSize: 12, color: AppColors.btn1),
                          )
                        ],
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
