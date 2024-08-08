import 'dart:typed_data';

import 'package:app_password/db_password/db_password.dart';
import 'package:app_password/db_password/password_entity.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PasswordAddLogic extends GetxController {

  DBPassword dbPW = Get.find<DBPassword>();

  PasswordEntity? entity = Get.arguments;

  Uint8List? image;
  String appName = '';
  String account = '';
  String password = '';
  String remark = '';

  void imageSelected() async {
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        final imageBytes = await pickedFile.readAsBytes();
        image = imageBytes;
        update();
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: 'Please check album permissions or select a new image');
      return;
    }
  }

  void commit(BuildContext context) async {
    if (image == null) {
      Fluttertoast.showToast(msg: 'Please select image');
      return;
    }
    if (appName.isEmpty) {
      Fluttertoast.showToast(msg: 'Please input app name');
      return;
    }
    if (account.isEmpty) {
      Fluttertoast.showToast(msg: 'Please input account');
      return;
    }
    if (password.isEmpty) {
      Fluttertoast.showToast(msg: 'Please input password');
      return;
    }
    FocusScope.of(context).requestFocus(FocusNode());
    if (entity == null) {
      final currentEntity = PasswordEntity(
          id: 0,
          createTime: DateTime.now(),
          image: image!,
          appName: appName,
          account: account,
          password: password,
          remark: remark);
     await dbPW.insertPassword(currentEntity);
      Get.back();
    } else {
      entity!.image = image!;
      entity!.appName = appName;
      entity!.account = account;
      entity!.password = password;
      entity!.remark = remark;
      await dbPW.updatePassword(entity!);
      Get.back(result: entity);
    }
    Fluttertoast.showToast(msg: 'Success');
  }

  @override
  void onInit() {
    // TODO: implement onInit
    if (entity != null) {
      image = entity?.image;
      appName = entity!.appName;
      account = entity!.account;
      password = entity!.password;
      remark = entity!.remark;
      update();
    }
    super.onInit();
  }
}
