import 'package:bams_project/App-string.dart';
import 'package:bams_project/color-template.dart';
import 'package:flutter/material.dart';

class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.onboard1),
      ],
    );
  }
}

Row onboardingBtns(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed("/signin");
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.btn2, foregroundColor: Colors.white),
          child: const Text(AppStrings.login)),
      ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed("/mainpage");
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black, foregroundColor: Colors.white),
          child: const Text(AppStrings.signup))
    ],
  );
}
