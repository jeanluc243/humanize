library humanize_i18n;

import 'humanize.dart' as hz;

/// Thin, locale-aware facade over humanize helpers.
class HumanizeI18n {
  final String locale;
  const HumanizeI18n([this.locale = 'en']);

  // Dates
  String naturalTime(DateTime moment, {DateTime? now}) =>
      hz.naturaltime(moment, now: now, locale: locale);
  String naturalDelta(Duration delta) => hz.naturaldelta(delta, locale: locale);
  String naturalDay(DateTime day, {DateTime? now, String format = 'yyyy-MM-dd'}) =>
      hz.naturalday(day, now: now, locale: locale, format: format);

  // Lists
  String naturalJoin(List<String> items, {String delimiter = ', '}) =>
      hz.naturalJoin(items, locale: locale, delimiter: delimiter);
  String oxford(List<String> items) => hz.oxfordComma(items, locale: locale);

  // Numbers
  String apNumber(int n) => hz.apNumber(n, locale: locale);
  String intComma(num value, {String? sep}) {
    final defaultSep = locale.toLowerCase().startsWith('fr') ? ' ' : ',';
    return hz.intcomma(value, sep: sep ?? defaultSep);
  }
  String ordinal(int n) => hz.ordinal(n, locale: locale);
  String intWord(num n, {int precision = 1, bool short = false}) =>
      hz.intword(n, precision: precision, short: short, locale: locale);

  // Filesize
  String fileSize(num bytes, {int precision = 1}) =>
      hz.filesizeformat(bytes, precision: precision);

  // Text
  String capFirst(String s) => hz.capfirst(s);
  String titleCase(String s) => hz.titlecase(s);
  String truncateChars(String s, int max, {String ellipsis = '...'}) =>
      hz.truncatechars(s, max, ellipsis: ellipsis);
  String truncateWords(String s, int maxWords, {String ellipsis = '...'}) =>
      hz.truncatewords(s, maxWords, ellipsis: ellipsis);
}
