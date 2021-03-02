/// リポジトリベース
abstract class Repository<T> {
  /// IDを元に取得
  Future<Map> findById(String id);

  /// 全て取得
  Future<List> findMapAll();

  /// 追加
  Future<void> insertMap(Map entity);

  /// 変更
  Future<void> updateMap(Map entity);

  /// 論理削除
  Future<void> deleteMap(Map entity);

  /// 完全削除(delete_flgがtrueのものだけ)
  Future<void> eliminate();

  /// 全て完全削除(delete_flgの関係なく)
  Future<void> destroy();
}
