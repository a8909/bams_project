import 'package:bams_project/bankUserAccount.dart';
import 'package:bams_project/color-template.dart';
import 'package:bams_project/models/bankDetails_model.dart';
import 'package:bams_project/models/bank_models.dart';
import 'package:bams_project/top-content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BankAccount extends StatelessWidget {
  BankAccount({super.key});
  final accountUser = BankInfo();

  @override
  Widget build(BuildContext context) {
    return Consumer<BankInfo>(
        builder: (context, value, child) => Scaffold(
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
                    itemCount: accountUser.banksUserList.length,
                    itemBuilder: (context, index) {
                      BankUser bankies = value.getbankUserList()[index];
                      return Useritem(bankies: bankies);

                      // userItem(accountUser.banks[index][0],
                      //     accountUser.banks[index][1], accountUser.banks[index][2]);
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
            )));
  }
}


// List<Widget> mockUsersFromServer() {
//   List<Widget> users = [];
//   for (var i = 0; i < 1000; i++) {
//     users.add(userItem());
//   }
//   return users;
// }

