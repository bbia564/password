
import 'package:app_password/pages/password_first/password_add/password_add_view.dart';
import 'package:app_password/pages/password_first/password_edit/password_edit_binding.dart';
import 'package:app_password/pages/password_first/password_edit/password_edit_view.dart';
import 'package:app_password/pages/password_tab/password_tab_view.dart';
import 'package:app_password/pages/password_third/feedback/feedback_binding.dart';
import 'package:app_password/pages/password_third/feedback/feedback_view.dart';
import 'package:app_password/router/password_names.dart';
import 'package:get/get.dart';

import '../pages/password_first/password_add/password_add_binding.dart';
import '../pages/password_first/password_first_binding.dart';
import '../pages/password_first/password_first_view.dart';
import '../pages/password_second/password_second_binding.dart';
import '../pages/password_second/password_second_view.dart';
import '../pages/password_tab/password_tab_binding.dart';
import '../pages/password_third/password_third_binding.dart';
import '../pages/password_third/password_third_view.dart';

class PasswordPages {

  static pageBuilder({
    required String name,
    required GetPageBuilder page,
    Bindings? binding,
  }) {
    return GetPage(
      name: name,
      page: page,
      binding: binding,
      preventDuplicates: true,
      transition: Transition.cupertino,
      popGesture: true,
    );
  }

  static List<GetPage> list = [
    pageBuilder(name: PasswordNames.passwordTab, page: () => PasswordTabPage(),binding: PasswordTabBinding()),
    pageBuilder(name: PasswordNames.passwordFirst, page: () => PasswordFirstPage(),binding: PasswordFirstBinding()),
    pageBuilder(name: PasswordNames.passwordSecond, page: () => PasswordSecondPage(),binding: PasswordSecondBinding()),
    pageBuilder(name: PasswordNames.passwordThird, page: () => PasswordThirdPage(),binding: PasswordThirdBinding()),
    pageBuilder(name: PasswordNames.feedback, page: () => FeedbackPage(),binding: FeedbackBinding()),
    pageBuilder(name: PasswordNames.add, page: () => PasswordAddPage(), binding: PasswordAddBinding()),
    pageBuilder(name: PasswordNames.edit, page: () => PasswordEditPage(),binding: PasswordEditBinding())

  ];
}