import 'package:bams_project/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class BamsDataBase {
  Toast toast = const Toast();
  List BeneficiaryAccounts = [];

  final dbox = Hive.box("DataBase");

  void createInitaialDb() {
    toast = const Toast();
    BeneficiaryAccounts = [];
  }

  void loadDb() {
    toast = dbox.get('tst');
    BeneficiaryAccounts = dbox.get('bfaccount');
  }

  void updateDb() {
    dbox.put('tst', toast);
    dbox.put('bfaccount', BeneficiaryAccounts);
  }

  void deleteDb() {
    dbox.delete('tst');
  }
}
