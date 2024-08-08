import 'package:get/get.dart';
import 'dart:math';

class PasswordSecondLogic extends GetxController {

  var maxNum = 12.obs;

  var upperCase = true.obs;
  var lowerCase = true.obs;
  var number = true.obs;
  var symbol = true.obs;

  var result = '-'.obs;


  void addSub({bool isAdd = true}) {
    if (isAdd) {
      if (maxNum.value < 15) {
        maxNum.value++;
        generateRandomString(
          includeUppercase: upperCase.value,
          includeLowercase: lowerCase.value,
          includeNumbers: number.value,
          includeSymbols: symbol.value,
          length: maxNum.value,
        );
      }
    } else {
      if (maxNum.value > 6) {
        maxNum.value--;
        generateRandomString(
          includeUppercase: upperCase.value,
          includeLowercase: lowerCase.value,
          includeNumbers: number.value,
          includeSymbols: symbol.value,
          length: maxNum.value,
        );
      }
    }
  }

  void generateRandomString({
    bool includeUppercase = true,
    bool includeLowercase = true,
    bool includeNumbers = true,
    bool includeSymbols = true,
    int length = 8,
  }) {
    const String uppercaseLetters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const String lowercaseLetters = 'abcdefghijklmnopqrstuvwxyz';
    const String numbers = '0123456789';
    const String symbols = '!@#\$%^&*()_+-=[]{}|;:,.<>?';

    String characterPool = '';

    if (includeUppercase) {
      characterPool += uppercaseLetters;
    }
    if (includeLowercase) {
      characterPool += lowercaseLetters;
    }
    if (includeNumbers) {
      characterPool += numbers;
    }
    if (includeSymbols) {
      characterPool += symbols;
    }

    Random random = Random();
    String randomString = '';

    for (int i = 0; i < length; i++) {
      randomString += characterPool[random.nextInt(characterPool.length)];
    }
    result.value = randomString;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    generateRandomString(
      includeUppercase: upperCase.value,
      includeLowercase: lowerCase.value,
      includeNumbers: number.value,
      includeSymbols: symbol.value,
      length: maxNum.value,
    );
    super.onInit();
  }

}
