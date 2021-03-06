import 'package:clock/clock.dart';
import 'package:get_it/get_it.dart';
import 'package:omelet/common/sembast/sembast_db.dart';
import 'package:sembast/sembast.dart';
import 'package:uuid/uuid.dart';

import 'export/repository.dart';

void registerDependences() {
  // For Model
  GetIt.I.registerSingleton<Uuid>(Uuid());
  GetIt.I.registerSingleton<Clock>(Clock());

  // For Database
  GetIt.I.registerSingletonAsync<Database>(
    () async => SembastDataBase().getDataBase(),
  );
  GetIt.I.registerSingletonWithDependencies<RecordRepository>(
    () => RecordRepositorySembast(),
    dependsOn: [Database],
  );
}
