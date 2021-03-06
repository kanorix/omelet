import 'package:get_it/get_it.dart';
import 'package:omelet/app/config/export/common.dart';
import 'package:omelet/common/base/repository_base.dart';
import 'package:sembast/sembast.dart';

class SembastRepositoryBase<E extends ModelBase> extends RepositoryBase<E> {
  final Database _database;
  final StoreRef store;
  final E Function(Map) converter;

  RecordRef getEntity(E entity) => store.record(entity.id);

  SembastRepositoryBase(String storeName, E Function(Map) converter)
      : this._database = GetIt.I<Database>(),
        this.store = stringMapStoreFactory.store(storeName),
        this.converter = converter;

  @override
  Future<E> findById(String id) async {
    final finder = Finder(filter: Filter.byKey(id), limit: 1);
    final recordSnapshots = await store.find(_database, finder: finder);

    return converter(recordSnapshots.first.value);
  }

  @override
  Future<List<E>> findAll() async {
    final finder = Finder(filter: Filter.equals('deleteFlg', false));
    final recordSnapshots = await store.find(_database, finder: finder);

    final snapshots = recordSnapshots.map((e) => converter(e.value)).toList();
    snapshots.sort((r, c) => r.createdAt.compareTo(c.createdAt));

    return snapshots;
  }

  /// 追加
  @override
  Future<void> insert(E entity) async {
    await _database.transaction((txn) async {
      await getEntity(entity).add(txn, entity.toMap());
    });
  }

  /// 変更
  @override
  Future<void> update(E entity) async {
    await _database.transaction((txn) async {
      await getEntity(entity).update(txn, entity.toMap());
    });
  }

  /// 論理削除
  @override
  Future<void> delete(E entity) async {
    entity.deleteFlg = true;
    update(entity);
  }

  /// 完全削除
  @override
  Future<void> eliminate() async {
    final finder = Finder(
      filter: Filter.equals(ModelBaseField.deleteFlg, true),
    );

    await _database.transaction((txn) async {
      await store.delete(txn, finder: finder);
    });
  }

  /// 全て完全削除
  @override
  Future<void> destroy() async {
    await _database.transaction((txn) async {
      await store.delete(txn);
    });
  }
}
