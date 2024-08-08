import 'package:get/get.dart';

import 'logic.dart';

class PassIndexBind extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageControllerPass(),
      permanent: true,
    );
  }
}
