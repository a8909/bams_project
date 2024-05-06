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
            const SizedBox(height: 20),
            cancelButton(context),
            // Image.network(
            // "https://s3-alpha-sig.figma.com/img/e69c/6c61/c07093e9fadcc6eee2cc3b4cd4f5874c?Expires=1714953600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=c9cKbvLuimDeWulE6nVOhDV-zGXOofPIWs6DBQ6RBi0WPqSDoMLRvTZPmueFDqjy71TDQK0y~s9sVLE-kuRbiQ-l7CIL2-IWMoG3a0o6UP~wg6iUIDIF8M8WIHijJV86ebjhkmWWy9SGcOrWlpFIzA7yigcaksfvMjE~4ojPbyI6Ndur304y7uR1SWQ16wCm59Se7P1yUn0NjXDQDFXiF9biQdn0d3qbqJs5NWLLcaSID4M41ZrrJAQcVpAcsmOEi04wGe-frdzJeukzv6Gxxit166R5fv~Xu8NmwPv8r~G-L89jc-htGvzIC3tVuvvcJCYEK41wxRiboYh0mO0g1w__"),
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
