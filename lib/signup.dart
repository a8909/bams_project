import 'package:bams_project/App-string.dart';
import 'package:bams_project/textfield.dart';
import 'package:bams_project/top-content.dart';
import 'package:flutter/material.dart';

import 'color-template.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController controller = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();
  final controller4 = TextEditingController();
  var firstName = "";
  var lastName = "";
  var phone = "";
  var gmail = "";
  bool buttonController = true;
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
                AppStrings.register,
                style: TextStyle(color: AppColors.txt1, fontSize: 50),
              ),
              const SizedBox(height: 10),
              const Text(AppStrings.regTxt,
                  style: TextStyle(color: AppColors.txt2)),
              const SizedBox(height: 30),
              AppField(
                keyboardType: TextInputType.name,
                hint: AppStrings.firstname,
                heigth: 7,
                controller: controller,
                onChangecallback: (value) {
                  firstName = value;
                },
              ),
              const SizedBox(height: 20),
              AppField(
                keyboardType: TextInputType.name,
                hint: AppStrings.lastname,
                heigth: 7,
                controller: controller2,
                onChangecallback: (value) {
                  lastName = value;
                },
              ),
              const SizedBox(height: 20),
              AppField(
                keyboardType: TextInputType.number,
                hint: AppStrings.phone,
                heigth: 7,
                controller: controller3,
                onChangecallback: (value) {
                  phone = value;
                },
              ),
              const SizedBox(height: 20),
              AppField(
                keyboardType: TextInputType.emailAddress,
                hint: AppStrings.gmail,
                heigth: 7,
                controller: controller4,
                onChangecallback: (value) {
                  gmail = value;
                },
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      if (controller2.text.isEmpty &&
                          controller3.text.isEmpty &&
                          controller4.text.isEmpty) {
                        snackBar(
                            'Make sure no field is empty!', AppColors.danger);

                        ScaffoldMessenger.of(context)
                            .showSnackBar(snackBar as SnackBar);
                      } else {
                        final snackbar = snackBar(
                            'verification successfully created..',
                            AppColors.success);

                        Navigator.of(context).pushNamed("/verification");
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.btn1,
                        foregroundColor: Colors.white),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text(AppStrings.cont)],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

snackBar(String content, var color) {
  return SnackBar(
    content: Text(content),
    backgroundColor: color,
  );
}
// var snackBar = const 
