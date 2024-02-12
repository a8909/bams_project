import 'package:bams_project/textfield.dart';
import 'package:bams_project/top-content.dart';
import 'package:flutter/material.dart';

import 'App-string.dart';
import 'color-template.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

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
                (AppStrings.helperTxt != "")
                    ? const HelperPassword(helper: AppStrings.helperTxt)
                    : const TxtField(label: AppStrings.password),
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
