import 'package:bams_project/cancel-button.dart';
import 'package:bams_project/color-template.dart';
import 'package:bams_project/data/database.dart';
import 'package:bams_project/models/bank_models.dart';
import 'package:bams_project/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:hive_flutter/hive_flutter.dart';
// import 'package:get/get_connect/sockets/src/sockets_html.dart';

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
  late var textchange = "";
  late var accNo = "";

  final TextEditingController controller = TextEditingController();
  bool iconType = true;
  final isDone = state == ButtonState.done;
  final initial = state == ButtonState.init;

  var sendingAmount = '';
  var whySending = '';
  List BeneficiaryAccounts = [];
  final banksInfo = BankInfo();

  final statecontroller = MaterialStatesController();
  List<TextEditingController> listcontroller = [TextEditingController()];

  final _dbox = Hive.box('DataBase');
  BamsDataBase db = BamsDataBase();

  @override
  void initState() {
    super.initState();
  }

  // @override
  // void dispose() {
  //   listcontroller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppField(
          keyboardType: TextInputType.number,
          hint: "Amount to send?",
          heigth: 7,
          controller: controller,
          onChangecallback: (String) {},
        ),
        const SizedBox(height: 10),
        Container(
          width: double.infinity,
          height: 70,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(7)),
              border: Border.all(color: Colors.black.withOpacity(0.3))),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('From'),
                Icon(Icons.keyboard_arrow_down_outlined)
              ],
            ),
          ),
        ),

        // container("From", Icon(icon)),
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
                await showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) {
                    return StatefulBuilder(
                      builder: (context, setState) {
                        return Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                cancelButton(context),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(AppStrings.savedBeneficiary),
                                const SizedBox(
                                  height: 40,
                                  child: TextField(
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                    decoration: InputDecoration(
                                        hintText: "search beneficiaries",
                                        prefixIcon: Icon(Icons.search_outlined),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)))),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),

                                ListView.builder(
                                  itemCount: banksInfo.accountNumber.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        print("This is my present state..");
                                      },
                                      statesController: statecontroller,
                                      child: Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 8, 0, 8),
                                        height: 50,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(7)),
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
                                            Image.asset(
                                              banksInfo.accountNumber[index][0],
                                              width: 50,
                                              height: 50,
                                            ),
                                            //  image should be passed from backend
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                        banksInfo.accountNumber[
                                                            index][1]),
                                                    Text(
                                                        banksInfo.accountNumber[
                                                            index][2])
                                                  ],
                                                ),
                                                Text(banksInfo
                                                    .accountNumber[index][3])
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
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) {
                  return DraggableScrollableSheet(
                    initialChildSize: 0.85,
                    maxChildSize: 0.9,
                    minChildSize: 0.5,
                    builder: (context, controller) {
                      return Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20))),
                        child: SingleChildScrollView(
                          controller: controller,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              // mainAxisSize: MainAxisSize.min,
                              children: [
                                cancelButton(context),
                                const Align(
                                  alignment: AlignmentDirectional.topStart,
                                  child: Text(
                                    AppStrings.addBeneficiary,
                                    style: TextStyle(
                                        fontSize: 30, color: AppColors.btn2),
                                  ),
                                ),

                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        listcontroller
                                            .add(TextEditingController());
                                      });
                                    },
                                    child: _BeneficiaryIcon(
                                        "Create beneficiaries Group")),
                                (listcontroller.isNotEmpty)
                                    ? ListView.builder(
                                        itemCount: listcontroller.length,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          var endResult = [];
                                          for (int y = 0;
                                              y < listcontroller.length;
                                              y++) {
                                            var newItem = listcontroller[y];
                                            print(newItem);
                                            endResult.add(Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  height: 150,
                                                  width: 300,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.black
                                                              .withOpacity(
                                                                  0.5))),
                                                  margin:
                                                      const EdgeInsets.fromLTRB(
                                                          5, 10, 5, 10),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        TextFormField(
                                                          onChanged: (value) {
                                                            accNo = value;
                                                          },
                                                          controller:
                                                              listcontroller[
                                                                  index],
                                                          decoration: const InputDecoration(
                                                              hintText:
                                                                  "Enter Acoount Number",
                                                              suffixIcon: Icon(Icons
                                                                  .keyboard_arrow_down_outlined)),
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        TextFormField(
                                                          onChanged: (value) {
                                                            textchange = value;
                                                          },
                                                          decoration:
                                                              const InputDecoration(
                                                                  hintText:
                                                                      "Enter Amount",
                                                                  border: OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.all(Radius.circular(
                                                                              7))),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                          // borderSide: const BorderSide(color: Colors.transparent),
                                                                          borderRadius:
                                                                              BorderRadius.all(Radius.circular(7)))),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      listcontroller[index]
                                                          .clear();
                                                      listcontroller
                                                          .removeAt(index);
                                                    });
                                                  },
                                                  child: const Icon(Icons
                                                      .disabled_by_default_outlined),
                                                )
                                              ],
                                            ));
                                          }
                                          print(endResult.length);
                                          return endResult[index];
                                        },
                                      )
                                    : const Text(""),

                                const SizedBox(height: 10),
                                GestureDetector(
                                    onTap: () {
                                      final String response = textchange;
                                      setState(() {
                                        db.BeneficiaryAccounts.add(
                                            [response, accNo]);
                                        listcontroller.clear();
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    child: _BeneficiaryIcon(
                                        "Add Another Beneficiaries")),
                                // elvBtn(AppStrings.cont, "routeName", context, 50,
                                //     double.infinity)
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
            child: _BeneficiaryIcon(AppStrings.addBeneficiary)),
        const SizedBox(height: 10),
        (BeneficiaryAccounts.isEmpty)
            ? const Text("")
            : ListView.builder(
                shrinkWrap: true,
                itemCount: BeneficiaryAccounts.length,
                itemBuilder: (context, index) {
                  print("This is my current status");
                  return Container(
                    child: Row(
                      children: [
                        Container(
                          width: 325,
                          height: 66,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade900),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(7))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(banksInfo.bankimage[index],
                                          height: 20, width: 20),
                                      Text(accNo),
                                    ],
                                  ),
                                  Text(textchange),
                                ],
                              ),
                              const Text("CIROMA ADEKUNLE")
                            ],
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              // print("cancel widget");
                              // setState(() {
                              //   Navigator.of(context).pop();
                              // });
                            },
                            child:
                                const Icon(Icons.disabled_by_default_outlined))
                      ],
                    ),
                  );
                },
              ),
        const SizedBox(height: 20),

        AppField(
          keyboardType: TextInputType.text,
          hint: "Why are you sending money?",
          heigth: 7,
          controller: controller,
          onChangecallback: (String) {},
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
  var reason1 = "";
  var reason2 = "";
  var amountToSend = '';
  return Column(
    children: [
      AppField(
        keyboardType: TextInputType.number,
        hint: AppStrings.amountTosend,
        heigth: 7,
        controller: controller,
        onChangecallback: (String) {},
      ),
      const SizedBox(
        height: 30,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          fromTo("from", "assets/images/firstbank.png", "2262997831"),
          // Icon(Icons.transfer)
          fromTo("To", "assets/images/gtb.png", "2262997831"),
        ],
      ),
      const SizedBox(
        height: 30,
      ),
      AppField(
        keyboardType: TextInputType.text,
        hint: AppStrings.reason,
        heigth: 7,
        controller: controller,
        onChangecallback: (String) {},
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
                backgroundColor: Colors.transparent,
                builder: (context) {
                  return DraggableScrollableSheet(
                    initialChildSize: 0.85,
                    maxChildSize: 0.9,
                    minChildSize: 0.5,
                    builder: (context, scrollController) {
                      return Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(7))),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
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
                                                MainAxisAlignment.end,
                                            children: [
                                              Text("VAT: "),
                                              Text("#0.75"),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
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
                                height: 120,
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
                                    fromTo("From", "assets/images/gtb.png",
                                        "9090397455"),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    fromTo("To", "assets/images/firstbank.png",
                                        "2263997831")
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              AppField(
                                keyboardType: TextInputType.text,
                                hint: "Reason",
                                heigth: 7,
                                controller: controller,
                                onChangecallback: (String) {},
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
