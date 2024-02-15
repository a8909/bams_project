import 'package:bams_project/controller/onboarding%20screens/page1.dart';
import 'package:bams_project/controller/onboarding%20screens/page2.dart';
import 'package:bams_project/controller/onboarding%20screens/page3.dart';
import 'package:flutter/material.dart';

class OnboardingScreens extends StatefulWidget {
  const OnboardingScreens({super.key});

  @override
  State<OnboardingScreens> createState() => _OnboardingScreensState();
}

class _OnboardingScreensState extends State<OnboardingScreens> {
  final _onboardingController = PageController();
  bool onboardingColor = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _onboardingController,
            onPageChanged: (value) {
              setState(() {
                onboardingColor = (value == 1);
              });
            },
            children: const [
              OnboardingScreen1(),
              Onboarding2(),
              Onboarding3(),
            ],
          ),
          onboardingBtns(context)
        ],
      ),
    );
  }
}
