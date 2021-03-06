import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app/config/dependences.dart';
import 'app/config/export/default.dart';
import 'app/config/page/route.dart';

void main() {
  registerDependences();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  build(BuildContext context) {
    return FutureBuilder(
      future: GetIt.I.allReady(),
      builder: (_, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) return CircularProgressIndicator();
        return MaterialApp(
          // debugのバーナーを出すかどうか
          debugShowCheckedModeBanner: false,
          // 日本語フォントの設定
          theme: ThemeData(
            textTheme: GoogleFonts.getTextTheme(
              'M PLUS Rounded 1c',
              Theme.of(context).textTheme,
            ),
          ),
          // ルートの設定
          routes: PageRouter.routes,
        );
      },
    );
  }
}
