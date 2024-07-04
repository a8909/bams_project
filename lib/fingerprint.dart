// import 'dart:js';

import 'package:bams_project/color-template.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class FingerPrint extends StatefulWidget {
  const FingerPrint({super.key});

  @override
  State<FingerPrint> createState() => _FingerPrintState();
}

class _FingerPrintState extends State<FingerPrint> {
  LocalAuthentication auth = LocalAuthentication();
  bool canCheckBiometrics = true;
  List<BiometricType>? available;
  String success = "Authorization Successful";
  String unsuccessful = "Authorization failed";

  Future<void> authenticate() async {
    try {
      bool isAuthenticated = await auth.authenticate(
        localizedReason: "Permission to login to App",
        options: const AuthenticationOptions(
          biometricOnly: true,
          useErrorDialogs: true,
          stickyAuth: true,
        ),
      );
      if (isAuthenticated) {}
    } catch (e) {
      print("Error message : $e");
    }
    // if (!mounted) return;
    // setState(() {
    //   isAuthenticated ? print(success) : print(unsuccessful);
    //   Navigator.of(context).pushNamed("/screen1");
    // });
    return authenticate();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: () => authenticate,
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.btn2,
          borderRadius: BorderRadius.all(Radius.circular(7)),
        ),
        child: ClipRRect(
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Column(
              children: [
                Image.asset(
                  "assets/images/fingerprint.png",
                  fit: BoxFit.cover,
                  height: 45,
                  width: 40,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
