import 'package:app_password/pages/password_first/password_first_view.dart';
import 'package:app_password/pages/password_second/password_second_view.dart';
import 'package:app_password/pages/password_third/password_third_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'password_tab_logic.dart';

class PasswordTabPage extends GetView<PasswordTabLogic> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: [
          PasswordFirstPage(),
          PasswordSecondPage(),
          PasswordThirdPage()
        ],
      ),
      bottomNavigationBar: Obx(()=>_navPWBars()),
    );
  }

  Widget _navPWBars() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Image.asset('assets/tab0Unselect.webp',width: 22,height: 22,fit: BoxFit.cover,),
          activeIcon:Image.asset('assets/tab0Selected.webp',width: 22,height: 22,fit: BoxFit.cover,),
          label: 'Password',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/tab1Unselect.webp',width: 22,height: 22,fit: BoxFit.cover,),
          activeIcon:Image.asset('assets/tab1Selected.webp',width: 22,height: 22,fit: BoxFit.cover,),
          label: 'Generate',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/tab2Unselect.webp',width: 22,height: 22,fit: BoxFit.cover,),
          activeIcon:Image.asset('assets/tab2Selected.webp',width: 22,height: 22,fit: BoxFit.cover,),
          label: 'Setting',
        ),
      ],
      currentIndex: controller.currentIndex.value,
      onTap: (index) {
        controller.currentIndex.value = index;
        controller.pageController.jumpToPage(index);
      },
    );
  }
}
