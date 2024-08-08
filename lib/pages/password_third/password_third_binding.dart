import 'package:get/get.dart';

import 'password_third_logic.dart';

class PasswordThirdBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PasswordThirdLogic());
  }
}
