import 'package:bams_project/components/App-string.dart';
import 'package:bams_project/components/cancel-button.dart';
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
  void initState() {
    super.initState();
    final _box = Hive.box('DataBase');
    final box = _box.get('authData');
    print(box);
    if (box != null) {
      Navigator.pushNamed(context, '/screen1');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            cancelButton(context),
            // Image.network(''),
            appHead(AppStrings.toast),
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
