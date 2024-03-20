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
            Image.network(
                "https://s3-alpha-sig.figma.com/img/e69c/6c61/c07093e9fadcc6eee2cc3b4cd4f5874c?Expires=1711324800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Yjd6~ZdlSldB~hhkqbJ1RDgckiI3aIihj7ePT-INlOI7IqQNmdvyjIsMOc~Qiz7BV9hl6fvLGgUKxs~tDIPuTyPwkt5UGGb6eegaNejhkvpKM-o-voGALUwagEsQ0sWprq8TRhTHBnj0p1cwkLs2SaypvRikmgPRfoBlHpi-ZX7--1OefDZStoORnJSVcAF-QyuhOcDH1MlmohnhGQ2Ai9h3Y53M2LrzUmbw8yQ1FOZ3jkqOkPYndNLfo7N-y87irK29Hk-rbZKcwtJMZlONEErWVJdZp7e263-ABDOBtx0n5OnATfnIJYOjlXGwYm0Ke0~1HHTBege98bcpo8nV1w__"),
            const Text(
              AppStrings.toast,
              style: TextStyle(color: AppColors.txt1, fontSize: 45),
            ),
            const Text(AppStrings.greatness),
            const SizedBox(height: 15),
            const Center(
                child: Text(
              AppStrings.cheers,
              style: TextStyle(fontSize: 20),
            )),
            const Spacer(),
            elvBtn(AppStrings.cont, "/screen1", context, 50, double.infinity)
          ],
        ),
      ),
    );
  }
}
