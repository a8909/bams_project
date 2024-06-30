import 'package:bams_project/components/App-string.dart';
import 'package:bams_project/controller/Service_Provider/api_calls/request.dart';
import 'package:bams_project/controller/Service_Provider/login_provider.dart';
import 'package:bams_project/signup.dart';
import 'package:bams_project/textfield.dart';
import 'package:bams_project/top-content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  final TextEditingController controller = TextEditingController();
  final pwdController = TextEditingController();

  void onPasswordChange(String value) {
    password = value.trim();
    if (password.isEmpty) {
      setState(() {
        strenght = 0;
        message = "Password is required";
      });
    } else if (password.length < 6) {
      setState(() {
        strenght = 1 / 4;
        message = "Password strenght too short";
      });
    } else if (password.length < 8) {
      strenght = 2 / 4;
      message = "Average password strenght";
    } else {
      if (!number.hasMatch(password) || !letters.hasMatch(password)) {
        setState(() {
          strenght = 3 / 4;
        });
      } else {
        setState(() {
          strenght = 4 / 4;
          message = "password is strong";
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
                  AppStrings.register, // register text
                  style: TextStyle(color: AppColors.txt1, fontSize: 50),
                ),
                const SizedBox(height: 10),
                const Text(AppStrings.regTxt,
                    style: TextStyle(color: AppColors.txt2)),
                const SizedBox(
                  height: 10,
                ),

                //firstPassword is set here
                TxtField(
                  keyboardType: TextInputType.text,
                  label: AppStrings.password,
                  onChanged: (value) {
                    context.read<LoginProvider>().email = value;
                  },
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
                const SizedBox(height: 10),
                Text(message,
                    style: const TextStyle(fontSize: 10, color: Colors.black)),
                const SizedBox(height: 10),

                //confirm password is set here
                TxtField(
                  keyboardType: TextInputType.text,
                  label: AppStrings.confirmPassword,
                  onChanged: (value) {
                    context.read<LoginProvider>().password = value;
                  },
                ),

                // if user already has an account then the login here can be clicked
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(AppStrings.account2,
                        style: TextStyle(fontSize: 10, color: Colors.black)),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("/login");
                          pwdController.clear();
                          controller.clear();
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

                // for creating new user account
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        // snackBar('Sucessfully created !', AppColors.success);
                        context.read<LoginProvider>().login('apiUrl').then(
                            (value) => Navigator.of(context).pushNamed(
                                "/login")); // here the api link will be passed for get request

                        pwdController.clear();
                        controller.clear();
                        // ScaffoldMessenger.of(context)
                        //     .showSnackBar(snackBar as SnackBar);
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
