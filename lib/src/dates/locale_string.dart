import 'package:intl/intl.dart';

/// Preset formats inspired by Luxon.
class HumanDateFormat {
  const HumanDateFormat._(this._id);
  final String _id;

  static const DATE_SHORT = HumanDateFormat._('DATE_SHORT');
  static const DATE_MED = HumanDateFormat._('DATE_MED');
  static const DATE_FULL = HumanDateFormat._('DATE_FULL');
  static const TIME_SIMPLE = HumanDateFormat._('TIME_SIMPLE');
  static const TIME_WITH_SECONDS = HumanDateFormat._('TIME_WITH_SECONDS');
  static const DATETIME_FULL = HumanDateFormat._('DATETIME_FULL');
}

extension ToLocaleString on DateTime {
  /// Locale-aware formatting similar to Luxon's toLocaleString.
  /// - If [format] is a [HumanDateFormat] preset, uses a sensible DateFormat chain.
  /// - If [format] is a Map of options (month/day/year/hour/minute/second/weekday/timeZoneName),
  ///   builds a pattern accordingly.
  /// - If [format] is null, defaults to a short date (yMd).
  String toLocaleString([Object? format, String locale = 'en']) {
    if (format is HumanDateFormat) {
      switch (format._id) {
        case 'DATE_SHORT':
          return DateFormat.yMd(locale).format(this);
        case 'DATE_MED':
          return DateFormat.yMMMd(locale).format(this);
        case 'DATE_FULL':
          return DateFormat.yMMMMEEEEd(locale).format(this);
        case 'TIME_SIMPLE':
          return DateFormat.jm(locale).format(this);
        case 'TIME_WITH_SECONDS':
          return DateFormat.jms(locale).format(this);
        case 'DATETIME_FULL':
          return DateFormat.yMMMMd(locale).add_jm().add_d().format(this);
      }
    }
    if (format is Map<String, String>) {
      final pattern = _buildIntlPattern(format, locale);
      return DateFormat(pattern, locale).format(this);
    }
    // default
    return DateFormat.yMd(locale).format(this);
  }
}

String _buildIntlPattern(Map<String, String> opts, String locale) {
  final b = StringBuffer();
  // Weekday
  final weekday = opts['weekday'];
  if (weekday != null) {
    if (weekday == 'long') {
      b.write('EEEE, ');
    } else if (weekday == 'short') {
      b.write('EEE, ');
    }
  }
  // Date parts
  final month = opts['month'];
  final day = opts['day'];
  final year = opts['year'];
  if (month != null) {
    switch (month) {
      case '2-digit':
        b.write('MM ');
        break;
      case 'numeric':
        b.write('M ');
        break;
      case 'short':
        b.write('MMM ');
        break;
      case 'long':
        b.write('MMMM ');
        break;
    }
  }
  if (day != null) {
    b.write(day == '2-digit' ? 'dd' : 'd');
    if (year != null) b.write(' ');
  }
  if (year != null) {
    b.write(year == '2-digit' ? 'yy' : 'y');
  }

  // Time parts
  final haveDate = b.isNotEmpty;
  final hour = opts['hour'];
  final minute = opts['minute'];
  final second = opts['second'];
  final timeZoneName = opts['timeZoneName'];
  if (hour != null || minute != null || second != null) {
    if (haveDate) b.write(' ');
    // Use locale-aware hour symbol "j" via intl skeleton
    // But since we're building a pattern, approximate:
    final hourPat = (hour == '2-digit') ? 'HH' : 'H';
    final minutePat = (minute == '2-digit') ? 'mm' : 'm';
    final secondPat = (second == '2-digit') ? 'ss' : 's';
    b.write(hourPat);
    if (minute != null) b.write(':$minutePat');
    if (second != null) b.write(':$secondPat');
  }

  if (timeZoneName != null) {
    b.write(' ');
    b.write(timeZoneName == 'long' ? 'zzzz' : 'z');
  }

  final pattern = b.toString().trim();
  return pattern.isEmpty ? DateFormat.yMd(locale).pattern! : pattern;
}
