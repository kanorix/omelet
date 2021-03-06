import 'package:omelet/app/config/export/common.dart';
import 'package:omelet/app/config/export/model.dart';

class RecordField extends ModelBaseField {
  static const templateId = 'templateId';
  static const title = 'title';
  static const items = 'items';
}

class Record extends ModelBase {
  String templateId;
  String title;
  List<RecordItem> items;

  @override
  Record({
    this.templateId = "",
    this.title = "",
    this.items = const [],
  }) : super();

  @override
  Record.fromMap(
    Map<String, Object> map, {
    RecordItem Function() recordItemGenerator,
  })  : this.templateId = map[RecordField.templateId],
        this.title = map[RecordField.title],
        this.items = (map[RecordField.items] as List)
            .map<RecordItem>(
                recordItemGenerator ?? (e) => RecordItem.fromMap(e))
            .toList(),
        super.fromMap(map);

  @override
  Map<String, Object> toMap() {
    return {
      RecordField.templateId: templateId,
      RecordField.title: title,
      RecordField.items: items.map((e) => e.toMap()).toList(),
      ...super.toMap(),
    };
  }
}
