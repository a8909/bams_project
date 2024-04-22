import 'dart:convert';
import 'dart:core';
import 'dart:html';

import 'package:bams_project/App-string.dart';
import 'package:bams_project/color-template.dart';
import 'package:bams_project/elevatedBut.dart';
import 'package:bams_project/fingerprint.dart';
import 'package:bams_project/global-string.dart';
import 'package:bams_project/screen_1.dart';
// import 'package:bams_project/screen_1.dart';
import 'package:bams_project/textfield.dart';
import 'package:bams_project/top-content.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'controller/Service_Provider/user_Service.dart';

class LogIn extends StatefulWidget {
  LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  String Password = "";
  bool visible = true;
  final emailcontroller = TextEditingController();

  final passwordcontroller = TextEditingController();

  Future<User> doLogin() async {
    final email = emailcontroller.text;
    final password = Password;
    final body = {
      "email": email,
      "password": password,
    };
    print(jsonEncode(body));
    var url = "https://reqres.in/api/register";
    final response = await http.post(Uri.parse(url), body: body);
    print(response.body);
    try {
      if (response.statusCode == 200) {
        print(response.body);
        final json = jsonDecode(response.body);
        final users = User.fromjson(json);
        print(users.password);
        return users;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }

    throw Exception("user not found");
  }

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
              AppField(
                hint: AppStrings.email,
                heigth: 7,
                controller: emailcontroller,
              ),
              const SizedBox(
                height: 20,
              ),

              TextField(
                onChanged: (value) {
                  Password = value;
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
                        onPressed: () async {
                          await doLogin();
                          // Navigator.pushNamed(context, screen1);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.btn1,
                            foregroundColor: Colors.white),
                        child: const Center(
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
