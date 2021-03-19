import 'package:omelet/app/config/export/default.dart';
import 'package:omelet/app/config/export/model.dart';
import 'package:omelet/common/base/repository_base.dart';

/// レコードリポジトリ
abstract class RecordRepository extends RepositoryBase<Record> {
  Future<List<Record>> findAllBy({String templateId});

  Future<void> insertWith(Record record, {@required Template template});
}
