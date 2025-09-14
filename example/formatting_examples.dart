import 'package:humanize/humanize.dart';

void main() {
  // Pick a local DateTime to show offsets
  final dt = DateTime(2017, 4, 20, 11, 32, 0);

  // ISO
  print(dt
      .toISO()); // e.g., '2017-04-20T11:32:00.000-04:00' (offset varies by system)
  print(dt.toISODate()); // '2017-04-20'
  print(dt
      .toISOWeekDate()); // e.g., '2017-W16-4' (week and weekday depend on date)
  print(dt.toISOTime()); // e.g., '11:32:00.000-04:00'

  // RFC 2822 and HTTP
  // EN
  print(dt.toRFC2822()); // e.g., 'Thu, 20 Apr 2017 11:32:00 -0400'
  print(dt.toHTTP()); // 'Thu, 20 Apr 2017 15:32:00 GMT' (UTC time)
  // FR via interface (localized display, non standard for protocol)
  print(dt.asLocale('fr').toRFC2822()); // 'jeu., 20 avr. 2017 11:32:00 -0400'
  print(dt.asLocale('fr').toHTTP()); // 'jeu., 20 avr. 2017 15:32:00 GMT'

  // Unix timestamps
  print(dt.toMillis()); // e.g., 1492696320000
  print(dt.toSeconds()); // e.g., 1492696320.0
  print(dt.toUnixInteger()); // e.g., 1492696320
  print(dt.valueOf()); // same as toMillis()

  // Internationalizable human-readable formats (EN and FR) using naturalday's formatter
  // Reference "today" so it doesn't collapse to today/yesterday/tomorrow
  final ref = DateTime(2007, 2, 17, 12, 0);
  final d = DateTime(2007, 3, 5);
  // EN
  print(naturalday(d,
      now: ref, locale: 'en', format: 'dd MMMM yyyy')); // 05 March 2007
  // FR
  print(naturalday(d,
      now: ref, locale: 'fr', format: 'dd MMMM yyyy')); // 05 mars 2007

  // toLocaleString presets/options (EN and FR)
  print(dt.toLocaleString()); // e.g., 4/20/2017
  print(dt.toLocaleString(
      HumanDateFormat.DATETIME_FULL)); // e.g., April 20, 2017 11:32 AM EDT
  print(dt.asLocale('fr').toLocaleString(
      HumanDateFormat.DATETIME_FULL)); // 20 avril 2017 11:32 UTC−4
  print(dt.toLocaleString({'month': 'long', 'day': 'numeric'})); // April 20
  print(
      dt.toLocaleString({'month': 'long', 'day': 'numeric'}, 'fr')); // 20 avril
}
