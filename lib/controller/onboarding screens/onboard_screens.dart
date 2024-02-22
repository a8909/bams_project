import 'package:flutter/material.dart';

import 'page1.dart';
import 'page2.dart';
import 'page3.dart';

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
      backgroundColor: onboardingColor ? Colors.blue : Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: _onboardingController,
            onPageChanged: (value) {
              setState(() {
                onboardingColor = (value == 0);
              });
            },
            children: const [
              OnboardingScreen1(),
              Onboarding2(),
              Onboarding3(),
            ],
          ),
          // const Spacer(),
          Align(
              alignment: Alignment.bottomCenter, child: onboardingBtns(context))
        ],
      ),
    );
  }
}
