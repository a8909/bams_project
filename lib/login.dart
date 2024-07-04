import 'dart:core';
// import 'dart:html';

import 'package:bams_project/color-template.dart';
import 'package:bams_project/components/App-string.dart';
import 'package:bams_project/components/cancel-button.dart';
import 'package:bams_project/controller/Service_Provider/app_repo.dart';
import 'package:bams_project/controller/Service_Provider/login_provider.dart';
import 'package:bams_project/data/database.dart';
import 'package:bams_project/fingerprint.dart';
import 'package:bams_project/screen_1.dart';
import 'package:bams_project/textfield.dart';
import 'package:bams_project/toast.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

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

  final box = Hive.box('DataBase');
  BamsDataBase bdb = BamsDataBase();

  @override
  void initState() {
    super.initState();
    // if (box.get('userLogin') == null) {
    //   bdb.loadDb();
    // } else {
    //   bdb.createInitaialDb();
    // }
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
                        onPressed: context
                                    .read<LoginProvider>()
                                    .email
                                    .isEmpty ||
                                context.read<LoginProvider>().password.isEmpty
                            ? null
                            : () {
                                checkButtonStatus(true);
                                context
                                    .read<LoginProvider>()
                                    .login("https://reqres.in/api/register")
                                    .then((value) {
                                  context.read<AppRepo>().user = value.user;
                                  context.read<AppRepo>().token = value.token;
                                  Navigator.of(context)
                                      .pushReplacement(MaterialPageRoute(
                                    builder: (context) {
                                      bdb.updateDb();
                                      print('login successful');
                                      return const Toast();
                                      // if (box.get('userLogin') != null) {
                                      //   bdb.updateDb();
                                      //   return const Screen1();
                                      // } else {
                                      //   return const Toast();
                                      // }
                                    },
                                  ));
                                  checkButtonStatus(false);

                                  //  this return the button back to false
                                  //== login text is giving back

                                  print("welcome");
                                });
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
