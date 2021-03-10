import 'package:flutter/widgets.dart';
import 'package:omelet/app/config/export/page.dart';

class PageRouter {
  static const String home = '/';

  // static const String record = '/record';
  static const String recordList = '/record/list';
  static const String recordCreate = '/record/create';

  // static const String template = '/template';
  static const String templateList = '/template/list';
  static const String templateCreate = '/template/create';

  static Map<String, WidgetBuilder> get routes =>
      _routes.map((key, value) => MapEntry(key, (_) => value));

  /// Create and return routes map.
  static final Map<String, Widget> _routes = {
    // テンプレート 関連
    templateList: TemplateListPage(),
    templateCreate: TemplateCreatePage(),
    // レコード 関連
    recordList: RecordListPage(),
    recordCreate: RecordCreatePage(),
  };
}
