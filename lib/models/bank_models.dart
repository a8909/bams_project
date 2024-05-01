import 'package:bams_project/models/bankDetails_model.dart';
import 'package:flutter/material.dart';

class BankInfo extends ChangeNotifier {
  BankUser? bankusers;
  final account = [];
  List banks = [
    ["assets/images/gtb.png", "Tevi Adekunle F.", "3092773812"],
  ];
  set bankUser(usr) {
    bankusers = usr;
  }
}
