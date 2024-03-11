import 'package:bams_project/cancel-button.dart';
import 'package:bams_project/color-template.dart';
import 'package:bams_project/home.dart';
import 'package:bams_project/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get_connect/sockets/src/sockets_html.dart';

import 'App-string.dart';
import 'transfer-money.dart';

enum ButtonState { init, done }

class OtherAccount extends StatefulWidget {
  const OtherAccount({super.key});

  @override
  State<OtherAccount> createState() => _OtherAccountState();
}

ButtonState state = ButtonState.init;

class _OtherAccountState extends State<OtherAccount> {
  final TextEditingController controller = TextEditingController();
  bool iconType = true;
  final isDone = state == ButtonState.done;
  final initial = state == ButtonState.init;
  final List<String> accountNumber = ["3092773812"];
  final List<String> accountName = ["JOHN DOE ADEROGBA"];
  final List<String> accountstat = ["CUR."];
  bool onHoverChange = false;
  final statecontroller = MaterialStatesController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppField(
          hint: "Amount to send?",
          heigth: 7,
          controller: controller,
        ),
        const SizedBox(height: 10),
        container("From", ""),
        const SizedBox(height: 10),
        Row(
          children: [
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
              onTap: () async {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const Center(child: CircularProgressIndicator());
                  },
                );

                await showModalBottomSheet(
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

                                ListView.builder(
                                  itemCount: accountNumber.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        print("This is my prenet state..");
                                      },
                                      statesController: statecontroller,
                                      hoverColor: Colors.green[600],
                                      onHover: (value) {
                                        setState(() {
                                          onHoverChange = !onHoverChange;
                                        });
                                      },
                                      child: Container(
                                        height: 50,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black
                                                    .withOpacity(0.5))),
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
                                                    : const Icon(Icons
                                                        .check_circle_rounded)),
                                            // Image.asset(name)  image should be passed from backend
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(accountstat[index]),
                                                    Text(accountNumber[index])
                                                  ],
                                                ),
                                                Text(accountName[index])
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),

                                // if(i = 0; i < bank bbeneficiary API.length; i++ ) the api to be render should be loop through using listviewbuilder
                                const Spacer(),
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
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
                Navigator.pop(context);
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                    color: AppColors.btn2,
                    borderRadius: BorderRadius.all(Radius.circular(7))),
                child: const Icon(Icons
                    .person_add_alt_outlined), // the precise image should be downloaded from figma which should be reverted..
              ),
            ),
          ],
        ),
        // const AppField(hint: "Recepient", heigth: 7),
        const SizedBox(height: 10),
        GestureDetector(
            //Add beneficiaries section
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
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              cancelButton(context),
                              const Text(AppStrings.addBeneficiary),
                              _BeneficiaryIcon("Create beneficiaries Group"),
                              (iconType)
                                  ? Row(
                                      children: [
                                        Container(
                                          height: 150,
                                          width: 300,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black
                                                      .withOpacity(0.5))),
                                          margin: const EdgeInsets.fromLTRB(
                                              5, 10, 5, 10),
                                          child: const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                TextField(
                                                  decoration: InputDecoration(
                                                      hintText:
                                                          "Enter Acoount Number",
                                                      suffixIcon: Icon(Icons
                                                          .keyboard_arrow_down_outlined)),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                TextField(
                                                  decoration: InputDecoration(
                                                      hintText: "Enter Amount",
                                                      border: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          7))),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                              // borderSide: const BorderSide(color: Colors.transparent),
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          7)))),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTapCancel: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Icon(Icons
                                              .disabled_by_default_outlined),
                                        ),

                                        // IconButton(
                                        //     onPressed: () {
                                        //       Navigator.pop(context);
                                        //     },
                                        //     icon: const Icon(Icons
                                        //         .disabled_by_default_outlined))
                                      ],
                                    )
                                  : const Text(""),
                              GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      iconType = !iconType;
                                    });
                                  },
                                  child: _BeneficiaryIcon(
                                      "Add Another Beneficiaries")),
                              // elvBtn(AppStrings.cont, "routeName", context, 50,
                              //     double.infinity)
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
            child: _BeneficiaryIcon(AppStrings.addBeneficiary)),
        const SizedBox(height: 20),
        AppField(
          hint: "Why are you sending money?",
          heigth: 7,
          controller: controller,
        ),
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

enum Checkstate { init, done }

Column ownAccount(BuildContext context) {
  final TextEditingController controller = TextEditingController();
  return Column(
    children: [
      AppField(
        hint: AppStrings.amountTosend,
        heigth: 7,
        controller: controller,
      ),
      const SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          fromTo("from", "2262997831"),
          fromTo("To", "accNo"),
        ],
      ),
      const SizedBox(
        height: 20,
      ),
      AppField(
        hint: AppStrings.reason,
        heigth: 7,
        controller: controller,
      ),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              cancelButton(context),
                              const SizedBox(
                                height: 30,
                              ),
                              const Text(
                                AppStrings.transferSummary,
                                style: TextStyle(
                                    fontSize: 40, color: AppColors.btn2),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
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
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        AppStrings.amountToSend,
                                        style: TextStyle(fontSize: 10),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "#525.",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          Text("75")
                                        ],
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
                              AppField(
                                hint: "Reason",
                                heigth: 7,
                                controller: controller,
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
                                          return Container(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(16.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  cancelButton(context),
                                                  const SizedBox(height: 20),
                                                  const Text(
                                                    AppStrings.transactionPin,
                                                    style: TextStyle(
                                                        fontSize: 30,
                                                        color: AppColors.btn2),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  const Text(
                                                    AppStrings.transactiontxt,
                                                    style:
                                                        TextStyle(fontSize: 10),
                                                  ),
                                                  const SizedBox(
                                                    height: 30,
                                                  ),
                                                  OtpTextField(
                                                    numberOfFields: 4,
                                                    showFieldAsBox: true,
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
                                                              return Container(
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          10.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      cancelButton(
                                                                          context),
                                                                      const Text(
                                                                        AppStrings
                                                                            .transactionSuccessful,
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                40,
                                                                            color:
                                                                                AppColors.btn2),
                                                                      ),
                                                                      // (ConnectionStatus == ConnectionState.active)
                                                                      //     ?
                                                                      //     await Future.delayed(const Duration(seconds: 2), () {
                                                                      //       print("object");
                                                                      //       return const Icon(
                                                                      //         Icons.check_circle_outline,
                                                                      //         color: Colors.green,
                                                                      //       );
                                                                      //     };

                                                                      //     :
                                                                      const Center(
                                                                        child:
                                                                            CircularProgressIndicator(
                                                                          color:
                                                                              Colors.green,
                                                                        ),
                                                                      ),

                                                                      const SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),
                                                                      // elvBtn(AppStrings.done, Navigator.of(context).pop(), context, 50, double.infinity)
                                                                    ],
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                backgroundColor:
                                                                    AppColors
                                                                        .btn1,
                                                                foregroundColor:
                                                                    Colors
                                                                        .white),
                                                        child: const Text(
                                                            AppStrings.done)),
                                                  )
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
