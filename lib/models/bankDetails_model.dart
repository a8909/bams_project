import 'package:flutter/material.dart';

class BankUser {
  final String bankImage;
  final String accountName;
  final String accountNumber;
  BankUser(
      {required this.bankImage,
      required this.accountName,
      required this.accountNumber});
}

class BenAcc {
  final String bnkImg;
  final String tag;
  final String accNo;
  final String accName;
  BenAcc(
      {required this.bnkImg,
      required this.tag,
      required this.accNo,
      required this.accName});
}

class BenfAccount {
  final TextEditingController control;
  final TextEditingController control2;
  void Function()? onTap;

  BenfAccount(
      {required this.control, required this.control2, required this.onTap});
}
