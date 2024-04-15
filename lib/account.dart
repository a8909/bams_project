import 'package:bams_project/color-template.dart';
import 'package:bams_project/top-content.dart';
import 'package:flutter/material.dart';

class BankAccount extends StatelessWidget {
  const BankAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 8, 16.0, 8),
          child: ListView(
            children: [
              const Text(
                "Accounts",
                style: TextStyle(color: AppColors.btn2, fontSize: 40),
              ),
              const SizedBox(
                height: 20,
              ),
              ...mockUsersFromServer()
            ],
          ),
        ));
  }
}

Widget userItem() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 100,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(1),
              borderRadius: const BorderRadius.all(Radius.circular(7))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset("assets/images/gtb.png"),
              // AssetImage(assetName) this  should be passed dynamically from end point
              Container(
                  child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("Tevi Adekunle F."), Text("3092773812")],
              )),
              Container(
                height: 20,
                width: 100,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(234, 242, 242, 242),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Current Account",
                      style: style(),
                    )
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios_outlined)
            ],
          ),
        )
      ],
    ),
  );
}

List<Widget> mockUsersFromServer() {
  List<Widget> users = [];
  for (var i = 0; i < 1000; i++) {
    users.add(userItem());
  }
  return users;
}
