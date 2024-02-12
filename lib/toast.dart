import 'package:bams_project/App-string.dart';
import 'package:bams_project/cancel-button.dart';
import 'package:bams_project/color-template.dart';
import 'package:bams_project/elevatedBut.dart';
import 'package:flutter/material.dart';

class Toast extends StatelessWidget {
  const Toast({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            cancelButton(context),
            Image.asset(
              "assets/images/toast.png",
              height: 400,
            ),
            const Text(
              AppStrings.toast,
              style: TextStyle(color: AppColors.txt1, fontSize: 45),
            ),
            const Text(AppStrings.greatness),
            const SizedBox(height: 15),
            const Text(AppStrings.cheers),
            const Spacer(),
            elvBtn(AppStrings.cont, "/screen1", context, 50, double.infinity)
          ],
        ),
      ),
    );
  }
}
