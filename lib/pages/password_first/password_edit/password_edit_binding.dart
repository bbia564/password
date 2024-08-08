import 'package:get/get.dart';

import 'password_edit_logic.dart';

class PasswordEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PasswordEditLogic());
  }
}
