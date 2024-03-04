import 'package:bams_project/textfield.dart';
import 'package:bams_project/top-content.dart';
import 'package:flutter/material.dart';

import 'App-string.dart';
import 'color-template.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late String password;
  double strenght = 0;
  final number = RegExp(r".*[0-9].*");
  final letters = RegExp(r".*[A-Za-z].*");
  bool visible = true;
  String message = AppStrings.helperTxt;

  void onPasswordChange(String value) {
    password = value.trim();
    if (password.isEmpty) {
      setState(() {
        strenght = 0;
        message = "Strenght is low";
      });
    } else if (password.length < 6) {
      setState(() {
        strenght = 1 / 4;
        message = "Password strenght too short";
        print("$message");
      });
    } else if (password.length < 8) {
      strenght = 2 / 4;
      message = "Average password strenght";
      print(message);
    } else {
      if (!number.hasMatch(password) || !letters.hasMatch(password)) {
        setState(() {
          strenght = 3 / 4;
        });
      } else {
        setState(() {
          strenght = 4 / 4;
          message = "password is strong";
          print(message);
        });
      }
    }
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
                  AppStrings.register,
                  style: TextStyle(color: AppColors.txt1, fontSize: 50),
                ),
                const SizedBox(height: 10),
                const Text(AppStrings.regTxt,
                    style: TextStyle(color: AppColors.txt2)),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  onChanged: (value) => onPasswordChange(value),
                  obscureText: visible,
                  decoration: InputDecoration(
                      label: const Text(AppStrings.password),
                      hintText: AppStrings.password,
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
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(7)))),
                ),
                const SizedBox(
                  height: 10,
                ),
                LinearProgressIndicator(
                    value: strenght,
                    backgroundColor: Colors.grey,
                    color: strenght == 1 / 4
                        ? Colors.red
                        : strenght == 2 / 4 || strenght == 3 / 4
                            ? Colors.yellow
                            : Colors.green),
                // (AppStrings.helperTxt != "")
                //     ? const HelperPassword(helper: AppStrings.helperTxt)
                //     : const TxtField(label: AppStrings.password),
                const SizedBox(height: 10),
                Text(message,
                    style: const TextStyle(fontSize: 18, color: Colors.grey)),
                const SizedBox(height: 10),
                const TxtField(label: AppStrings.confirmPassword),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(AppStrings.account2,
                        style: TextStyle(fontSize: 10, color: Colors.black)),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("/signup");
                        },
                        child: const Row(
                          children: [
                            Text(
                              AppStrings.login2,
                              style: TextStyle(
                                  fontSize: 12, color: AppColors.btn1),
                            )
                          ],
                        ))
                  ],
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed("/toast");
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.btn1,
                          foregroundColor: Colors.white),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text(AppStrings.cont)],
                      )),
                ),
              ],
            ),
          ),
        ));
  }
}
