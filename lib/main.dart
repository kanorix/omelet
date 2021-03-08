import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omelet/app/config/export/notifier.dart';
import 'package:omelet/app/config/export/repository.dart';

import 'app/config/export/default.dart';
import 'app/config/page/route.dart';

void main() {
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
        Provider(create: (_) => RecordRepositorySembast()),
      ],
      child: MaterialApp(
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
      ),
    );
  }
}
