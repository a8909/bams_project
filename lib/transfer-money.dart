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

Container fromTo(String from, String image, String accNo) {
  // final List<Map<dynamic, String>> bankState = [
  //   {"accountNumber": "2263997831", "bankLogo": "assets/images/gtb.png"},
  //   {"accountNumber": "2263997831", "bankLogo": "assets/images/gtb.png"}
  // ];
  var items = ["9090397455", "9034500772", "2263997831"];
  String itemchange = "";

  void setState(Null Function() param0) {
    return setState(() {});
  }

  return Container(
    height: 120,
    width: 156,
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
              DropdownButton(
                underline: const SizedBox(
                  height: 0,
                ),
                value: "2263997831",
                icon: const Icon(Icons.keyboard_arrow_down_outlined),
                items: items.map((e) {
                  return DropdownMenuItem(
                      value: e,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            "assets/images/gtb.png",
                            width: 30,
                            height: 30,
                          ),
                          Text(e, style: const TextStyle(fontSize: 10))
                        ],
                      )

                      // ListView.builder(
                      //   shrinkWrap: true,
                      //   itemCount: items.length,
                      //   itemBuilder: (context, index) {
                      //     return ListTile(
                      //       leading: Image.asset("assets/images/gtb.png"),
                      //       trailing: Text(
                      //         e,
                      //         style: const TextStyle(fontSize: 10),
                      //       ),
                      //     );
                      //   },
                      // )

                      );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    itemchange = value!;
                  });
                },
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15)),
                  child: Image.asset(
                    image,
                    width: 40,
                    height: 40,
                  )),
              Text(accNo),
            ],
          )
        ],
      ),
    ),
  );
}
