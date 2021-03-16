import 'package:omelet/app/config/export/default.dart';
import 'package:omelet/app/config/export/model.dart';
import 'package:omelet/app/config/export/repository.dart';

class TemplateListNotifier extends ChangeNotifier {
  // 表示するテンプレート
  Future<List<Template>> _templates;

  Future<List<Template>> get templates => _templates;

  TemplateRepository get templateRepository => GetIt.I<TemplateRepository>();

  TemplateListNotifier() {
    _loadRecords();
  }

  void _loadRecords() async {
    _templates = templateRepository.findAll();
    notifyListeners();
  }

  void reload() {
    _loadRecords();
  }
}
