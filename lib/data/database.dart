import 'package:hive/hive.dart';

import '../homePageController.dart';

class BamsDataBase {
  // Toast toast = const Toast();
  List BeneficiaryAccounts = [];
  List loginUsers = [];
  // var onboarding = const HomepageController();

  final dbox = Hive.box("DataBase");

  void createInitaialDb() {
    // toast = const Toast();
    BeneficiaryAccounts = [];
    loginUsers = [];
    // onboarding = const HomepageController();
  }

  void loadDb() {
    // toast = dbox.get('tst');
    BeneficiaryAccounts = dbox.get('bfaccount');
    loginUsers = dbox.get('userLogin');
    // onboarding = dbox.get('onboarding');
  }

  void updateDb() {
    // dbox.put('tst', toast);
    dbox.put('bfaccount', BeneficiaryAccounts);
    dbox.put('userLogin', loginUsers);
  }

  void deleteDb() {
    // dbox.delete('tst');
    dbox.delete('bfaccount');
    dbox.delete('onboarding');
  }
}
