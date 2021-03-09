import 'package:omelet/app/config/export/default.dart';
import 'package:omelet/app/config/export/model.dart';
import 'package:omelet/app/config/export/repository.dart';

class RecordListNotifier extends ChangeNotifier {
  // context
  final BuildContext _ctx;

  // 表示するレコード
  Future<List<Record>> _records;

  // レコードのキャッシュ
  Future<List<Record>> _cache;

  Future<List<Record>> get records => _records;

  RecordRepository get recordRepository => _ctx.read<RecordRepositorySembast>();

  RecordListNotifier(this._ctx) {
    _loadRecords();
  }

  void _loadRecords() async {
    _records = _cache = recordRepository.findAll();
    notifyListeners();
  }

  void search(String query) async {
    _records = _cache.then((value) {
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
