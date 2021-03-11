import 'enum_record_type.dart';

class TemplateItemField {
  static const type = 'type';
  static const name = 'name';
}

class TemplateItem {
  RecordType type;
  String name;

  TemplateItem({this.type = RecordType.TEXT, this.name = ''});

  TemplateItem.fromMap(Map<String, Object> map)
      : this.type = recordType.valueOf(map[TemplateItemField.type]),
        this.name = map[TemplateItemField.name];

  Map<String, Object> toMap() {
    return {
      TemplateItemField.type: type.name,
      TemplateItemField.name: name,
    };
  }
}
