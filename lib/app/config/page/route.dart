import 'package:flutter/widgets.dart';
import 'package:omelet/app/config/export/page.dart';

class PageRouter {
  static const String home = '/';

  // static const String record = '/record';
  static const String recordList = '/record/list';
  static const String recordCreate = '/record/create';

  // static const String frame = '/frame';
  static const String frameList = '/frame/list';
  static const String frameCreate = '/frame/create';

  static Map<String, WidgetBuilder> get routes =>
      _routes.map((key, value) => MapEntry(key, (_) => value));

  /// Create and return routes map.
  static final Map<String, Widget> _routes = {
    home: FrameListPage(),
    // 枠 関連
    frameList: FrameListPage(),
    frameCreate: FrameCreatePage(),
    // レコード 関連
    recordList: RecordListPage(),
    recordCreate: RecordCreatePage(),
  };
}
