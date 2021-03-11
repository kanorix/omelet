import 'package:omelet/app/config/export/common.dart';
import 'package:omelet/app/config/export/model.dart';

class TemplateField extends ModelBaseField {
  static const title = 'title';
  static const items = 'items';
}

class Template extends ModelBase {
  String title;
  List<TemplateItem> items;

  @override
  Template({this.title = "", List<TemplateItem> items})
      : this.items = items ?? [],
        super();

  @override
  Template.fromMap(
    Map<String, Object> map, {
    TemplateItem Function(dynamic) recordItemGenerator,
  })  : this.title = map[TemplateField.title],
        this.items = (map[TemplateField.items] as List)
            .map<TemplateItem>(
                recordItemGenerator ?? (e) => TemplateItem.fromMap(e))
            .toList(),
        super.fromMap(map);

  @override
  Map<String, Object> toMap() {
    return {
      TemplateField.title: title,
      TemplateField.items: items.map((e) => e.toMap()).toList(),
      ...super.toMap(),
    };
  }
}
