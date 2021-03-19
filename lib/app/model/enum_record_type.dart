enum RecordType {
  None,
  Text,
  Date,
  Time,
}

extension RecordTypeEx on RecordType {
  static const Map _fieldMap = {
    RecordType.None: [0, ''],
    RecordType.Text: [1, '文字'],
    RecordType.Date: [2, '日付'],
    RecordType.Time: [3, '時間'],
  };

  String get name => this.toString().split('.').last;

  int get id => _getField<int>(0);

  RecordType valueOf(String name) =>
      RecordType.values.firstWhere((e) => e.name == name);

  T _getField<T>(int fieldId) {
    return _fieldMap[this][fieldId];
  }
}

// メソッドを使用するために定数として置いておく
const RecordType recordType = RecordType.None;
