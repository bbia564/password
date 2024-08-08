import 'package:app_password/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'password_edit_logic.dart';

class PasswordEditPage extends GetView<PasswordEditLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: null,
        backgroundColor: Colors.white,
        actions: [
          Text(
            'Edit',
            style: TextStyle(color: primaryColor, fontSize: 14),
          ).marginOnly(right: 20).gestures(onTap: () {
            Get.toNamed('/add', arguments: controller.entity)
                ?.then((value) {
              if (value != null) {
                controller.entity = value;
                controller.update();
              }
            });
          })
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: GetBuilder<PasswordEditLogic>(builder: (_) {
          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: <Widget>[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                child: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.memory(
                      controller.entity.image,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                      child: <Widget>[
                    Text(
                      controller.entity.appName,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Divider(
                      height: 20,
                      color: Colors.grey.withOpacity(0.3),
                    ),
                    Text(
                      controller.entity.createTimeStr,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ].toColumn(crossAxisAlignment: CrossAxisAlignment.start))
                ].toRow(),
              ).decorated(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: const EdgeInsets.all(15),
                child: <Widget>[
                  const Text(
                    'Account',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 40,
                    child: <Widget>[
                      Expanded(
                          child: Text(
                        controller.entity.account,
                        style: TextStyle(
                            fontSize: 13,
                            color: primaryColor,
                            fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      )),
                      const SizedBox(
                        width: 10,
                      ),
                      Image.asset(
                        'assets/copy.webp',
                        width: 18,
                        height: 18,
                      ).gestures(onTap: () async {
                        await Clipboard.setData(
                            ClipboardData(text: controller.entity.account));
                        Fluttertoast.showToast(msg: 'Copy success');
                      })
                    ].toRow(),
                  ),
                  Divider(
                    height: 10,
                    color: Colors.grey.withOpacity(0.3),
                  ).marginOnly(bottom: 10),
                  const Text(
                    'Password',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 40,
                    child: <Widget>[
                      Expanded(
                          child: Text(
                        controller.entity.password,
                        style: TextStyle(
                            fontSize: 13,
                            color: primaryColor,
                            fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      )),
                      const SizedBox(
                        width: 10,
                      ),
                      Image.asset(
                        'assets/copy.webp',
                        width: 18,
                        height: 18,
                      ).gestures(onTap: () async {
                        await Clipboard.setData(
                            ClipboardData(text: controller.entity.password));
                        Fluttertoast.showToast(msg: 'Copy success');
                      })
                    ].toRow(),
                  ),
                  Divider(
                    height: 10,
                    color: Colors.grey.withOpacity(0.3),
                  ).marginOnly(bottom: 10),
                  const Text(
                    'Remark',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 40,
                    child: Text(
                      controller.entity.remark.isEmpty
                          ? 'There is no'
                          : controller.entity.remark,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 13,
                          color: controller.entity.remark.isEmpty
                              ? Colors.grey
                              : primaryColor,
                          fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Divider(
                    height: 10,
                    color: Colors.grey.withOpacity(0.3),
                  ).marginOnly(bottom: 10),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    alignment: Alignment.center,
                    child: const Text(
                      'Delete',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ).decorated(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10)).gestures(onTap: (){
                        controller.delete();
                  })
                ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
              ).decorated(
                  color: Colors.white, borderRadius: BorderRadius.circular(10))
            ].toColumn(),
          );
        }).marginAll(15)),
      ),
    );
  }
}
