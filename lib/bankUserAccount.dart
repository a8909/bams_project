import 'package:flutter/material.dart';

import 'models/bankDetails_model.dart';
import 'top-content.dart';

class Useritem extends StatelessWidget {
  final BankUser bankies;
  const Useritem({super.key, required this.bankies});

  @override
  Widget build(BuildContext context) {
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
                Image.asset(bankies.bankImage),
                // AssetImage(assetName) this  should be passed dynamically from end point
                Container(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(bankies.accountName),
                    Text(bankies.accountNumber)
                  ],
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
}
