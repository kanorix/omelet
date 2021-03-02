import 'package:flutter/foundation.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sembast_web/sembast_web.dart';

class SembastDataBase {
  static const String name = 'omelet.db';
  static SembastDataBase _instance;
  static Database _database;

  factory SembastDataBase() => _instance ??= SembastDataBase._internal();

  // 内部コンストラクタ
  SembastDataBase._internal();

  Future<Database> _initSembast() async {
    // webの場合
    if (kIsWeb) {
      return await databaseFactoryWeb.openDatabase(name);
    }

    // 以外の場合
    final applicationDocumentDir = await getApplicationDocumentsDirectory();
    final path = join(applicationDocumentDir.path, name);

    return await databaseFactoryIo.openDatabase(path);
  }

  /// DBを取得します。
  Future<Database> getDataBase() async {
    _database ??= await _initSembast();
    return _database;
  }
}
