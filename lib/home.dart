import 'package:bams_project/App-string.dart';
import 'package:bams_project/cancel-button.dart';
import 'package:bams_project/controller/onboarding%20screens/bank_call.dart';
import 'package:bams_project/textfield.dart';
import 'package:bams_project/verify-account.dart';
import 'package:flutter/material.dart';

import 'color-template.dart';

class Home extends StatefulWidget {
  late final BankObject bankObject;

  Home({super.key, required this.bankObject});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final bankResponse = [
    {"logo": "assets/images/firstbank.png", "banklist": "First Bank Of Nigeria"}
  ];
  var monthList = ["Last 5 months", "Last 4 months", "Last month"];
  String dropdownvalue = "Last 6 months";
  // List<Views> bankForms = List.empty(growable: true);
  List<Widget> userForm = [];

  serverInput() {
    for (var pro = 0; pro < 1; pro++) {
      userForm
          .add(view("First Bank Of Nigeria", "assets/images/firstbank.png"));
    }
  }

  final TextEditingController controller = TextEditingController();
  final _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 20,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text(AppStrings.jd)],
                    ),
                  ),
                  Icon(
                    Icons.notifications_none_outlined,
                    size: 30,
                  )
                ],
              ),
              SizedBox(
                height: 30,
                width: 150,
                child: OutlinedButton(
                    onPressed: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) {
                          return DraggableScrollableSheet(
                            initialChildSize: 0.85,
                            maxChildSize: 0.9,
                            minChildSize: 0.5,
                            builder: (BuildContext context,
                                ScrollController scrollController) {
                              return Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20)),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: ListView(
                                    controller: scrollController,

                                    // mainAxisSize: MainAxisSize.min,
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      cancelButton(context),
                                      const Text(
                                        AppStrings.addAccount,
                                        style: TextStyle(
                                            fontSize: 40,
                                            color: AppColors.txt1),
                                      ),
                                      const Text(
                                        AppStrings.local,
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      const SizedBox(height: 10),
                                      TextFormField(
                                        onChanged: (value) =>
                                            widget.bankObject.name = value,
                                        onSaved: (newValue) =>
                                            widget.bankObject.name == newValue,
                                        controller: controller,
                                        decoration: const InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(7))),
                                            hintText: "Enter account number",
                                            labelText: "Enter account number"),
                                      ),
                                      const SizedBox(height: 10),
                                      container("Guarantee Trust Bank",
                                          "assets/images/gtb.png"),
                                      const SizedBox(
                                        height: 24,
                                      ),
                                      (userForm.isEmpty)
                                          ? const Text("")
                                          : ListView.separated(
                                              itemCount: userForm.length,
                                              shrinkWrap: true,
                                              controller: ScrollController(),
                                              itemBuilder: (context, index) {
                                                var finalUser = [];
                                                List<TextEditingController>
                                                    _banknameController = [
                                                  TextEditingController()
                                                ];
                                                if (userForm.isNotEmpty) {
                                                  for (var user in userForm) {
                                                    print("${user} is here");
                                                    finalUser.add(user);
                                                  }
                                                } else {
                                                  print(
                                                      "${finalUser}, out of limit");
                                                }

                                                // print(finalUser.length);
                                                return finalUser[index];
                                              },
                                              separatorBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return const SizedBox(
                                                  height: 24,
                                                );
                                              },
                                            ),
                                      const SizedBox(height: 10),
                                      Align(
                                        alignment: Alignment.center,
                                        child: SizedBox(
                                          height: 50,
                                          width: 180,
                                          child: OutlinedButton(
                                              onPressed: () {
                                                setState(() {
                                                  serverInput();

                                                  // userForm.add(Views(
                                                  //         bankName: "bankName",
                                                  //         bankImage:
                                                  //             "bankImage",
                                                  //         bankobj: BankObject(
                                                  //             name: widget
                                                  //                 .bankObject
                                                  //                 .name))

                                                  //     // Home(
                                                  //     //   bankObject: BankObject(
                                                  //     //       name: widget
                                                  //     //           .bankObject
                                                  //     //           .name))
                                                  //     );
                                                });
                                              },
                                              style: OutlinedButton.styleFrom(
                                                  backgroundColor: AppColors
                                                      .btn2
                                                      .withOpacity(0.1),
                                                  foregroundColor:
                                                      Colors.black),
                                              child: const Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text("Add another account"),
                                                  // Icon(Icons
                                                  //     .add_circle_outline_outlined)
                                                ],
                                              )),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 160,
                                      ),
                                      SizedBox(
                                        height: 50,
                                        width: double.infinity,
                                        child: ElevatedButton(
                                            onPressed: () {
                                              showModalBottomSheet(
                                                shape:
                                                    const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.vertical(
                                                                top: Radius
                                                                    .circular(
                                                                        20))),
                                                context: context,
                                                builder: (context) {
                                                  return const VerifyAccount();
                                                },
                                              );
                                            },
                                            style: ElevatedButton.styleFrom(
                                                // shape:  OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(7))),
                                                backgroundColor:
                                                    AppColors.btn1),
                                            child: const Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [Text(AppStrings.done)],
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                    child: const Row(
                      children: [
                        Text("Add accounts"),
                        Icon(Icons.add_circle_outline_outlined)
                      ],
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              const Spacer(),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                height: 300,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(AppStrings.transactionhistory),
                          Container(
                            height: 30,
                            width: 140,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.5),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5))),
                            child: DropdownButton(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(7)),
                              // value: dropdownvalue,
                              items: monthList.map((e) {
                                return DropdownMenuItem(
                                    value: e, child: Text(e));
                              }).toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  dropdownvalue = value!;
                                });
                              },
                            ),
                          )
                        ],
                      ),
                      // const CircleAvatar(
                      //   radius: 40,
                      //   backgroundImage: AssetImage("assetName"),
                      // )
                      const SizedBox(
                        height: 50,
                      ),

                      // Center(
                      //   child: Image.network(
                      //       width: 200,
                      //       "https://s3-alpha-sig.figma.com/img/ea98/44da/314dc153d45c81e0f231af41598adb5b?Expires=1710720000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=SkqivKJV5PadUV8G9QItab9BtJZAGdQWEOiqaKYV~mZpobk~whixFncKtQZr50EAdxruAGbThZmrKkzHjyQAx5SQXZrHHW~jtM3Le3JmA7PdynxvrippG2RpxSe1dopg0Dg4dIdXZHiCtuNKmHAUIgQW7fYg9t-FZ12Es1vkkst-bSMqYD9dQPa-WE-tdlh2dcL7S7C1ACGRDqEkdEeup9jazGua7GsmaPMhRHsO5eIFOLlf8BiVUPd6rBgCxIj4g3wwrz4j6jo19~8mkh1bK~tUHpRV4FZtpbeXhFoMNI0R4ELSqwzMT2-P5IO9VAXdp79Ap1iN2vFW2dzKUfRSIA__"),
                      // ),
                      const Text(
                        "Oops!",
                        style: TextStyle(fontSize: 10),
                      ),
                      Text(
                        "We don’t have any transaction to show yet. ",
                        style: TextStyle(color: Colors.black.withOpacity(0.5)),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final banks = [
  {
    "bank_name": "GTB",
    "image":
        "https://s3-alpha-sig.figma.com/img/8298/9591/cb75460c9dcb5c0b1fa3ef95d6710125?Expires=1710720000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=mMlWM8ViIXoIjeBPJb4vmr8sgQRadH9vCjqct~TTucIDtOCTvYRvVtlBF4Aeb2LP3YFUCgwHCRDGZL4GCXwDBoTzxzVIEVde4St3OGsytbLW7822pnr1KeLVxXDhRHupjy1g2IefwCC0vCZriXArGcsDQATK25DHLaLTDrL1ueMj9ReZB8kZ6tNzjUWLtvno4fvIvip1uNvTO7tLxTuPnpENFa2GExaqbIJ1MU5z-~30Xe6-52NmFAu49p9gw-Be~WSPTOw-wpDBLMQLJp9Npn87gPTn1bg6CWtdHF4tR1kQ4VNMY6dIWXiL2ijWOaBfJ-ObB8hubaFOZbUflo1hvA__"
  }
];

Container container(String text, String image) {
  var items = ["First Bank Of Nigeria"];
  String dropvalue = '';

  void setState(Null Function() param0) {
    return setState(() {});
  }

  return Container(
    height: 70,
    width: double.infinity,
    decoration: BoxDecoration(
        // color: Colors.white.withOpacity(0.1),
        border: Border.all(color: Colors.grey),
        borderRadius: const BorderRadius.all(Radius.circular(5))),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Image.asset(image),
          // // Image.network(networkImage), // here should be passed as an image
          // Text(text),

          DropdownButton(
            value: "First Bank Of Nigeria",
            underline: const SizedBox(),
            icon: const Icon(Icons.keyboard_arrow_down_outlined),
            items: items.map((e) {
              return DropdownMenuItem(
                value: e,
                child: Row(
                  children: [Image.asset(image), Text(text)],
                ),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                dropvalue == value;
              });
            },
          )
        ],
      ),
    ),
  );
}

Widget view(String bankName, String bankImage) {
  return StatefulBuilder(
    builder: (context, setState) {
      final controller = TextEditingController();
      final bankObj = BankObject(name: "");

      return Container(
        child: Column(
          children: [
            TextFormField(
              onChanged: (value) => bankObj.name = value,
              onSaved: (newValue) => bankObj.name == newValue,
              controller: controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7))),
                  hintText: "Enter account number",
                  labelText: "Enter account number"),
            ),
            const SizedBox(height: 10),
            container(bankName, bankImage),
          ],
        ),
      );
    },
  );
}

// List<Widget> userBankForm (){

//                                                 return userForm;
// }