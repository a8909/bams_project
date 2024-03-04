import 'package:bams_project/HomePage_1.dart';
import 'package:bams_project/homepage2..dart';
import 'package:flutter/material.dart';

import 'App-string.dart';
import 'color-template.dart';
import 'elevatedBut.dart';

class HomepageController extends StatefulWidget {
  const HomepageController({super.key});

  @override
  State<HomepageController> createState() => _HomepageControllerState();
}

class _HomepageControllerState extends State<HomepageController> {
  final _controller = PageController();
  int currentPage = 0;
  List<Widget> pages = [
    const MainPage2(imagePath: ""),
    const MainPage(),
    const MainPage2(imagePath: "")
  ];

  void onPageChange(int value) {
    if (currentPage == 0) {
      pages[0];
    } else if (currentPage == 1) {
      pages[1];
    }
    setState(() {
      currentPage == value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              onPageChanged: (value) => onPageChange(value),
              itemCount: pages.length,
              controller: _controller,
              itemBuilder: (context, index) {
                return pages[index];
              },
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 0, 16, 0),
            child: elvBtn(
                AppStrings.signup, "/signup", context, 50, double.infinity),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 0, 16, 10),
            child: SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/login");
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.btn2,
                      foregroundColor: Colors.black
                      // Color.fromARGB(a as int, r as int, g as int, b as int)
                      ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text(AppStrings.login)],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
