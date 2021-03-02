import 'package:flutter/widgets.dart';
import 'package:omelet/app/view/page/record/page.dart';

class PageRouter {
  static const String home = '/';
  static const String record = '/record';
  static const String recordList = '/record/list';
  static const String recordCreate = '/record/create';
  static const String recordEdit = '/record/edit';

  static Map<String, WidgetBuilder> get routes =>
      _routes.map((key, value) => MapEntry(key, (_) => value));

  /// Create and return routes map.
  static final Map<String, Widget> _routes = {
    home: RecordPage(),
    record: RecordPage(),
    // recordList: RecordPage(),
    // recordCreate: RecordCreatePage(),
    // recordEdit: RecordEditPage(),
  };
}
