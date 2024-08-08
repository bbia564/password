import 'package:app_password/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'password_second_logic.dart';

class PasswordSecondPage extends GetView<PasswordSecondLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate password'),
      ),
      body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SafeArea(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(12),
                    child: <Widget>[
                      const Text(
                        'Password length',
                        style: TextStyle(fontSize: 14),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        padding: const EdgeInsets.all(12),
                        child: <Widget>[
                          Image.asset(
                            'assets/add.webp',
                            width: 20,
                            height: 20,
                          ).gestures(onTap: () {
                            controller.addSub();
                          }),
                          Obx(() {
                            return Text(
                              controller.maxNum.toString(),
                              style: TextStyle(
                                  fontSize: 14,
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold),
                            );
                          }),
                          Image.asset(
                            'assets/sub.webp',
                            width: 20,
                            height: 20,
                          ).gestures(onTap: () {
                            controller.addSub(isAdd: false);
                          }),
                        ].toRow(mainAxisAlignment: MainAxisAlignment
                            .spaceBetween),
                      ).decorated(
                          color: Colors.grey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12))
                    ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
                  ).decorated(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    child: <Widget>[
                      <Widget>[
                        const Text(
                          'Capital letter',
                          style: TextStyle(fontSize: 14),
                        ),
                        Obx(() {
                          return Switch(
                              value: controller.upperCase.value,
                              activeTrackColor: Colors.green,
                              onChanged: (value) {
                                if (!controller.lowerCase.value && !controller.number.value && !controller.symbol.value) {
                                  Fluttertoast.showToast(msg: 'At least one character type must be included.');
                                  return;
                                }
                                controller.upperCase.value = value;
                                controller.generateRandomString(
                                    includeUppercase: value,
                                    includeLowercase: controller.lowerCase.value,
                                    includeNumbers: controller.number.value,
                                    includeSymbols: controller.symbol.value,
                                    length: controller.maxNum.value);
                              });
                        })
                      ].toRow(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween),
                      Divider(
                        height: 15,
                        color: Colors.grey.withOpacity(0.3),
                      ),
                      <Widget>[
                        const Text(
                          'Lowercase letter',
                          style: TextStyle(fontSize: 14),
                        ),
                        Obx(() {
                          return Switch(
                              value: controller.lowerCase.value,
                              activeTrackColor: Colors.green,
                              onChanged: (value) {
                                if (!controller.upperCase.value && !controller.number.value && !controller.symbol.value) {
                                  Fluttertoast.showToast(msg: 'At least one character type must be included.');
                                  return;
                                }
                                controller.lowerCase.value = value;
                                controller.generateRandomString(
                                    includeUppercase: value,
                                    includeLowercase: controller.lowerCase.value,
                                    includeNumbers: controller.number.value,
                                    includeSymbols: controller.symbol.value,
                                    length: controller.maxNum.value);
                              });
                        })
                      ].toRow(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween),
                      Divider(
                        height: 15,
                        color: Colors.grey.withOpacity(0.3),
                      ),
                      <Widget>[
                        const Text(
                          'Figure',
                          style: TextStyle(fontSize: 14),
                        ),
                        Obx(() {
                          return Switch(
                              value: controller.number.value,
                              activeTrackColor: Colors.green,
                              onChanged: (value) {
                                if (!controller.upperCase.value && !controller.lowerCase.value && !controller.symbol.value) {
                                  Fluttertoast.showToast(msg: 'At least one character type must be included.');
                                  return;
                                }
                                controller.number.value = value;
                                controller.generateRandomString(
                                    includeUppercase: value,
                                    includeLowercase: controller.lowerCase.value,
                                    includeNumbers: controller.number.value,
                                    includeSymbols: controller.symbol.value,
                                    length: controller.maxNum.value);
                              });
                        })
                      ].toRow(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween),
                      Divider(
                        height: 15,
                        color: Colors.grey.withOpacity(0.3),
                      ),
                      <Widget>[
                        const Text(
                          'Symbol',
                          style: TextStyle(fontSize: 14),
                        ),
                        Obx(() {
                          return Switch(
                              value: controller.symbol.value,
                              activeTrackColor: Colors.green,
                              onChanged: (value) {
                                if (!controller.lowerCase.value && !controller.number.value && !controller.number.value) {
                                  Fluttertoast.showToast(msg: 'At least one character type must be included.');
                                  return;
                                }
                                controller.symbol.value = value;
                                controller.generateRandomString(
                                    includeUppercase: value,
                                    includeLowercase: controller.lowerCase.value,
                                    includeNumbers: controller.number.value,
                                    includeSymbols: controller.symbol.value,
                                    length: controller.maxNum.value);
                              });
                        })
                      ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween)
                    ].toColumn(),
                  ).decorated(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      child: <Widget>[
                        Obx(() {
                          return Text(
                            controller.result.value,
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          );
                        }),
                        const SizedBox(height: 10,),
                        Image.asset('assets/copy.webp', width: 20, height: 20,)
                            .gestures(onTap: () async {
                          await Clipboard.setData(
                              ClipboardData(text: controller.result.value));
                          Fluttertoast.showToast(msg: 'Copy success');
                        })
                      ].toColumn(mainAxisAlignment: MainAxisAlignment.center),
                    ).decorated(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12)),
                  ).decorated(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12))
                ].toColumn(),
              ).marginAll(15))),
    );
  }
}
