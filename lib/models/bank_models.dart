import 'package:bams_project/models/bankDetails_model.dart';
import 'package:flutter/material.dart';

class BankInfo extends ChangeNotifier {
  //requirements are to be supplied from End point
  BankUser? bankusers;
  final account = [];
  List banks = [
    ["assets/images/gtb.png", "Tevi Adekunle F.", "3092773812"],
  ];
  List bankimage = ["assets/images/gtb.png", "assets/images/firstbank.png"];
  List<BankUser> banksUserList = [
    BankUser(
        bankImage: "assets/images/gtb.png",
        accountName: "JOHN DOE ADEROGBA",
        accountNumber: "3092773812")
  ];
  List<BankUser> getbankUserList() {
    return banksUserList;
  }

  final List<BenAcc> beneficials = [
    BenAcc(
        bnkImg: "assets/images/gtb.png",
        tag: "CUR.",
        accNo: "3092773812",
        accName: "JOHN DOE ADEROGBA")
  ];

  List<BenAcc> getBeneficiaries() {
    return beneficials;
  }
}
