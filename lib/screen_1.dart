import 'package:bams_project/account.dart';
import 'package:bams_project/color-template.dart';
import 'package:bams_project/controller/onboarding%20screens/bank_call.dart';
import 'package:bams_project/home.dart';
import 'package:bams_project/models/bank_models.dart';
import 'package:bams_project/transfer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  Itemchange selectedIndex = Itemchange.home;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[selectedIndex.index],
        bottomNavigationBar: MyButtomNavigator(
          selectedIndex: selectedIndex.index,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
        ));
  }
}

final pages = [
  Home(
    bankObject: BankObject(name: ''),
  ),
  ChangeNotifierProvider(create: (context) => BankInfo(), child: BankAccount()),
  const Transfer(),
];

enum Itemchange { home, account, trasnfer }

class MyButtomNavigator extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<Itemchange> onTap;
  const MyButtomNavigator(
      {super.key, required this.selectedIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () => onTap(Itemchange.home),
                icon: const Icon(Icons.home)),
            label: "Home"),
        BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () => onTap(Itemchange.account),
                icon: const Icon(Icons.account_balance_outlined)),
            label: "Accounts"),
        BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () => onTap(Itemchange.trasnfer),
                icon: const Icon(Icons.compare_arrows_rounded)),
            label: "Transfer"),
        // BottomNavigationBarItem(
        //     icon: Icon(Icons.card_travel), label: "Cards"),
        // BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings")
      ],
      backgroundColor: AppColors.btn1,
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.white,
    );
  }
}
