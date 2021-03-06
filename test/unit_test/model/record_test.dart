import 'package:clock/clock.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:omelet/app/config/export/default.dart';
import 'package:omelet/app/config/export/model.dart';
import 'package:omelet/app/model/record.dart';
import 'package:omelet/common/base/model_base.dart';
import 'package:omelet/common/helper/date_time_helper.dart';
import 'package:uuid/uuid.dart';

class MockClock extends Mock implements Clock {}

class MockUuid extends Mock implements Uuid {}

class MockRecordItem extends Mock implements RecordItem {}

class MockDateTimeHelper extends Mock implements DateTimeHelper {}

void main() {
  final created = DateTime(2021, 3, 7);
  final updated = DateTime(2021, 3, 8);

  final uuid = MockUuid();
  final clock = MockClock();

  setUp(() {
    final times = [created, updated];

    // mock化
    when(uuid.v4()).thenReturn('uuid-v4');
    when(clock.now()).thenAnswer((_) => times.removeAt(0));

    // GetItに登録
    GetIt.I.registerSingleton<Uuid>(uuid);
    GetIt.I.registerSingleton<Clock>(clock);
  });

  tearDown(() {
    // 登録削除
    GetIt.I.reset();

    // これ以上呼び出されないこと
    verifyNoMoreInteractions(uuid);
    verifyNoMoreInteractions(clock);
  });

  test('Record', () {
    // 実行
    final record = Record();

    // 値の検証
    expect(record.templateId, equals(''));
    expect(record.title, equals(''));
    expect(record.items, equals([]));

    // 呼び出し検証
    verify(uuid.v4());
    verify(clock.now()).called(2);
  });

  test('Record.fromMap', () {
    // データの準備
    const itemMap = {'itemField': 'value'};

    final map = {
      RecordField.templateId: 'template-id',
      RecordField.title: 'title',
      RecordField.items: [itemMap],
      // ModelBase
      ModelBaseField.id: 'uuid-v4',
      ModelBaseField.createdAt: 'created',
      ModelBaseField.updatedAt: 'updated',
      ModelBaseField.deleteFlg: false,
    };

    final helper = MockDateTimeHelper();
    final recordItem = RecordItem();
    final RecordItem Function(dynamic) generator = (e) => recordItem;

    // mock化
    when(helper.parseIso('created')).thenReturn(created);
    when(helper.parseIso('updated')).thenReturn(updated);
    GetIt.I.registerSingleton<DateTimeHelper>(helper);

    // 実行
    final record = Record.fromMap(map, recordItemGenerator: generator);

    // 値の検証
    expect(record.templateId, equals('template-id'));
    expect(record.title, equals('title'));
    expect(record.items, equals([recordItem]));

    // 呼び出し検証
    verify(helper.parseIso('created'));
    verify(helper.parseIso('updated'));
  });

  test('toMap', () {
    // データの準備
    final helper = MockDateTimeHelper();

    final item1 = MockRecordItem();
    final item2 = MockRecordItem();
    const item1Map = {'item1Field': 'value1'};
    const item2Map = {'item2Field': 'value2'};

    final record = Record(
      templateId: 'template-id',
      title: 'title',
      items: [item1, item2],
    );

    final expected = {
      RecordField.templateId: 'template-id',
      RecordField.title: 'title',
      RecordField.items: [item1Map, item2Map],
      // ModelBase
      ModelBaseField.id: 'uuid-v4',
      ModelBaseField.createdAt: 'created',
      ModelBaseField.updatedAt: 'updated',
      ModelBaseField.deleteFlg: false,
    };

    // mock化
    when(item1.toMap()).thenReturn(item1Map);
    when(item2.toMap()).thenReturn(item2Map);
    when(helper.toIsoString(created)).thenReturn('created');
    when(helper.toIsoString(updated)).thenReturn('updated');
    GetIt.I.registerSingleton<DateTimeHelper>(helper);

    // 実行
    final actual = record.toMap();

    // 値の検証
    expect(actual, equals(expected));

    // 呼び出し検証
    verify(uuid.v4());
    verify(clock.now()).called(2);
    verify(helper.toIsoString(created));
    verify(helper.toIsoString(updated));
  });
}
