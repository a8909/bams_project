import 'package:bams_project/App-string.dart';
import 'package:bams_project/cancel-button.dart';
import 'package:bams_project/elevatedBut.dart';
import 'package:bams_project/top-content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'color-template.dart';

class Verification extends StatelessWidget {
  const Verification({super.key});

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
                AppStrings.verification,
                style: TextStyle(fontSize: 50, color: AppColors.txt1),
              ),
              const SizedBox(height: 10),
              const Text(
                AppStrings.verTxt,
                style: TextStyle(color: AppColors.txt2, fontSize: 15),
              ),
              const SizedBox(height: 40),
              OtpTextField(
                numberOfFields: 5,
                showFieldAsBox: true,
                borderRadius: const BorderRadius.all(Radius.circular(7)),
                fieldWidth: 50,
                onSubmit: (String verificationCode) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Verification Code'),
                        content: Text("code entered is $verificationCode"),
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 20),
              const Align(
                  alignment: Alignment.center, child: Text(AppStrings.code)),
              TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(AppStrings.call),
                      const SizedBox(height: 10),
                      call(),
                    ],
                  )),
              const SizedBox(height: 40),
              elvBtn(
                  AppStrings.vercont, "/signin", context, 50, double.infinity)
            ],
          ),
        ),
      ),
    );
  }
}
