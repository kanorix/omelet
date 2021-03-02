import 'package:omelet/app/config/export/common.dart';

/// リポジトリベース
abstract class RepositoryBase<E extends ModelBase> {
  /// IDを元に取得
  Future<E> findById(String id);

  /// 全て取得
  Future<List<E>> findAll();

  /// 追加
  Future<void> insert(E entity);

  /// 変更
  Future<void> update(E entity);

  /// 論理削除
  Future<void> delete(E entity);

  /// 完全削除(delete_flgがtrueのものだけ)
  Future<void> eliminate();

  /// 全て完全削除(delete_flgの関係なく)
  Future<void> destroy();
}
