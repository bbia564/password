import 'dart:typed_data';

import 'package:intl/intl.dart';

class PasswordEntity {
  int id;
  DateTime createTime;
  Uint8List image;
  String appName;
  String account;
  String password;
  String remark = '';
  PasswordEntity({
    required this.id,
    required this.createTime,
    required this.image,
    required this.appName,
    required this.account,
    required this.password,
    required this.remark,
  });

  factory PasswordEntity.fromJson(Map<String, dynamic> json) {
    return PasswordEntity(
      id: json['id'],
      createTime: DateTime.parse(json['createTime']),
      image: json['image'],
      appName: json['appName'],
      account: json['account'],
      password: json['password'],
      remark: json['remark'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createTime': createTime.toIso8601String(),
      'image': image,
      'appName': appName,
      'account': account,
      'password': password,
      'remark': remark,
    };
  }

  String get createTimeStr {
    return DateFormat('yyyy/MM/dd').format(createTime);
  }

}