// import 'package:bams_project/controller/onboarding%20screens/onboard_screens.dart';
import 'package:bams_project/homePageController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigatetoOnboarding();
  }

  _navigatetoOnboarding() async {
    await Future.delayed(const Duration(milliseconds: 2000), () {
      print("new route is onboarding");
    });

    Get.off(() => const HomepageController());
    // Navigator.pushReplacement(
    //     context, MaterialPageRoute(builder: (context) => const MainPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        child: const Text(
          "bambs",
          style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
        ),
      )),
    );
  }
}
