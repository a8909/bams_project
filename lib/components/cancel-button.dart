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
