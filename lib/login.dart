import 'package:bams_project/App-string.dart';
import 'package:bams_project/color-template.dart';
import 'package:bams_project/elevatedBut.dart';
import 'package:bams_project/fingerprint.dart';
import 'package:bams_project/textfield.dart';
import 'package:bams_project/top-content.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  String readMessage = '';

  Future<void> loginUser() async {
    final url = "fgfg";
    final response = await http.post(Uri.parse(url), body: {
      'email': emailcontroller.text,
      'password': passwordcontroller.text
    });

    try {
      if (response.statusCode == 200) {
        readMessage = "Access Granted";
        print(readMessage);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                AppStrings.capLog,
                style: TextStyle(fontSize: 50, color: AppColors.txt1),
              ),
              const Text(
                AppStrings.logtxt,
                style: TextStyle(color: AppColors.txt2),
              ),
              const SizedBox(
                height: 50,
              ),
              AppField(
                hint: AppStrings.email,
                heigth: 7,
                controller: emailcontroller,
              ),
              const SizedBox(
                height: 20,
              ),
              TxtField(
                label: AppStrings.password,
                controller: passwordcontroller,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  elvBtn(AppStrings.login, "/screen1", context, 50, 266),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: FingerPrint(),
                  )
                  // fingerprint layout
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(AppStrings.account,
                      style: TextStyle(fontSize: 12, color: Colors.black)),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed("/signup");
                      },
                      child: const Row(
                        children: [
                          Text(
                            AppStrings.signup,
                            style:
                                TextStyle(fontSize: 12, color: AppColors.btn1),
                          )
                        ],
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
