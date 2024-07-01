import 'package:bams_project/color-template.dart';
import 'package:bams_project/components/App-string.dart';
import 'package:flutter/material.dart';

handleCancel(BuildContext context) {
  return Navigator.of(context).pop();
  // Navigator.pushNamed(context, routeName)
}

Row cancelButton(
  BuildContext context,
) {
  return Row(
    children: [
      GestureDetector(
          onTap: () => handleCancel(context),
          child: const Icon(Icons.cancel_sharp)),
    ],
  );
}

GestureDetector call() {
  return GestureDetector(
      onTap: () => print(AppStrings.call),
      child: const Icon(
        Icons.call_sharp,
        size: 15,
      ));
}

Text appHead(String text) {
  return Text(
    text, // register text
    style: const TextStyle(
        fontWeight: FontWeight.w700, color: AppColors.txt1, fontSize: 50),
  );
}
