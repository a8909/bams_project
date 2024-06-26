import 'package:bams_project/App-string.dart';
import 'package:bams_project/cancel-button.dart';
import 'package:bams_project/color-template.dart';
import 'package:bams_project/data/database.dart';
import 'package:bams_project/elevatedBut.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Toast extends StatefulWidget {
  const Toast({super.key});

  @override
  State<Toast> createState() => _ToastState();
}

class _ToastState extends State<Toast> {
  @override
  Widget build(BuildContext context) {
    final _box = Hive.box('DataBase');
    BamsDataBase dbBox = BamsDataBase();
    @override
    void initState() {
      super.initState();

      if (_box.get('tst') == null) {
        dbBox.createInitaialDb();
      } else {
        dbBox.deleteDb();
      }
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            cancelButton(context),
            // Image.network(
            // "https://s3-alpha-sig.figma.com/img/e69c/
            // 6c61/c07093e9fadcc6eee2cc3b4cd4f5874c?
            // Expires=1714953600&Key-Pair-Id=APKAQ
            // 4GOSFWCVNEHN3O4&Signature=c9cKbvLuim
            // DeWulE6nVOhDV-zGXOofPIWs6DBQ6RBi0WPqS
            // DoMLRvTZPmueFDqjy71TDQK0y~s9sVLE-ku
            // RbiQ-l7CIL2-IWMoG3a0o6UP~wg6iUIDIF
            // 8M8WIHijJV86ebjhkmWWy9SGcOrWlpFIzA
            // 7yigcaksfvMjE~4ojPbyI6Ndur304y7uR1
            // SWQ16wCm59Se7P1yUn0NjXDQDFXiF9biQd
            // n0d3qbqJs5NWLLcaSID4M41ZrrJAQcVpA
            // csmOEi04wGe-frdzJeukzv6Gxxit166R5
            // fv~Xu8NmwPv8r~G-L89jc-htGvzIC3tVu
            // vvcJCYEK41wxRiboYh0mO0g1w__"),
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
