import 'locale_string.dart';

/// DateTime formatting helpers and an extension for convenient calls.
extension DateTimeFormatting on DateTime {
  // ISO 8601 full with milliseconds and timezone offset (or Z for UTC)
  String toISO() {
    final y = _pad(year, 4);
    final m = _pad(month, 2);
    final d = _pad(day, 2);
    final hh = _pad(hour, 2);
    final mm = _pad(minute, 2);
    final ss = _pad(second, 2);
    final ms = _pad(millisecond, 3);
    final off = isUtc ? 'Z' : _tzOffsetWithColon(timeZoneOffset);
    return '$y-$m-${d}T$hh:$mm:$ss.$ms$off';
  }

  // ISO 8601 Date component
  String toISODate() => '${_pad(year, 4)}-${_pad(month, 2)}-${_pad(day, 2)}';

  // ISO 8601 Time with milliseconds and offset
  String toISOTime() {
    final hh = _pad(hour, 2);
    final mm = _pad(minute, 2);
    final ss = _pad(second, 2);
    final ms = _pad(millisecond, 3);
    final off = isUtc ? 'Z' : _tzOffsetWithColon(timeZoneOffset);
    return '$hh:$mm:$ss.$ms$off';
  }

  // ISO week date, e.g., 2017-W17-7
  String toISOWeekDate() {
    final isoData = _isoWeekData(this);
    final y = _pad(isoData.year, 4);
    final w = _pad(isoData.week, 2);
    final wd = isoData.weekday; // 1..7
    return '$y-W$w-$wd';
  }

  // RFC 2822: Thu, 20 Apr 2017 11:32:00 -0400 (local offset)
  String toRFC2822() {
    final w = _weekdayShort[weekday - 1];
    final mon = _monthShort[month - 1];
    final off = isUtc ? '+0000' : _tzOffsetNoColon(timeZoneOffset);
    return '$w, ${_pad(day, 2)} $mon ${_pad(year, 4)} ${_pad(hour, 2)}:${_pad(minute, 2)}:${_pad(second, 2)} $off';
  }

  // HTTP-date (RFC 7231): always GMT
  String toHTTP() {
    final u = toUtc();
    final w = _weekdayShort[u.weekday - 1];
    final mon = _monthShort[u.month - 1];
    return '$w, ${_pad(u.day, 2)} $mon ${_pad(u.year, 4)} ${_pad(u.hour, 2)}:${_pad(u.minute, 2)}:${_pad(u.second, 2)} GMT';
  }

  // HTTP-style in French (non-standard, human-readable with FR names), always GMT
  String toHTTPFr() {
    final u = toUtc();
    final w = _weekdayShortFr[u.weekday - 1];
    final mon = _monthShortFr[u.month - 1];
    return '$w, ${_pad(u.day, 2)} $mon ${_pad(u.year, 4)} ${_pad(u.hour, 2)}:${_pad(u.minute, 2)}:${_pad(u.second, 2)} GMT';
  }

  // Unix timestamps
  int toMillis() => millisecondsSinceEpoch;
  double toSeconds() => millisecondsSinceEpoch / 1000.0;
  int toUnixInteger() => (millisecondsSinceEpoch / 1000).floor();
  int valueOf() => toMillis();
}

String _pad(int v, int width) => v.toString().padLeft(width, '0');

String _tzOffsetWithColon(Duration offset) {
  final sign = offset.isNegative ? '-' : '+';
  final abs = offset.abs();
  final hh = _pad(abs.inHours, 2);
  final mm = _pad(abs.inMinutes % 60, 2);
  return '$sign$hh:$mm';
}

String _tzOffsetNoColon(Duration offset) {
  final sign = offset.isNegative ? '-' : '+';
  final abs = offset.abs();
  final hh = _pad(abs.inHours, 2);
  final mm = _pad(abs.inMinutes % 60, 2);
  return '$sign$hh$mm';
}

class _IsoWeekData {
  final int year;
  final int week;
  final int weekday; // 1..7 Mon..Sun
  const _IsoWeekData(this.year, this.week, this.weekday);
}

