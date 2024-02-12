import 'package:bams_project/App-string.dart';
import 'package:bams_project/cancel-button.dart';
import 'package:bams_project/color-template.dart';
import 'package:bams_project/elevatedBut.dart';
import 'package:flutter/material.dart';

class Transfer extends StatelessWidget {
  const Transfer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(220, 29, 20, 214),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            cancelButton(context),
            const SizedBox(height: 10),
            const Text(
              AppStrings.sweep,
              style: TextStyle(fontSize: 50, color: AppColors.btn2),
            ),
            const Text(
              AppStrings.sweepTransfer,
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),
            const Text(
              AppStrings.sweepTransfer2,
              style: TextStyle(color: Colors.white),
            ),
            const Spacer(),
            elvBtn2(
                AppStrings.cont, "/transfermoney", context, 50, double.infinity)
          ],
        ),
      ),
    );
  }
}
