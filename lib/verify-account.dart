import 'package:bams_project/App-string.dart';
import 'package:bams_project/cancel-button.dart';
import 'package:bams_project/color-template.dart';
import 'package:bams_project/elevatedBut.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class VerifyAccount extends StatelessWidget {
  const VerifyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            cancelButton(context),
            const SizedBox(
              height: 10,
            ),
            const Text(
              AppStrings.verifyaccount,
              style: TextStyle(fontSize: 45, color: AppColors.txt1),
            ),
            const Text(AppStrings.verTxt, style: TextStyle(fontSize: 16)),
            const SizedBox(
              height: 20,
            ),
            OtpTextField(
              numberOfFields: 6,
              showFieldAsBox: true,
            ),
            const SizedBox(
              height: 20,
            ),
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
            const Spacer(),
            elvBtn(AppStrings.cont, "routeName", context, 50, double.infinity)
          ],
        ),
      ),
    );
  }
}
