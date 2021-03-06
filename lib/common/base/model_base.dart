import 'package:clock/clock.dart';
import 'package:get_it/get_it.dart';
import 'package:uuid/uuid.dart';
import 'package:omelet/common/util/date_util.dart';

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

  ModelBase({
    DateTime updatedAt,
    bool deleteFlg,
  })  : this._id = GetIt.I<Uuid>().v4(),
        this._createdAt = GetIt.I<Clock>().now(),
        this.updatedAt = updatedAt ?? GetIt.I<Clock>().now(),
        this.deleteFlg = deleteFlg ?? false;

  /// マップからEntityに変換します。
  ModelBase.fromMap(Map<String, Object> map)
      : this._id = map[ModelBaseField.id],
        this._createdAt = DateUtil.parseIso(map[ModelBaseField.createdAt]),
        this.updatedAt = DateUtil.parseIso(map[ModelBaseField.updatedAt]),
        this.deleteFlg = map[ModelBaseField.deleteFlg];

  /// Entityをマップに変換します。
  /// 呼び出し時に [updatedAt] が更新される
  Map<String, Object> toMap() {
    return {
      ModelBaseField.id: this._id,
      ModelBaseField.createdAt: DateUtil.toIsoString(this._createdAt),
      ModelBaseField.updatedAt: DateUtil.updatedAt,
      ModelBaseField.deleteFlg: this.deleteFlg ?? false,
    };
  }
}
