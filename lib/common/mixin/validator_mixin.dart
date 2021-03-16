import 'package:omelet/app/config/export/default.dart';

mixin ValidatorMixin {
  /// フォームキー
  final formKey = GlobalKey<FormState>();

  /// varidateエラーがあるか
  bool hasError() => !formKey.currentState.validate();
}
