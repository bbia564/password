import 'package:app_password/router/password_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'password_third_logic.dart';

class PasswordThirdPage extends GetView<PasswordThirdLogic> {
  final titles = ['Clean records', 'Feedback', 'Privacy agreement', 'About us'];

  Widget _item(int index, BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      height: 50,
      child: <Widget>[
        Text(
          titles[index],
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const Icon(Icons.keyboard_arrow_right, size: 22, color: Colors.grey),
      ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
    )
        .decorated(color: Colors.white, borderRadius: BorderRadius.circular(10))
        .marginOnly(bottom: 10)
        .gestures(onTap: () {
      switch (index) {
        case 0:
          controller.cleanPWData();
          break;
        case 1:
          Get.toNamed(PasswordNames.feedback);
          break;
        case 2:
          controller.aboutPWPrivacy(context);
          break;
        case 3:
          controller.aboutPWUS(context);
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: <Widget>[
            _item(0, context),
            _item(1, context),
            _item(2, context),
            _item(3, context)
          ].toColumn(),
        ).marginAll(15)),
      ),
    );
  }
}
