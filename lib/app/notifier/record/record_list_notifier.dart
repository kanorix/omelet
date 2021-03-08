import 'dart:async';

import 'package:omelet/app/config/export/default.dart';
import 'package:omelet/app/config/export/model.dart';
import 'package:omelet/app/config/export/repository.dart';

class RecordListNotifier extends ChangeNotifier {
  // context
  final BuildContext _ctx;

  // 表示するレコード
  Future<List<Record>> _records;

  // 全件レコード
  Future<List<Record>> _simpleRecords;

  RecordListNotifier(this._ctx) {
    _loadRecords();
  }

  Future<List<Record>> get records => _records;

  RecordRepository get recordRepository => _ctx.read<RecordRepositorySembast>();

  void _loadRecords() async {
    _simpleRecords = recordRepository.findAll();
    _records = _simpleRecords;
    notifyListeners();
  }

  void search(String query) async {
    _records = _simpleRecords.then((value) {
      return value.where((element) => element.title.contains(query)).toList();
    });
    notifyListeners();
  }

  void addRecord({String title = 'no-title'}) async {
    await recordRepository.insert(Record(title: title));
    _loadRecords();
  }

  void removeRecord() async {
    await recordRepository.destroy();
    _loadRecords();
  }
}
