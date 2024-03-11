import 'package:bams_project/App-string.dart';
import 'package:bams_project/elevatedBut.dart';
import 'package:bams_project/textfield.dart';
import 'package:bams_project/top-content.dart';
import 'package:flutter/material.dart';

import 'color-template.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController controller = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();
  final controller4 = TextEditingController();
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
              AppField(
                hint: AppStrings.firstname,
                heigth: 7,
                controller: controller,
              ),
              const SizedBox(height: 20),
              AppField(
                hint: AppStrings.lastname,
                heigth: 7,
                controller: controller2,
              ),
              const SizedBox(height: 20),
              AppField(
                hint: AppStrings.phone,
                heigth: 7,
                controller: controller3,
              ),
              const SizedBox(height: 20),
              AppField(
                hint: AppStrings.gmail,
                heigth: 7,
                controller: controller4,
              ),
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
