import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:omelet/app/config/export/notifier.dart';

import 'app/config/dependences.dart';
import 'app/config/export/default.dart';
import 'app/config/page/route.dart';
import 'app/config/theme.dart';

void main() {
  registerDependences();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ApplicationNotifier>(
          create: (_) => ApplicationNotifier(),
        ),
      ],
      child: FutureBuilder(
        future: GetIt.I.allReady(),
        builder: (_, AsyncSnapshot snapshot) {
          if (!snapshot.hasData)
            return Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            );

          // 以下、マテリアルAPPの設定
          return MaterialApp(
            // debugのバーナーを出すかどうか
            debugShowCheckedModeBanner: false,
            // テーマの設定
            theme: ThemeConfig.light(),
            darkTheme: ThemeConfig.dark(),
            // テーマはシステム設定に従う
            themeMode: ThemeMode.system,
            // ルートの設定
            initialRoute: '/frame/list',
            routes: PageRouter.routes,
          );
        },
      ),
    );
  }
}
