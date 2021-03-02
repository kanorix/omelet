class DateUtil {
  static String toIsoString(DateTime date) => date.toUtc().toIso8601String();
  static DateTime parseIso(String value) => DateTime.parse(value).toLocal();
  static String get updatedAt => toIsoString(DateTime.now());
}
