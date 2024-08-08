import 'dart:convert';
import 'package:app_password/db_password/password_entity.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBPassword extends GetxService {
  late Database dbBase;

  Future<DBPassword> init() async {
    await createPasswordDB();
    return this;
  }

  createPasswordDB() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'password.db');

    dbBase = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await createPasswordTable(db);
        });
  }

  createPasswordTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS password (id INTEGER PRIMARY KEY, createTime TEXT, image BLOB, appName TEXT, account TEXT, password TEXT, remark TEXT)');
  }

  insertPassword(PasswordEntity entity) async {
    final id = await dbBase.insert('password', {
      'createTime': entity.createTime.toIso8601String(),
      'image': entity.image,
      'appName': entity.appName,
      'account': entity.account,
      'password': entity.password,
      'remark': entity.remark,
    });
    return id;
  }

  updatePassword(PasswordEntity entity) async {
    await dbBase.update(
        'password',
        {
          'createTime': entity.createTime.toIso8601String(),
          'image': entity.image,
          'appName': entity.appName,
          'account': entity.account,
          'password': entity.password,
          'remark': entity.remark,
        },
        where: 'id = ?',
        whereArgs: [entity.id]);
  }

  deletePassword(PasswordEntity entity) async {
    await dbBase.delete('password', where: 'id = ?', whereArgs: [entity.id]);
  }

  cleanPasswordData() async {
    await dbBase.delete('password');
  }

  Future<List<PasswordEntity>> getAllData() async {
    var result = await dbBase.query('password', orderBy: 'createTime DESC');
    return result.map((e) => PasswordEntity.fromJson(e)).toList();
  }
}
