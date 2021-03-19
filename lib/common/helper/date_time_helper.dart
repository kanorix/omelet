import 'package:intl/intl.dart';

enum DateTimeFormat {
  yyyyMMddHm,
  yyyyMMdd,
  Hm,
}

class DateTimeHelper {
  String toIsoString(DateTime date) => date.toUtc().toIso8601String();
  DateTime parseIso(String value) => DateTime.parse(value).toLocal();

  get lastYear => getPast(years: 1);
  get nextYear => getFuture(years: 1);

  Duration _getDuration(int years, int days, int hours, int minutes) {
    int sumDays = (years * 365) + days;
    return Duration(days: sumDays, hours: hours, minutes: minutes);
  }

  DateTime getPast(
      {int years = 0, int days = 0, int hours = 0, int minutes = 0}) {
    return DateTime.now().add(_getDuration(years, days, hours, minutes) * -1);
  }

  DateTime getFuture(
      {int years = 0, int days = 0, int hours = 0, int minutes = 0}) {
    return DateTime.now().add(_getDuration(years, days, hours, minutes));
  }

  DateFormat getFormatter(DateTimeFormat format) {
    switch (format) {
      case DateTimeFormat.yyyyMMddHm:
        return DateFormat('yyyy/MM/dd HH:mm');
      case DateTimeFormat.yyyyMMdd:
        return DateFormat('yyyy/MM/dd');
      case DateTimeFormat.Hm:
        return DateFormat('HH:mm');
    }
    return DateFormat('yyyy/MM/dd HH:mm');
  }

  String format(
    DateTime dateTime, {
    DateTimeFormat format = DateTimeFormat.yyyyMMddHm,
  }) {
    return getFormatter(format).format(dateTime);
  }
}
