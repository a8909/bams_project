import 'package:bams_project/App-string.dart';
import 'package:bams_project/elevatedBut.dart';
import 'package:bams_project/textfield.dart';
import 'package:bams_project/top-content.dart';
import 'package:flutter/material.dart';

import 'color-template.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

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
              const SizedBox(height: 30),
              const AppField(
                hint: AppStrings.firstname,
                heigth: 7,
              ),
              const SizedBox(height: 20),
              const AppField(hint: AppStrings.lastname, heigth: 7),
              const SizedBox(height: 20),
              const AppField(hint: AppStrings.phone, heigth: 7),
              const SizedBox(height: 20),
              const AppField(hint: AppStrings.gmail, heigth: 7),
              const SizedBox(height: 30),
              elvBtn(AppStrings.cont, "/verification", context, 50,
                  double.infinity)
            ],
          ),
        ),
      ),
    );
  }
}
