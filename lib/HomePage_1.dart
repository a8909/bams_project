import 'package:bams_project/App-string.dart';
import 'package:bams_project/color-template.dart';
import 'package:bams_project/elevatedBut.dart';
// import 'package:bams_project/elevatedBut.dart';
import 'package:bams_project/top-content.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 70, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                AppStrings.welcome,
                style: TextStyle(color: AppColors.txt1),
              ),
              const Text(
                AppStrings.font,
                style: TextStyle(color: AppColors.txt2, fontSize: 50),
              ),
              const SizedBox(
                height: 50,
              ),
              cnt("date", "+#92,800"),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  height: 100,
                  width: 300,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0, 2),
                            blurRadius: 2,
                            blurStyle: BlurStyle.inner)
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Tevi Adekunle Fabrizo-Romano"),
                        Row(
                          children: [
                            const Text(
                              "3092773812",
                              style: TextStyle(
                                  fontSize: 10, color: AppColors.fadeTxt),
                            ),
                            Container(
                              height: 20,
                              width: 100,
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(234, 242, 242, 242),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Current Account",
                                    style: style(),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            const Text("₦"),
                            Text(
                              "2,003,000.",
                              style: styles(25),
                            ),
                            const Text(
                              "00",
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: cnt("date", "#24,000")),
              const SizedBox(
                height: 30,
              ),
              elvBtn(
                  AppStrings.signup, "/signup", context, 50, double.infinity),

              const SizedBox(
                height: 10,
              ),
              SizedBox(
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

              // elvBtn("Log in", "/login")
            ],
          ),
        ),
      ),
    );
  }
}

Container cnt(String date, String amount) {
  return Container(
    height: 40,
    width: 300,
    decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 2),
              blurRadius: 2,
              blurStyle: BlurStyle.inner)
        ],
        borderRadius: BorderRadius.all(Radius.circular(5))),
    child: Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: const Color.fromARGB(220, 229, 236, 255),
                foregroundColor: const Color.fromARGB(234, 48, 120, 227),
                radius: 15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "AC",
                      style: style(),
                    ),
                  ],
                ),
              )
            ],
          ),
          // Row(
          //   children: [Text("Today 3:30:26pm")],
          // ),
          const Padding(
            padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
            child: Column(
              children: [
                Text("From Adekunle Ciroma.j"),
              ],
            ),
          ),
          Text(amount)
        ],
      ),
    ),
  );
}
