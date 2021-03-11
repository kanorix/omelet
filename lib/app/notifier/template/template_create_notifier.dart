import 'package:omelet/app/config/export/default.dart';
import 'package:omelet/app/config/export/model.dart';

class TemplateCreateNotifier extends ChangeNotifier {
  final Template _template;

  Template get template => _template;
  List<TemplateItem> get items => _template.items;
  int get length => _template.items.length;

  TemplateCreateNotifier({Template template})
      : this._template = template ?? Template();

  void addItem() {
    _template.items.add(TemplateItem());
    notifyListeners();
  }

  void removeItem(int index) {
    _template.items.removeAt(index);
    notifyListeners();
  }

  void updateItemType(int index, RecordType type) {
    _template.items[index].type = type;
  }

  void updateItemName(int index, String name) {
    _template.items[index].name = name;
  }
}