_IsoWeekData _isoWeekData(DateTime dt) {
  // Find the Thursday of this week
  int deltaToThursday(DateTime d) => 3 - ((d.weekday + 6) % 7);
  final thursday = DateTime(dt.year, dt.month, dt.day).add(Duration(days: deltaToThursday(dt)));
  final isoYear = thursday.year;
  // Thursday of week 1 (the week containing Jan 4th)
  final jan4 = DateTime(isoYear, 1, 4);
  final week1Thursday = jan4.add(Duration(days: deltaToThursday(jan4)));
  final week = 1 + ((thursday.difference(week1Thursday).inDays) ~/ 7);
  final weekday = dt.weekday; // 1..7
  return _IsoWeekData(isoYear, week, weekday);
}

const List<String> _weekdayShort = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
const List<String> _monthShort = [
  'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
];

const List<String> _weekdayShortFr = ['lun.', 'mar.', 'mer.', 'jeu.', 'ven.', 'sam.', 'dim.'];
const List<String> _monthShortFr = [
  'janv.', 'févr.', 'mars', 'avr.', 'mai', 'juin', 'juil.', 'août', 'sept.', 'oct.', 'nov.', 'déc.'
];

// Locale-aware interface and wrapper for localized formats
abstract class DateTimeLocale {
  String weekdayShort(int weekday); // 1..7
  String monthShort(int month);     // 1..12
}

class _EnDateTimeLocale implements DateTimeLocale {
  const _EnDateTimeLocale();
  @override
  String weekdayShort(int weekday) => _weekdayShort[weekday - 1];
  @override
  String monthShort(int month) => _monthShort[month - 1];
}

class _FrDateTimeLocale implements DateTimeLocale {
  const _FrDateTimeLocale();
  @override
  String weekdayShort(int weekday) => _weekdayShortFr[weekday - 1];
  @override
  String monthShort(int month) => _monthShortFr[month - 1];
}

DateTimeLocale dateTimeLocaleFor(String code) {
  final lc = code.toLowerCase();
  if (lc.startsWith('fr')) return const _FrDateTimeLocale();
  return const _EnDateTimeLocale();
}

class LocalizedDateTime {
  final DateTime dt;
  final DateTimeLocale locale;
  final String _code;
  const LocalizedDateTime(this.dt, this.locale, this._code);

  // Localized RFC 2822 using locale weekday/month (non-standard for FR)
  String toRFC2822() {
    final w = locale.weekdayShort(dt.weekday);
    final mon = locale.monthShort(dt.month);
    final off = dt.isUtc ? '+0000' : _tzOffsetNoColon(dt.timeZoneOffset);
    return '$w, ${_pad(dt.day, 2)} $mon ${_pad(dt.year, 4)} ${_pad(dt.hour, 2)}:${_pad(dt.minute, 2)}:${_pad(dt.second, 2)} $off';
  }

  // Localized HTTP-date (always GMT, localized weekday/month for display)
  String toHTTP() {
    final u = dt.toUtc();
    final w = locale.weekdayShort(u.weekday);
    final mon = locale.monthShort(u.month);
    return '$w, ${_pad(u.day, 2)} $mon ${_pad(u.year, 4)} ${_pad(u.hour, 2)}:${_pad(u.minute, 2)}:${_pad(u.second, 2)} GMT';
  }

  // ISO methods are language-agnostic; forward to base helpers
  String toISO() => dt.toISO();
  String toISODate() => dt.toISODate();
  String toISOTime() => dt.toISOTime();
  String toISOWeekDate() => dt.toISOWeekDate();

  int toMillis() => dt.toMillis();
  double toSeconds() => dt.toSeconds();
  int toUnixInteger() => dt.toUnixInteger();
  int valueOf() => dt.valueOf();

  // Locale-aware textual formats via toLocaleString presets/options
  String toLocaleString([Object? format]) => dt.toLocaleString(format, _code);
}

extension DateTimeLocalized on DateTime {
  LocalizedDateTime asLocale(String code) => LocalizedDateTime(this, dateTimeLocaleFor(code), code);
}
 
