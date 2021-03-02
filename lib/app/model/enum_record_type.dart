enum RecordType {
  NONE,
  TEXT,
  DATE,
}

extension RecordTypeEx on RecordType {
  static const Map _fieldMap = {
    RecordType.NONE: [0],
    RecordType.TEXT: [1],
    RecordType.DATE: [2],
  };

  String get name => this.toString().split('.').last;

  int get id => _getField(0);

  RecordType valueOf(String name) =>
      RecordType.values.firstWhere((e) => e.name == name);

  dynamic _getField(int fieldId) {
    return _fieldMap[this][fieldId];
  }
}

// メソッドを使用するために定数として置いておく
const RecordType recordType = RecordType.NONE;
