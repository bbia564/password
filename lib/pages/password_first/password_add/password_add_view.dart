import 'package:app_password/main.dart';
import 'package:app_password/pages/password_third/feedback/password_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'password_add_logic.dart';

class PasswordAddPage extends GetView<PasswordAddLogic> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PasswordAddLogic>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text(controller.entity == null ? 'Add an app account' : 'Modify app account'),
          backgroundColor: Colors.white,
        ),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SafeArea(
              child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: <Widget>[
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    child: <Widget>[
                      const SizedBox(
                        height: 65,
                      ),
                      const Text(
                        'Application name',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 40,
                        child: PasswordTextField(
                            padding: EdgeInsets.zero,
                            maxLength: 20,
                            value: controller.appName,
                            onChange: (value) {
                              controller.appName = value;
                            }),
                      ),
                      Divider(
                        height: 15,
                        color: Colors.grey[300],
                      ).marginOnly(bottom: 10),
                      const Text(
                        'Account',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 40,
                        child: PasswordTextField(
                            padding: EdgeInsets.zero,
                            maxLength: 20,
                            value: controller.account,
                            onChange: (value) {
                              controller.account = value;
                            }),
                      ),
                      Divider(
                        height: 15,
                        color: Colors.grey[300],
                      ).marginOnly(bottom: 10),
                      const Text(
                        'Password',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 40,
                        child: PasswordTextField(
                            padding: EdgeInsets.zero,
                            maxLength: 20,
                            value: controller.password,
                            onChange: (value) {
                              controller.password = value;
                            }),
                      ),
                      Divider(
                        height: 15,
                        color: Colors.grey[300],
                      ).marginOnly(bottom: 10),
                      const Text(
                        'Remark',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 40,
                        child: PasswordTextField(
                            padding: EdgeInsets.zero,
                            maxLength: 20,
                            value: controller.remark,
                            onChange: (value) {
                              controller.remark = value;
                            }),
                      ),
                      Divider(
                        height: 15,
                        color: Colors.grey[300],
                      ).marginOnly(bottom: 10),
                      Container(
                        height: 50,
                        alignment: Alignment.center,
                        child: Text(
                          controller.entity == null ? 'Add' : 'Commit changes',
                          style:const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                          .decorated(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(10))
                          .gestures(onTap: () {
                            controller.commit(context);
                      })
                    ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
                  )
                      .decorated(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10))
                      .marginOnly(top: 50),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: 100,
                      height: 100,
                      child: controller.image == null
                          ? const Icon(
                              Icons.add,
                              size: 45,
                              color: Colors.grey,
                            )
                          : Image.memory(
                              controller.image!,
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                    )
                        .decorated(
                            color: Colors.white,
                            border:
                                Border.all(color: Colors.grey.withOpacity(0.2)),
                            borderRadius: BorderRadius.circular(10))
                        .gestures(onTap: () {
                      controller.imageSelected();
                    }),
                  ),
                  Visibility(
                      visible: controller.image != null,
                      child: Positioned(
                        top: 80,
                        right: context.width / 2 - 80,
                        child: Icon(
                          Icons.add_circle,
                          color: primaryColor,
                          size: 33,
                        ).gestures(onTap: () {
                          controller.imageSelected();
                        }),
                      ))
                ],
              )
            ].toColumn(),
          ).marginAll(15)),
        ),
      );
    });
  }
}
