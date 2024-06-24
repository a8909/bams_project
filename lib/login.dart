import 'dart:core';
// import 'dart:html';

import 'package:bams_project/App-string.dart';
import 'package:bams_project/color-template.dart';
import 'package:bams_project/controller/Service_Provider/app_repo.dart';
import 'package:bams_project/controller/Service_Provider/login_provider.dart';
import 'package:bams_project/fingerprint.dart';
import 'package:bams_project/screen_1.dart';
// import 'package:bams_project/screen_1.dart';
import 'package:bams_project/top-content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool visible = true;
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  bool buttonStatus = false;
  bool butStatus = true;
  void checkButtonStatus(bool status) {
    setState(() {
      buttonStatus = status;
    });
  }

  // @override
  // void initState() {
  //   super.initState();
  //   emailcontroller.addListener(() {
  //     final buttonStatus = emailcontroller.text.isNotEmpty;
  //   });

  //   passwordcontroller.addListener(() {
  //     final buttonStatus = passwordcontroller.text.isNotEmpty;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                AppStrings.capLog,
                style: TextStyle(fontSize: 50, color: AppColors.txt1),
              ),
              const Text(
                AppStrings.logtxt,
                style: TextStyle(color: AppColors.txt2),
              ),
              const SizedBox(
                height: 50,
              ),
              TextField(
                controller: emailcontroller,
                onChanged: (value) {
                  Provider.of<LoginProvider>(context, listen: false).email =
                      value;
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
              // AppField(
              //   hint: AppStrings.email,
              //   heigth: 7,
              //   controller: emailcontroller,
              //   onChangecallback: (value) {
              //     Provider.of<LoginProvider>(context).email = value;
              //   },
              // ),
              const SizedBox(
                height: 20,
              ),

              TextField(
                onChanged: (value) {
                  Provider.of<LoginProvider>(context, listen: false).password =
                      value;
                },
                controller: passwordcontroller,
                obscureText: visible,
                decoration: InputDecoration(
                    label: const Text("password"),
                    hintText: "pasword",
                    suffixIcon: TextButton(
                        onPressed: () {
                          setState(() {
                            visible = !visible;
                          });
                        },
                        child: Column(
                          children: [
                            visible
                                ? const Text(AppStrings.show)
                                : const Text(AppStrings.hide)
                          ], //conditional statement for show text toggle
                        )),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7))),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.all(Radius.circular(7)))),
              ),
              // TxtField(
              //   label: AppStrings.password,
              //   controller: passwordcontroller,
              // ),
              const SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(
                    height: 50,
                    width: 266,
                    child: ElevatedButton(
                        onPressed: (emailcontroller.text.isNotEmpty &&
                                passwordcontroller.text.isNotEmpty &&
                                butStatus)
                            ? () {
                                checkButtonStatus(true);
                                Provider.of<LoginProvider>(context,
                                        listen: false)
                                    .login()
                                    .then((value) {
                                  setState(() {
                                    butStatus = false;
                                  });
                                  Provider.of<AppRepo>(context, listen: false)
                                      .user = value.user;
                                  Provider.of<AppRepo>(context, listen: false)
                                      .token = value.token;
                                  Future.delayed(
                                    const Duration(seconds: 3),
                                    () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) {
                                          print("new page is routed");
                                          return const Screen1();
                                        },
                                      ));
                                      checkButtonStatus(false);

                                      print("welcome");

                                      // emailcontroller.clear();
                                      // passwordcontroller.clear();
                                    },
                                  );
                                });
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.btn1,
                            foregroundColor: Colors.white),
                        child: buttonStatus
                            ? const Row(
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
                  // elvBtn(AppStrings.login, "/screen1", context, 50, 266),
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
