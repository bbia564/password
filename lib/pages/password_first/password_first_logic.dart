import 'package:app_password/db_password/db_password.dart';
import 'package:app_password/db_password/password_entity.dart';
import 'package:get/get.dart';

class PasswordFirstLogic extends GetxController {

  DBPassword dbPW = Get.find<DBPassword>();

  var list = <PasswordEntity>[].obs;

  void getData() async {
    list.value = await dbPW.getAllData();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

}
