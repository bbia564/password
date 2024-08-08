import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class PassInPage extends GetView<PageControllerPass> {
  const PassInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => controller.kaden.value
              ? const CircularProgressIndicator(color: Colors.orangeAccent,)
              : buildError(),
        ),
      ),
    );
  }

  Widget buildError() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              controller.wszyc();
            },
            icon: const Icon(
              Icons.restart_alt,
              size: 50,
            ),
          ),
        ],
      ),
    );
  }
}
