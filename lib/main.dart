import 'package:bams_project/HomePage_1.dart';
import 'package:bams_project/controller/Service_Provider/app_repo.dart';
import 'package:bams_project/controller/Service_Provider/login_provider.dart';
import 'package:bams_project/controller/dependency_injection.dart';
import 'package:bams_project/controller/onboarding%20screens/onboard_screens.dart';
import 'package:bams_project/controller/splash.dart';
import 'package:bams_project/global-string.dart';
import 'package:bams_project/login.dart';
import 'package:bams_project/screen_1.dart';
import 'package:bams_project/signIn.dart';
import 'package:bams_project/signup.dart';
import 'package:bams_project/toast.dart';
import 'package:bams_project/transfer-money.dart';
import 'package:bams_project/transfer.dart';
import 'package:bams_project/verify-account.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'otp-verificaion.dart';

Future<void> main() async {
  runApp(ChangeNotifierProvider<AppRepo>(
      create: (BuildContext context) => AppRepo(), child: const MyApp()));
  DependencyInjection.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: "Recoleta"),
      initialRoute: "/",
      routes: {
        '/': (context) => const SplashScreen(),
        firstScreen: (context) => const OnboardingScreens(),
        mainpage: (context) => const MainPage(),
        login: (context) => ChangeNotifierProvider(
            create: (context) => LoginProvider(), child: const LogIn()),
        signup: (context) => const SignUp(),
        verification: (context) => const Verification(),
        signin: (context) => const SignIn(),
        toast: (context) => const Toast(),
        screen1: (context) => const Screen1(),
        verifyaccount: (context) => const VerifyAccount(),
        transfer: (context) => const Transfer(),
        transfermoney: (context) => const TransferMoney()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
