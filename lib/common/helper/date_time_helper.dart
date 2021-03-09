class DateTimeHelper {
  String toIsoString(DateTime date) => date.toUtc().toIso8601String();
  DateTime parseIso(String value) => DateTime.parse(value).toLocal();
}
