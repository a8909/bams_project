import 'package:bams_project/App-string.dart';
import 'package:bams_project/color-template.dart';
import 'package:bams_project/other-account.dart';
// import 'package:bams_project/elevatedBut.dart';

// import 'package:bams_project/textfield.dart';
import 'package:bams_project/top-content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';

class TransferMoney extends StatefulWidget {
  const TransferMoney({super.key});

  @override
  State<TransferMoney> createState() => _TransferMoneyState();
}

class _TransferMoneyState extends State<TransferMoney> {
  bool isMyAccount = true;
  List<String> accounts = ["Own Account", "Others Account"];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                AppStrings.transfermoney,
                style: TextStyle(color: AppColors.btn2, fontSize: 40),
              ),
              const SizedBox(
                height: 20,
              ),
              // SwitchAccount(accountType: isMyAccount),
              FlutterToggleTab(
                labels: accounts,
                selectedLabelIndex: (p0) {
                  setState(() {
                    selectedIndex = p0;
                  });
                },
                selectedIndex: selectedIndex,
                selectedTextStyle: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black),
                height: 50,
                width: 90,
                borderRadius: 30,
                selectedBackgroundColors: [Colors.white],
                unSelectedBackgroundColors: [Colors.grey],
              ),
              const SizedBox(height: 30),
              (selectedIndex.isEven)
                  ? ownAccount(context)
                  : const OtherAccount(),
            ],
          ),
        ),
      ),
    );
  }
}

// enum Account{own, others}
Container fromTo(String from, String accNo) {
  return Container(
    height: 80,
    width: 150,
    decoration: BoxDecoration(
        border: Border.all(color: Colors.black.withOpacity(0.2)),
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(7))),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(from),
              const Icon(Icons.keyboard_arrow_down_outlined)
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          // Image.asset(name),
          Text(accNo)
        ],
      ),
    ),
  );
}
