import 'dart:convert';

import 'package:bams_project/components/App-string.dart';
import 'package:bams_project/components/cancel-button.dart';
import 'package:bams_project/controller/Service_Provider/api_calls/request.dart';
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
  final Map<String, String> _payLoad = {};
  bool displayT = true;

  get _validForm {
    for (var k in formFields.keys) {
      if (_payLoad[k] == null || _payLoad[k]!.isEmpty) return false;
    }
    return true;
  }

  displayState(bool display) {
    setState(() {
      displayT = display;
    });
  }

  Endpoint endPoint = Endpoint();

  _req() async {
    final data = {
      'fname': formFields['firstName']['controller'].text.trim(),
      'lname': formFields['lastName']['controller'].text.trim(),
      'phone': formFields['phone']['controller'].text.trim(),
      'mail': formFields['mail']['controller'].text.trim(),
    };

    var response = await endPoint.postMethod(data);
    print(response.body);
    jsonDecode(response.body);
    try {
      if (response.statusCode == 200) {
        print(response.body);
        print('New user just sign in now..');
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushNamed("/verification");
      }
    } catch (e) {
      // displayState(true);
      throw Exception(e);
    }
  }

  Map<String, dynamic> formFields = {
    'firstName': {
      'valid': false,
      'controller': TextEditingController(),
      'focusNode': FocusNode()
    },
    'lastName': {
      'valid': false,
      'controller': TextEditingController(),
      'focusNode': FocusNode()
    },
    'phone': {
      'valid': false,
      'controller': TextEditingController(),
      'focusNode': FocusNode()
    },
    'mail': {
      'valid': false,
      'controller': TextEditingController(),
      'focusNode': FocusNode()
    }
  };

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
              appHead(AppStrings.register),
              const SizedBox(height: 10),
              const Text(AppStrings.regTxt,
                  style: TextStyle(color: AppColors.txt2)),
              const SizedBox(height: 30),
              AppField(
                keyboardType: TextInputType.name,
                hint: AppStrings.firstname,
                heigth: 7,
                controller: formFields['firstName']['controller'],
                onChangecallback: (value) {
                  setState(() {
                    _payLoad['firstName'] = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              AppField(
                keyboardType: TextInputType.name,
                hint: AppStrings.lastname,
                heigth: 7,
                controller: formFields['lastName']['controller'],
                onChangecallback: (value) {
                  setState(() {
                    _payLoad['lastName'] = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              AppField(
                keyboardType: TextInputType.number,
                hint: AppStrings.phone,
                heigth: 7,
                controller: formFields['phone']['controller'],
                onChangecallback: (value) {
                  if (value.length > 11) {
                    formFields['phone']['controller'].text =
                        value.substring(0, 11);
                    TextSelection.fromPosition(TextPosition(
                        offset: formFields['phone']['controller'].text.length));
                  }
                  setState(() {
                    _payLoad['phone'] =
                        value.length > 11 ? value.substring(0, 11) : value;
                  });
                },
              ),
              const SizedBox(height: 20),
              AppField(
                keyboardType: TextInputType.emailAddress,
                hint: AppStrings.gmail,
                heigth: 7,
                controller: formFields['mail']['controller'],
                onChangecallback: (value) {
                  setState(() {
                    _payLoad['mail'] = value;
                  });
                },
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    onPressed: !_validForm
                        ? null
                        : () {
                            const snackbar = SnackBar(
                              content:
                                  Text('verification successfully created..'),
                              backgroundColor: AppColors.success,
                            );

                            displayState(false);
                            Navigator.of(context).pushNamed("/verification");

                            // _req();
                            for (var f in formFields.values) {
                              f['controller'].clear();
                            }
                            // displayState(true);
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackbar);
                          },
                    style: ElevatedButton.styleFrom(
                        disabledBackgroundColor: const Color(0xFF6CACE1),
                        backgroundColor: AppColors.btn1,
                        foregroundColor: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        displayT
                            ? const Text(AppStrings.cont)
                            : const Center(
                                child: CircularProgressIndicator(
                                  strokeWidth: 2.0,
                                ),
                              )
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
