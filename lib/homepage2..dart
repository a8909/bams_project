import 'package:bams_project/App-string.dart';
import 'package:flutter/material.dart';

import 'color-template.dart';

class MainPage2 extends StatefulWidget {
  final String imagePath;
  const MainPage2({super.key, required this.imagePath});

  @override
  State<MainPage2> createState() => _MainPage2State();
}

class _MainPage2State extends State<MainPage2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 60, 16, 16),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.welcome,
            style: TextStyle(color: AppColors.txt1),
          ),
          const Text(
            "Monitor your accounts in a single interface",
            style: TextStyle(color: AppColors.txt2, fontSize: 50),
          ),
          const SizedBox(
            height: 30,
          ),
          // Image.asset(widget.imagePath)
        ],
      ),
    );
  }
}
