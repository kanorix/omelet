import 'package:omelet/app/config/export/common.dart';
import 'package:omelet/app/config/export/default.dart';
import 'package:omelet/app/config/export/model.dart';
import 'package:omelet/app/repository/record_repository.dart';
import 'package:omelet/common/sembast/sembast_repository_base.dart';
import 'package:sembast/sembast.dart';

class RecordRepositorySembast extends SembastRepositoryBase<Record>
    implements RecordRepository {
  RecordRepositorySembast() : super('record', (e) => Record.fromMap(e));

  /// 追加
  @override
  Future<void> insertWith(Record record, {@required Template template}) async {
    record.templateId = template.id;
    return insert(record);
  }

  @override
  Future<List<Record>> findAllBy({String templateId}) async {
    final finder = Finder(
      filter: Filter.and(
        [
          Filter.equals(RecordField.templateId, templateId ?? ''),
          Filter.equals(ModelBaseField.deleteFlg, false),
        ],
      ),
    );
    final recordSnapshots = await store.find(database, finder: finder);

    final snapshots = recordSnapshots.map((e) => converter(e.value)).toList();
    snapshots.sort((r, c) => r.createdAt.compareTo(c.createdAt));

    return snapshots;
  }
}
