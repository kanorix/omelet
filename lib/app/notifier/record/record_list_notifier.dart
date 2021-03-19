import 'package:omelet/app/config/export/default.dart';
import 'package:omelet/app/config/export/model.dart';
import 'package:omelet/app/config/export/repository.dart';

class RecordListNotifier extends ChangeNotifier {
  // 表示するレコード
  final Template template;

  // 表示するレコード
  Future<List<Record>> _records;

  // レコードのキャッシュ
  Future<List<Record>> _cache;

  Future<List<Record>> get records => _records;

  RecordRepository get recordRepository => GetIt.I<RecordRepository>();

  RecordListNotifier(this.template) {
    _loadRecords();
  }

  void _loadRecords() {
    _records = _cache = recordRepository.findAllBy(templateId: template.id);
    notifyListeners();
  }

  void reload() {
    _loadRecords();
  }

  void search(String query) async {
    _records = _cache.then((value) {
      return value.where((e) => e.items.first.content.contains(query)).toList();
    });
    notifyListeners();
  }

  Future<void> removeRecord(Record record) async {
    // 表示の関係でキャッシュのリストを削除する
    _records = _cache.then((v) {
      v.removeWhere((e) => e.id == record.id);
      return v;
    });
    notifyListeners();
    await recordRepository.delete(record);
    await recordRepository.eliminate();
  }
}
