import 'enum_record_type.dart';

class RecordItemField {
  static const type = 'type';
  static const content = 'content';
}

class RecordItem {
  final RecordType type;
  final String content;

  RecordItem({this.type = RecordType.TEXT, this.content = ''});

  RecordItem.fromMap(Map<String, Object> map)
      : this.type = recordType.valueOf(map[RecordItemField.type]),
        this.content = map[RecordItemField.content];

  Map<String, Object> toMap() {
    return {
      RecordItemField.type: this.type.name,
      RecordItemField.content: this.content,
    };
  }
}
