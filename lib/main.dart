import 'package:app_password/db_password/db_password.dart';
import 'package:app_password/pages/password_first/password_add/password_add_binding.dart';
import 'package:app_password/pages/password_first/password_add/password_add_view.dart';
import 'package:app_password/pages/password_first/password_edit/password_edit_binding.dart';
import 'package:app_password/pages/password_first/password_edit/password_edit_view.dart';
import 'package:app_password/pages/password_first/password_first_binding.dart';
import 'package:app_password/pages/password_first/password_first_view.dart';
import 'package:app_password/pages/password_make/binding.dart';
import 'package:app_password/pages/password_make/view.dart';
import 'package:app_password/pages/password_second/password_second_binding.dart';
import 'package:app_password/pages/password_second/password_second_view.dart';
import 'package:app_password/pages/password_tab/password_tab_binding.dart';
import 'package:app_password/pages/password_tab/password_tab_view.dart';
import 'package:app_password/pages/password_third/feedback/feedback_binding.dart';
import 'package:app_password/pages/password_third/feedback/feedback_view.dart';
import 'package:app_password/pages/password_third/password_third_binding.dart';
import 'package:app_password/pages/password_third/password_third_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'db_password/too.dart';


Color primaryColor = const Color(0xfff5902c);
Color bgColor = const Color(0xfff8f8f8);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => DBPassword().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: PLists,
      initialRoute:'/main',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        dialogTheme: const DialogTheme(
          actionsPadding: EdgeInsets.only(right: 10, bottom: 5),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}
List<GetPage<dynamic>> PLists = [
  GetPage(name: '/main', page: () => const PassInPage(),binding: PassIndexBind()),
  GetPage(name: '/passwordTab', page: () => PasswordTabPage(),binding: PasswordTabBinding()),
  GetPage(name: '/passwordFirst', page: () => PasswordFirstPage(),binding: PasswordFirstBinding()),
  GetPage(name: '/passwordSecond', page: () => PasswordSecondPage(),binding: PasswordSecondBinding()),
  GetPage(name: '/passwordThird', page: () => PasswordThirdPage(),binding: PasswordThirdBinding()),
  GetPage(name: '/passwordToo', page: () => PassToo()),
  GetPage(name: '/feedback', page: () => FeedbackPage(),binding: FeedbackBinding()),
  GetPage(name: '/add', page: () => PasswordAddPage(), binding: PasswordAddBinding()),
  GetPage(name: '/edit', page: () => PasswordEditPage(),binding: PasswordEditBinding())
];
