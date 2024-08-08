import 'package:app_password/router/password_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'password_first_logic.dart';

class PasswordFirstPage extends GetView<PasswordFirstLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Application password'),
        actions: [
          Image.asset('assets/homeAdd.webp',
                  width: 32, height: 32, fit: BoxFit.cover)
              .marginOnly(right: 20)
              .gestures(onTap: () {
            Get.toNamed(PasswordNames.add)?.then((_) {
              controller.getData();
            });
          })
        ],
      ),
      body: SafeArea(
        child: Obx(() {
          return controller.list.value.isEmpty
              ? Center(
                  child: <Widget>[
                    Image.asset(
                      'assets/noData.webp',
                      width: 64,
                      height: 64,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'No application added',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    )
                  ].toColumn(mainAxisAlignment: MainAxisAlignment.center),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(15),
                  itemCount: controller.list.value.length,
                  itemBuilder: (_, index) {
                    final entity = controller.list.value[index];
                    return Container(
                      padding: const EdgeInsets.all(15),
                      child: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.memory(
                            entity.image,
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
                          <Widget>[
                            Expanded(
                                child: Text(
                              entity.appName,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            )),
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
                              Icons.keyboard_arrow_right,
                              size: 20,
                              color: Colors.grey,
                            )
                          ].toRow(),
                          Divider(
                            height: 20,
                            color: Colors.grey.withOpacity(0.3),
                          ),
                          Text(
                            entity.createTimeStr,
                            style:
                                const TextStyle(fontSize: 12, color: Colors.grey),
                          )
                        ].toColumn(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start))
                      ].toRow(),
                    )
                        .decorated(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10))
                        .marginOnly(bottom: 15)
                        .gestures(onTap: () {
                      Get.toNamed(PasswordNames.edit, arguments: entity)
                          ?.then((_) {
                        controller.getData();
                      });
                    });
                  });
        }),
      ),
    );
  }
}
