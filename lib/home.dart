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
  // final BankAccount = ["First Bank of Nigeria", "United Bank for Africa"];

  // final bankLogo = [
  //   "https://s3-alpha-sig.figma.com/img/8298/9591/cb75460c9dcb5c0b1fa3ef95d6710125?Expires=1710720000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=mMlWM8ViIXoIjeBPJb4vmr8sgQRadH9vCjqct~TTucIDtOCTvYRvVtlBF4Aeb2LP3YFUCgwHCRDGZL4GCXwDBoTzxzVIEVde4St3OGsytbLW7822pnr1KeLVxXDhRHupjy1g2IefwCC0vCZriXArGcsDQATK25DHLaLTDrL1ueMj9ReZB8kZ6tNzjUWLtvno4fvIvip1uNvTO7tLxTuPnpENFa2GExaqbIJ1MU5z-~30Xe6-52NmFAu49p9gw-Be~WSPTOw-wpDBLMQLJp9Npn87gPTn1bg6CWtdHF4tR1kQ4VNMY6dIWXiL2ijWOaBfJ-ObB8hubaFOZbUflo1hvA__",
  //   "https://s3-alpha-sig.figma.com/img/297b/ab50/d2074174fabb817d067067bc6eec78f7?Expires=1710720000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=bnWPlIkTaqqVOgSO8m~yuzgaqDraec5K7otntXdOV8eOKXATuImZueuoV50GlAOzDOp8Vg2QjB2Ckk2QdTlNjEORIOGjNdoWLesato7pfmxP1Uba4wll2RNAqBARAjW2zrwRQ8ZDqD3Mg5vmk13MNGXnmiRqaq5rNWDXHnYAUpm8qZCszmD3zwIuPRH3K7QeKmTGbF7RZnRzGizCaksZIFJI~D7qsejtlJVeHJ6x53XKVxzUdvSC7GEf1kj9QbMszfiyGyXA9dSKGdCAo~Mw3XCpDQ6DBdjbC3SPqGlWzXJFq55creJPm0M8IgyTZxA823aLSwZUK7uDGdfKigCXxg__"
  // ];
  final monthList = ["Last 5 months", "Last 4 months", "Last month"];
  String valueChange = "Last 6 months";
  List<Home> bankForms = List.empty(growable: true);

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
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  cancelButton(context),
                                  const Text(
                                    AppStrings.addAccount,
                                    style: TextStyle(
                                        fontSize: 40, color: AppColors.txt1),
                                  ),
                                  const Text(
                                    AppStrings.local,
                                    style: TextStyle(fontSize: 10),
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
                                      "https://s3-alpha-sig.figma.com/img/46bc/9aa2/ede4a07c6d6b268dbf051bef02038cc1?Expires=1710720000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=kou4JWaWko46z~uRrQ51idZAfdGf-rIGBb0hdddH3Yc8~w1wvOn87F9VmZ-oyNlbDxg-9kkNkKMVjd-Rsg2RPFa-M5q7xkl2MuIPirJfdOridVzP0-njMg7Mn7WnnjhvdkKhuQbdFqnA1668yTeA~kcTzCko5-iwnHI07vWRXDe76mqYTszHgypbs5HgNraA-D563ZVlfHortnlxXsNI~rb6wFWhAmjIzP5Rse4XVgXjyemtpd5XRMvagXSQzx6EG4D968rCmAvvmTfW62r3cVlnLEOZ7CiXVs0qjoFLyum5UwPuIArBUa7Gfc0m-UHN0y1C89p-twasxnxv7ZqQXA__"),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  (bankForms.isEmpty)
                                      ? const Text("")
                                      : ListView.builder(
                                          itemCount: bankForms.length,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            final scrollController =
                                                ScrollController();
                                            List<TextEditingController>
                                                _banknameController = [
                                              TextEditingController()
                                            ];
                                            return SingleChildScrollView(
                                              controller: scrollController,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        16, 8, 16, 8),
                                                child: Column(
                                                  children: [
                                                    TextFormField(
                                                      onChanged: (value) =>
                                                          widget.bankObject
                                                              .name = value,
                                                      onSaved: (newValue) =>
                                                          widget.bankObject
                                                              .name ==
                                                          newValue,
                                                      controller:
                                                          _banknameController[
                                                              index],
                                                      decoration: const InputDecoration(
                                                          border: OutlineInputBorder(
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          7))),
                                                          hintText:
                                                              "Enter account number",
                                                          labelText:
                                                              "Enter account number"),
                                                    ),
                                                    const SizedBox(height: 10),
                                                    container(
                                                        "Guarantee Trust Bank",
                                                        "https://s3-alpha-sig.figma.com/img/46bc/9aa2/ede4a07c6d6b268dbf051bef02038cc1?Expires=1710720000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=kou4JWaWko46z~uRrQ51idZAfdGf-rIGBb0hdddH3Yc8~w1wvOn87F9VmZ-oyNlbDxg-9kkNkKMVjd-Rsg2RPFa-M5q7xkl2MuIPirJfdOridVzP0-njMg7Mn7WnnjhvdkKhuQbdFqnA1668yTeA~kcTzCko5-iwnHI07vWRXDe76mqYTszHgypbs5HgNraA-D563ZVlfHortnlxXsNI~rb6wFWhAmjIzP5Rse4XVgXjyemtpd5XRMvagXSQzx6EG4D968rCmAvvmTfW62r3cVlnLEOZ7CiXVs0qjoFLyum5UwPuIArBUa7Gfc0m-UHN0y1C89p-twasxnxv7ZqQXA__"),
                                                  ],
                                                ),
                                              ),
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
                                              bankForms.add(Home(
                                                  bankObject: BankObject(
                                                      name: widget
                                                          .bankObject.name)));
                                            });
                                          },
                                          style: OutlinedButton.styleFrom(
                                              backgroundColor:
                                                  Colors.grey.withOpacity(0.1),
                                              foregroundColor: Colors.grey),
                                          child: const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text("Add another account"),
                                              // Icon(Icons
                                              //     .add_circle_outline_outlined)
                                            ],
                                          )),
                                    ),
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    height: 50,
                                    width: double.infinity,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          showModalBottomSheet(
                                            context: context,
                                            builder: (context) {
                                              return const VerifyAccount();
                                            },
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                            // shape:  OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(7))),
                                            backgroundColor: AppColors.btn1),
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
                              // value: valueChange = valueChange,
                              items: monthList.map((e) {
                                return DropdownMenuItem(
                                    value: e, child: Text(e));
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  valueChange == value;
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

                      Center(
                        child: Image.network(
                            width: 200,
                            "https://s3-alpha-sig.figma.com/img/ea98/44da/314dc153d45c81e0f231af41598adb5b?Expires=1710720000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=SkqivKJV5PadUV8G9QItab9BtJZAGdQWEOiqaKYV~mZpobk~whixFncKtQZr50EAdxruAGbThZmrKkzHjyQAx5SQXZrHHW~jtM3Le3JmA7PdynxvrippG2RpxSe1dopg0Dg4dIdXZHiCtuNKmHAUIgQW7fYg9t-FZ12Es1vkkst-bSMqYD9dQPa-WE-tdlh2dcL7S7C1ACGRDqEkdEeup9jazGua7GsmaPMhRHsO5eIFOLlf8BiVUPd6rBgCxIj4g3wwrz4j6jo19~8mkh1bK~tUHpRV4FZtpbeXhFoMNI0R4ELSqwzMT2-P5IO9VAXdp79Ap1iN2vFW2dzKUfRSIA__"),
                      ),
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

String dropvalue = '';

Container container(String text, String networkImage) {
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
          Image.network(networkImage), // here should be passed as an image
          Text(text),

          IconButton(
              onPressed: () {
                DropdownButton(
                  value: dropvalue,
                  items: banks.map((e) {
                    return DropdownMenuItem(
                      value: e,
                      child: Text("$e"),
                    );
                  }).toList(),
                  onChanged: (value) {
                    print("$value");
                  },
                );
              },
              icon: const Icon(Icons.keyboard_arrow_down_outlined))
        ],
      ),
    ),
  );
}
