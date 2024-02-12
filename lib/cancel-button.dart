import 'package:flutter/material.dart';

import 'App-string.dart';

void handleCancel(BuildContext context) {
  return Navigator.of(context).pop();
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
