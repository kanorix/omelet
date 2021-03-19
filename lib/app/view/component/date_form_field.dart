import 'package:omelet/app/config/export/default.dart';
import 'package:omelet/common/helper/date_time_helper.dart';
import 'package:omelet/common/mixin/helper_mixin.dart';

class DateFormField extends StatelessWidget with HelperMixin {
  final _inputController = TextEditingController();

  final void Function(String) onChanged;
  final String Function(String) validator;
  final InputDecoration decoration;
  final String initialValue;

  DateFormField({
    this.onChanged,
    this.validator,
    this.decoration = const InputDecoration(),
    this.initialValue = '',
  });

  Future<void> _handleDate(BuildContext context) async {
    final value = _inputController.text;
    _inputController.text = value.isEmpty ? ' ' : value;

    final DateTime pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: dateTimeHelper.lastYear,
      lastDate: dateTimeHelper.nextYear,
    );

    if (pickedDate != null) {
      _inputController.text = dateTimeHelper.format(
        pickedDate,
        format: DateTimeFormat.yyyyMMdd,
      );
      onChanged(dateTimeHelper.toIsoString(pickedDate));
    } else {
      // フォーカスを外す
      FocusManager.instance.primaryFocus.unfocus();
      // 値を消す
      _inputController.text = value;
    }
  }

  @override
  Widget build(BuildContext context) {
    _inputController.text = initialValue;
    return TextFormField(
        readOnly: true,
        controller: _inputController,
        decoration: decoration,
        maxLines: 1,
        onTap: () => _handleDate(context),
        validator: validator);
  }
}
