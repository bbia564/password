import 'package:get/get.dart';

import 'password_add_logic.dart';

class PasswordAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PasswordAddLogic());
  }
}
