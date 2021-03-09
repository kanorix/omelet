import 'package:flutter/foundation.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sembast/sembast_memory.dart';
import 'package:sembast_web/sembast_web.dart';

class SembastDataBase {
  static const String name = 'omelet.db';
  static Database _database;

  Future<Database> _openDataBase({bool useMemory = false}) async {
    if (useMemory) {
      return databaseFactoryMemory.openDatabase(name);
    } else if (kIsWeb) {
      return databaseFactoryWeb.openDatabase(name);
    } else {
      final dir = await getApplicationDocumentsDirectory();
      return databaseFactoryIo.openDatabase(join(dir.path, name));
    }
  }

  /// DBを取得します。
  Future<Database> getDataBase({useMemory = false}) async =>
      _database ??= await _openDataBase(useMemory: useMemory);
}
