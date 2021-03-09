import 'package:clock/clock.dart';
import 'package:uuid/uuid.dart';
import 'package:get_it/get_it.dart';
import 'package:omelet/app/config/export/default.dart';
import 'package:omelet/common/helper/date_time_helper.dart';

class ModelBaseField {
  static const id = 'id';
  static const createdAt = 'createdAt';
  static const updatedAt = 'updatedAt';
  static const deleteFlg = 'deleteFlg';
}

abstract class ModelBase {
  /// ID
  final String _id;

  /// 作成日時
  final DateTime _createdAt;

  /// 更新日時
  DateTime updatedAt;

  /// 削除フラグ
  bool deleteFlg;

  String get id => _id;

  DateTime get createdAt => _createdAt;

  ModelBase()
      : this._id = GetIt.I<Uuid>().v4(),
        this._createdAt = GetIt.I<Clock>().now(),
        this.updatedAt = GetIt.I<Clock>().now(),
        this.deleteFlg = false;

  /// マップからEntityに変換します。
  ModelBase.fromMap(Map<String, Object> map)
      : this._id = map[ModelBaseField.id],
        this._createdAt =
            GetIt.I<DateTimeHelper>().parseIso(map[ModelBaseField.createdAt]),
        this.updatedAt =
            GetIt.I<DateTimeHelper>().parseIso(map[ModelBaseField.updatedAt]),
        this.deleteFlg = map[ModelBaseField.deleteFlg] ?? false;

  /// Entityをマップに変換します。
  Map<String, Object> toMap() {
    return {
      ModelBaseField.id: id,
      ModelBaseField.createdAt:
          GetIt.I<DateTimeHelper>().toIsoString(createdAt),
      ModelBaseField.updatedAt:
          GetIt.I<DateTimeHelper>().toIsoString(updatedAt),
      ModelBaseField.deleteFlg: deleteFlg,
    };
  }
}
