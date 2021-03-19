import 'package:omelet/app/config/export/default.dart';

import 'package:omelet/common/helper/date_time_helper.dart';
import 'package:omelet/common/helper/string_helper.dart';

mixin HelperMixin {
  final stringHelper = GetIt.I<StringHelper>();
  final dateTimeHelper = GetIt.I<DateTimeHelper>();
}
