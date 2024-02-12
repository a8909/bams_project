import 'package:bams_project/color-template.dart';
import 'package:flutter/material.dart';

SizedBox elvBtn(
  String text,
  String routeName,
  BuildContext context,
  double height,
  double width,
) {
  return SizedBox(
    height: height,
    width: width,
    child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed(routeName);
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.btn1, foregroundColor: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(text)],
        )),
  );
}

SizedBox elvBtn2(String text, String routeName, BuildContext context,
    double height, double width) {
  return SizedBox(
    height: height,
    width: width,
    child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed(routeName);
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.btn2, foregroundColor: Colors.black),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(text)],
        )),
  );
}
