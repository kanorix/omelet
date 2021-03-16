import 'package:omelet/app/config/export/default.dart';
import 'package:omelet/app/config/export/model.dart';
import 'package:omelet/app/config/export/repository.dart';
import 'package:omelet/common/mixin/validator_mixin.dart';

class TemplateCreateNotifier extends ChangeNotifier with ValidatorMixin {
  final Template _template;

  Template get template => _template;

  List<TemplateItem> get items => _template.items;

  TemplateRepository get templateRepository => GetIt.I<TemplateRepository>();

  TemplateCreateNotifier({Template template})
      : this._template = template ?? Template(items: [TemplateItem()]);

  void addItem() {
    _template.items.add(TemplateItem());
    notifyListeners();
  }

  void removeItem(int index) {
    if (items.length == 1) return;
    _template.items.removeAt(index);
    notifyListeners();
  }

  void updateItemType(int index, RecordType type) {
    _template.items[index].type = type;
  }

  void updateItemName(int index, String name) {
    _template.items[index].name = name;
  }

  Future<bool> save() async {
    if (hasError()) return false;
    // await Future.delayed(Duration(seconds: 1));
    await templateRepository.insert(_template);
    print(_template);
    return true;
  }
}
