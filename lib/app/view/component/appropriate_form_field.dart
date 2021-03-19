import 'package:omelet/app/config/export/default.dart';
import 'package:omelet/app/config/export/model.dart';

import 'date_form_field.dart';

class AppropriateFormField extends StatelessWidget {
  final TemplateItem templateItem;
  final RecordItem recordItem;
  final void Function(String) onChanged;
  final String Function(String) validator;

  AppropriateFormField(
    this.templateItem,
    this.recordItem, {
    this.onChanged,
    this.validator,
  });

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    switch (templateItem.type) {
      case RecordType.None:
      case RecordType.Text:
        return TextFormField(
          maxLength: 2048,
          maxLines: null,
          validator: validator,
          decoration: InputDecoration(labelText: templateItem.name),
          initialValue: recordItem.content,
          onChanged: onChanged,
        );
      case RecordType.Date:
        return DateFormField(
          validator: validator,
          decoration: InputDecoration(labelText: templateItem.name),
          initialValue: recordItem.content,
          onChanged: onChanged,
        );
        break;
    }
  }
}
