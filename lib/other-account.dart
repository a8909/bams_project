import 'package:bams_project/cancel-button.dart';
import 'package:bams_project/color-template.dart';
import 'package:bams_project/elevatedBut.dart';
import 'package:bams_project/home.dart';
import 'package:bams_project/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'App-string.dart';
import 'transfer-money.dart';

class OtherAccount extends StatefulWidget {
  const OtherAccount({super.key});

  @override
  State<OtherAccount> createState() => _OtherAccountState();
}

class _OtherAccountState extends State<OtherAccount> {
  bool iconType = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppField(hint: "Amount to send?", heigth: 7),
        const SizedBox(height: 10),
        container("From"),
        const SizedBox(height: 10),
        const SizedBox(
          height: 50,
          width: 250,
          child: TextField(
              decoration: InputDecoration(
                  hintText: "Recepient",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7))))),
        ),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return StatefulBuilder(
                  builder: (context, setState) {
                    return Container(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            cancelButton(context),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(AppStrings.savedBeneficiary),
                            const TextField(
                              decoration: InputDecoration(
                                  hintText: "search beneficiaries",
                                  prefixIcon: Icon(Icons.search_outlined),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(7)))),
                            ),
                            const SizedBox(
                              height: 10,
                            ),

                            // if(i = 0; i < bank bbeneficiary API.length; i++ ) the api to be render should be loop through
                            Container(
                              height: 50,
                              width: double.infinity,
                              child: Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          iconType = !iconType;
                                        });
                                      },
                                      icon: (iconType)
                                          ? const Icon(
                                              Icons.circle_outlined,
                                            )
                                          : const Icon(
                                              Icons.check_circle_rounded)),
                                  // Image.asset(name)  image should be passed from backend
                                  const Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text("CUR."),
                                          Text("3092773812")
                                        ],
                                      ),
                                      Text("JOHN DOE ADEROGBA")
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Column(
                                              children: [
                                                cancelButton(context),
                                                const Text(
                                                    AppStrings.addBeneficiary),
                                                _BeneficiaryIcon(
                                                    "Create beneficiaries Group"),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.btn1,
                                      foregroundColor: Colors.white),
                                  child: const Text(AppStrings.cont)),
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
          child: Container(
            height: 50,
            width: 50,
            color: AppColors.btn2,
            child: const Icon(Icons.person_add_alt_outlined),
          ),
        ),

        // const AppField(hint: "Recepient", heigth: 7),
        const SizedBox(height: 10),
        GestureDetector(
            onTap: () {}, child: _BeneficiaryIcon(AppStrings.addBeneficiary)),
        const SizedBox(height: 20),
        const AppField(hint: "Why are you sending money?", heigth: 7),
        const SizedBox(
          height: 30,
        ),
        SizedBox(
          height: 50,
          width: double.infinity,
          child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.btn1,
                  foregroundColor: Colors.white),
              child: const Text(AppStrings.cont)),
        )
      ],
    );
  }
}

Column ownAccount(BuildContext context) {
  return Column(
    children: [
      const AppField(hint: AppStrings.amountTosend, heigth: 7),
      const SizedBox(
        height: 10,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          fromTo("from", "2262997831"),
          fromTo("To", "accNo"),
        ],
      ),
      const SizedBox(
        height: 10,
      ),
      const AppField(hint: AppStrings.reason, heigth: 7),
      const SizedBox(
        height: 30,
      ),
      SizedBox(
        height: 50,
        width: double.infinity,
        child: ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return StatefulBuilder(
                    builder: (context, setState) {
                      return Container(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              cancelButton(context),
                              const Text(AppStrings.transferSummary),
                              Container(
                                height: 100,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          offset: const Offset(0, 2),
                                          blurStyle: BlurStyle.inner,
                                          blurRadius: 2)
                                    ],
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(7))),
                                child: const Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(AppStrings.amountToSend),
                                      Row(
                                        children: [Text("#525."), Text("75")],
                                      ),
                                      Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text("VAT: "),
                                              Text("#0.75"),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text("Transfer Fee: "),
                                              Text("#25.00")
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 100,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(7)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          offset: const Offset(0, 2),
                                          blurStyle: BlurStyle.inner,
                                          blurRadius: 2)
                                    ]),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    fromTo("From", "accNo"),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    fromTo("To", "accNo")
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const AppField(hint: "Reason", heigth: 7),
                              const Spacer(),
                              ElevatedButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              cancelButton(context),
                                              const Text(
                                                  AppStrings.transactionPin),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              const Text(
                                                  AppStrings.transactiontxt),
                                              const SizedBox(
                                                height: 30,
                                              ),
                                              OtpTextField(
                                                numberOfFields: 4,
                                                showFieldAsBox: true,
                                              ),
                                              ElevatedButton(
                                                  onPressed: () {
                                                    showModalBottomSheet(
                                                      context: context,
                                                      builder: (context) {
                                                        return Container(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(10.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                cancelButton(
                                                                    context),
                                                                const Text(
                                                                    AppStrings
                                                                        .transactionSuccessful),
                                                                const Center(
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    color: Colors
                                                                        .green,
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  height: 10,
                                                                ),
                                                                // elvBtn(AppStrings.done, Navigator.of(context).pop(), context, 50, double.infinity)
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              AppColors.btn1,
                                                          foregroundColor:
                                                              Colors.white),
                                                  child: const Text(
                                                      AppStrings.done))
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: const Text(AppStrings.cont))
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.btn1, foregroundColor: Colors.white),
            child: const Text(AppStrings.cont)),
      )
    ],
  );
}

Container _BeneficiaryIcon(String beneficiaryText) {
  return Container(
    height: 50,
    width: 200,
    decoration: const BoxDecoration(
        color: Color.fromARGB(226, 189, 165, 137),
        borderRadius: BorderRadius.all(Radius.circular(50))),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Icon(Icons.person_add_alt_outlined),
        Text(beneficiaryText)
      ],
    ),
  );
}
