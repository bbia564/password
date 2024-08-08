import 'package:app_password/db_password/db_password.dart';
import 'package:app_password/db_password/password_entity.dart';
import 'package:get/get.dart';

class PasswordEditLogic extends GetxController {

  DBPassword dbPW = Get.find<DBPassword>();

  PasswordEntity entity = Get.arguments;

  @override
  void onInit() {
    // TODO: implement onInit
    update();
    super.onInit();
  }

  void delete() async {
    await dbPW.deletePassword(entity);
    Get.back();
  }

}
