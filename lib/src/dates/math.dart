// Date/time math helpers distinguishing calendar math from time math.

int _daysInMonth(int year, int month) => DateTime(year, month + 1, 0).day;

DateTime calendarAddMonths(DateTime dt, int months) {
  var y = dt.year;
  var m = dt.month + months;
  y += (m - 1) ~/ 12;
  m = ((m - 1) % 12) + 1;
  final d = dt.day;
  final maxDay = _daysInMonth(y, m);
  final day = d > maxDay ? maxDay : d;
  return dt.isUtc
      ? DateTime.utc(y, m, day, dt.hour, dt.minute, dt.second, dt.millisecond, dt.microsecond)
      : DateTime(y, m, day, dt.hour, dt.minute, dt.second, dt.millisecond, dt.microsecond);
}

DateTime calendarAddYears(DateTime dt, int years) {
  final y = dt.year + years;
  final m = dt.month;
  final d = dt.day;
  final maxDay = _daysInMonth(y, m);
  final day = d > maxDay ? maxDay : d;
  return dt.isUtc
      ? DateTime.utc(y, m, day, dt.hour, dt.minute, dt.second, dt.millisecond, dt.microsecond)
      : DateTime(y, m, day, dt.hour, dt.minute, dt.second, dt.millisecond, dt.microsecond);
}

extension DateTimeCalendarMath on DateTime {
  /// Calendar math: add months with end-of-month clamping.
  DateTime addCalendarMonths(int months) => calendarAddMonths(this, months);

  /// Calendar math: add years with end-of-month clamping.
  DateTime addCalendarYears(int years) => calendarAddYears(this, years);
}
