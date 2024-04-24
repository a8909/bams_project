import 'dart:js';

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
  bool _canCheckBiometric = false;
  List<BiometricType>? available;
  String success = "Authorization Successful";
  String unsuccessful = "Authorization failed";

  Future<void> _checkBiomerics() async {
    bool canCheckBiometric = false;
    try {
      canCheckBiometric = await auth.canCheckBiometrics;
    } catch (e) {
      print(e);
    }
    if (!mounted) return;
    setState(() {
      _canCheckBiometric = canCheckBiometric;
    });
  }

  Future<void> getAvailableBiometric() async {
    List<BiometricType>? availableBiometric;
    try {
      availableBiometric = await auth.getAvailableBiometrics();
    } catch (e) {
      print(e);
    }
    setState(() {
      available = availableBiometric;
    });
  }

  Future<void> authenticate() async {
    bool canAuthenticate = false;
    try {
      canAuthenticate = await auth.authenticate(
        localizedReason: "Permission to login to App",
        options: const AuthenticationOptions(
          biometricOnly: true,
          useErrorDialogs: true,
          stickyAuth: true,
        ),
      );
    } catch (e) {
      print("Error message : $e");
    }
    if (!mounted) return;
    setState(() {
      canAuthenticate ? print(success) : print(unsuccessful);
      Navigator.of(context as BuildContext).pushNamed("/screen1");
    });
    return authenticate();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getAvailableBiometric();
    _checkBiomerics();
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: () => authenticate(),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.btn2,
          borderRadius: BorderRadius.all(Radius.circular(7)),
        ),
        // width: screensize.width,
        // height: screensize.height,
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
