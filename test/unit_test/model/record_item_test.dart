import 'package:flutter_test/flutter_test.dart';
import 'package:omelet/app/config/export/model.dart';

void main() {
  test('RecordItem 引数なし', () {
    // 実行
    final item = RecordItem();

    // 値の検証
    expect(item.type, equals(RecordType.TEXT));
    expect(item.content, equals(''));
  });

  test('RecordItem 引数あり', () {
    // 実行
    final item = RecordItem(type: RecordType.DATE, content: 'content');

    // 値の検証
    expect(item.type, equals(RecordType.DATE));
    expect(item.content, equals('content'));
  });

  test('RecordItem.fromMap', () {
    // データの準備
    final map = {
      RecordItemField.type: 'TEXT',
      RecordItemField.content: 'content',
    };

    // 実行
    final item = RecordItem.fromMap(map);

    // 値の検証
    expect(item.type, equals(RecordType.TEXT));
    expect(item.content, equals('content'));
  });

  test('toMap', () {
    // データの準備
    final item = RecordItem(type: RecordType.TEXT, content: 'content');

    final expected = {
      RecordItemField.type: 'TEXT',
      RecordItemField.content: 'content',
    };

    // 実行
    final actual = item.toMap();

    // 値の検証
    expect(actual, equals(expected));

    // 呼び出し検証
  });
}
