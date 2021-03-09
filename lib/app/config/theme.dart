import 'export/default.dart';

class ThemeConfig {
  static const fontFamily = 'MPLUSRounded1c';

  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.deepOrange,
      snackBarTheme: SnackBarThemeData(
        contentTextStyle: TextStyle(
          color: Colors.white,
          fontFamily: fontFamily,
        ),
      ),
      // 以下は共通のテーマ
      fontFamily: fontFamily,
    );
  }

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.grey,
      snackBarTheme: SnackBarThemeData(
        backgroundColor: Colors.white38,
        contentTextStyle: TextStyle(
          color: Colors.black,
          fontFamily: fontFamily,
        ),
      ),
      // 以下は共通のテーマ
      fontFamily: fontFamily,
    );
  }
}
