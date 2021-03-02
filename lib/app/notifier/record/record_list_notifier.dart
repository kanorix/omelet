import 'package:omelet/app/config/export/default.dart';
import 'package:omelet/app/config/export/model.dart';
import 'package:omelet/app/config/export/repository.dart';

class RecordListNotifier extends ChangeNotifier {
  // context
  final BuildContext _ctx;

  // レコード
  Future<List<Record>> _records;

  RecordListNotifier(this._ctx) {
    _loadRecords();
  }

  Future<List<Record>> get records => _records;

  RecordRepository get recordRepository => _ctx.read<RecordRepositorySembast>();

  void _loadRecords() async {
    _records = recordRepository.findAll();
    notifyListeners();
  }

  void addRecord() async {
    await recordRepository.insert(Record(title: "title"));
    _loadRecords();
  }

  void removeRecord() async {
    await recordRepository.destroy();
    _loadRecords();
  }
}
