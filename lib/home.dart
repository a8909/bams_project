import 'package:bams_project/App-string.dart';
import 'package:bams_project/cancel-button.dart';
import 'package:bams_project/textfield.dart';
import 'package:bams_project/verify-account.dart';
import 'package:flutter/material.dart';

import 'color-template.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
                        return StatefulBuilder(
                          builder: (context, setState) {
                            bool addAccount = false;
                            void addFunction() {
                              setState(() {
                                addAccount = !addAccount;
                              });
                            }

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
                                    const AppField(
                                        hint: AppStrings.accountNumber,
                                        heigth: 7),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    container("Guarantee Trust Bank"),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    (addAccount)
                                        ? Column(
                                            children: [
                                              const AppField(
                                                  hint:
                                                      AppStrings.accountNumber,
                                                  heigth: 7),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              container("Guarantee Trust Bank"),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          )
                                        : const Text(AppStrings.empty),
                                    Align(
                                      alignment: Alignment.center,
                                      child: SizedBox(
                                        height: 50,
                                        width: 180,
                                        child: OutlinedButton(
                                            onPressed: () => addFunction(),
                                            style: OutlinedButton.styleFrom(
                                                backgroundColor: Colors.grey
                                                    .withOpacity(0.1),
                                                foregroundColor: Colors.grey),
                                            child: const Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text("Add another account"),
                                                Icon(Icons
                                                    .add_circle_outline_outlined)
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
            Container(
              height: 300,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(AppStrings.transactionhistory),
                        Container(
                          height: 30,
                          width: 100,
                          decoration: const BoxDecoration(
                              color: Colors.grey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: const Center(
                            child: Row(
                              children: [
                                Icon(Icons.keyboard_arrow_down_outlined)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    // const CircleAvatar(
                    //   radius: 40,
                    //   backgroundImage: AssetImage("assetName"),
                    // )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Container container(String text) {
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
          // Image.network("name"), // here should be passed as an image
          Text(text), // this should be fetch from backend
          const Icon(Icons.keyboard_arrow_down_outlined)
        ],
      ),
    ),
  );
}
