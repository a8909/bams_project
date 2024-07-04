import 'package:hive/hive.dart';

class BamsDataBase {
  // Toast toast = const Toast();
  List BeneficiaryAccounts = [];
  List loginUsers = [];

  final dbox = Hive.box("DataBase");

  void createInitaialDb() {
    // toast = const Toast();
    BeneficiaryAccounts = [];
    loginUsers = [];
  }

  void loadDb() {
    // toast = dbox.get('tst');
    BeneficiaryAccounts = dbox.get('bfaccount');
    loginUsers = dbox.get('userLogin');
  }

  void updateDb() {
    // dbox.put('tst', toast);
    dbox.put('bfaccount', BeneficiaryAccounts);
    dbox.put('userLogin', loginUsers);
  }

  void deleteDb() {
    // dbox.delete('tst');
    dbox.delete('bfaccount');
  }
}
