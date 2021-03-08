import 'package:omelet/app/config/export/default.dart';

class ApplicationNotifier extends ChangeNotifier {
  // 検索モードかどうか
  bool _searchMode = false;

  get searchMode => _searchMode;

  void toggleSearchMode() {
    _searchMode = !_searchMode;
    notifyListeners();
  }
}
