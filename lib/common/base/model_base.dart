import 'package:omelet/common/util/date_util.dart';
import 'package:uuid/uuid.dart';

class ModelBaseField {
  static const id = 'id';
  static const createdAt = 'createdAt';
  static const updatedAt = 'updatedAt';
  static const deleteFlg = 'deleteFlg';
}

abstract class ModelBase {
  /// ID
  final String id;

  /// 作成日時
  final DateTime createdAt;

  /// 更新日時
  DateTime updatedAt;

  /// 削除フラグ
  bool deleteFlg;

  ModelBase({
    DateTime updatedAt,
    bool deleteFlg,
  })  : this.id = Uuid().v4(),
        this.createdAt = DateTime.now(),
        this.updatedAt = updatedAt ?? DateTime.now(),
        this.deleteFlg = deleteFlg ?? false;

  /// マップからEntityに変換します。
  ModelBase.fromMap(Map<String, Object> map)
      : this.id = map[ModelBaseField.id],
        this.createdAt = DateUtil.parseIso(map[ModelBaseField.createdAt]),
        this.updatedAt = DateUtil.parseIso(map[ModelBaseField.updatedAt]),
        this.deleteFlg = map[ModelBaseField.deleteFlg];

  /// Entityをマップに変換します。
  /// 呼び出し時に [updatedAt] が更新される
  Map<String, Object> toMap() {
    return {
      ModelBaseField.id: this.id,
      ModelBaseField.createdAt: DateUtil.toIsoString(this.createdAt),
      ModelBaseField.updatedAt: DateUtil.updatedAt,
      ModelBaseField.deleteFlg: this.deleteFlg ?? false,
    };
  }
}
