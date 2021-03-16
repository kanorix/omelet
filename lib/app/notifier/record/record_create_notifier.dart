import 'package:omelet/app/config/export/default.dart';
import 'package:omelet/app/config/export/model.dart';
import 'package:omelet/app/config/export/repository.dart';
import 'package:omelet/common/mixin/validator_mixin.dart';

class RecordCreateNotifier extends ChangeNotifier with ValidatorMixin {
  final Template template;

  final Record _record;

  Record get record => _record;

  List<RecordItem> get items => _record.items;

  RecordRepository get recordRepository => GetIt.I<RecordRepository>();

  RecordCreateNotifier({
    this.template,
    Record record,
  }) : this._record = record ??
            Record(
              items: List.generate(
                template.items.length,
                (_) => RecordItem(),
              ),
            );

  void updateItem(int index, String content) {
    _record.items[index].content = content;
  }

  Future<bool> save() async {
    if (hasError()) return false;
    // await Future.delayed(Duration(seconds: 1));
    await recordRepository.insert(_record);
    print(_record);
    return true;
  }
}
