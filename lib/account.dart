import 'package:bams_project/color-template.dart';
import 'package:bams_project/models/bank_models.dart';
import 'package:bams_project/top-content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BankAccount extends StatelessWidget {
  BankAccount({super.key});
  List banks = [
    ["assets/images/gtb.png", "Tevi Adekunle F.", "3092773812"],
  ];

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
                height: 10,
              ),
              ListView.separated(
                shrinkWrap: true,
                itemCount: banks.length,
                itemBuilder: (context, index) {
                  return userItem(
                      banks[index][0], banks[index][1], banks[index][2]);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 8,
                  );
                },
              )
              // ...mockUsersFromServer()
            ],
          ),
        ));
  }
}

Widget userItem(String bankImage, bankName, accountNo) {
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
              Image.asset(bankImage),
              // AssetImage(assetName) this  should be passed dynamically from end point
              Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text(bankName), Text(accountNo)],
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

// List<Widget> mockUsersFromServer() {
//   List<Widget> users = [];
//   for (var i = 0; i < 1000; i++) {
//     users.add(userItem());
//   }
//   return users;
// }

