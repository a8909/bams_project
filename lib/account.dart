import 'package:bams_project/color-template.dart';
import 'package:bams_project/top-content.dart';
import 'package:flutter/material.dart';

class BankAccount extends StatelessWidget {
  const BankAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Accounts",
              style: TextStyle(color: AppColors.btn2, fontSize: 40),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(1),
                  borderRadius: const BorderRadius.all(Radius.circular(7))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.network(
                      height: 80,
                      width: 80,
                      "https://s3-alpha-sig.figma.com/img/46bc/9aa2/ede4a07c6d6b268dbf051bef02038cc1?Expires=1710720000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=kou4JWaWko46z~uRrQ51idZAfdGf-rIGBb0hdddH3Yc8~w1wvOn87F9VmZ-oyNlbDxg-9kkNkKMVjd-Rsg2RPFa-M5q7xkl2MuIPirJfdOridVzP0-njMg7Mn7WnnjhvdkKhuQbdFqnA1668yTeA~kcTzCko5-iwnHI07vWRXDe76mqYTszHgypbs5HgNraA-D563ZVlfHortnlxXsNI~rb6wFWhAmjIzP5Rse4XVgXjyemtpd5XRMvagXSQzx6EG4D968rCmAvvmTfW62r3cVlnLEOZ7CiXVs0qjoFLyum5UwPuIArBUa7Gfc0m-UHN0y1C89p-twasxnxv7ZqQXA__"),
                  // AssetImage(assetName) this  should be passed dynamically from end point
                  Container(
                      child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("Tevi Adekunle F."), Text("3092773812")],
                  )),
                  Container(
                    height: 20,
                    width: 100,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(234, 242, 242, 242),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Current Account",
                          style: style(),
                        )
                      ],
                    ),
                  ),
                  const Icon(Icons.arrow_forward_ios_outlined)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
