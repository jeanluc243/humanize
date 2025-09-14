import 'package:humanize/humanize.dart';

void main() {
  final today = DateTime(2000, 2, 17, 12, 0);
  // EN
  print(naturalday(DateTime(2007, 2, 16),
      now: today, locale: 'en', format: 'dd MMMM yyyy')); // yesterday
  print(naturalday(DateTime(2007, 2, 17),
      now: today, locale: 'en', format: 'dd MMMM yyyy')); // today
  print(naturalday(DateTime(2007, 2, 18),
      now: today, locale: 'en', format: 'dd MMMM yyyy')); // tomorrow
  print(naturalday(DateTime(2007, 3, 5),
      now: today, locale: 'en', format: 'dd MMMM yyyy')); // 05 March 2007

  // FR
  print(naturalday(DateTime(2007, 2, 16),
      now: today, locale: 'fr', format: 'dd MMMM yyyy')); // hier
  print(naturalday(DateTime(2007, 2, 17),
      now: today, locale: 'fr', format: 'dd MMMM yyyy')); // aujourd'hui
  print(naturalday(DateTime(2007, 2, 18),
      now: today, locale: 'fr', format: 'dd MMMM yyyy')); // demain
  print(naturalday(DateTime(2007, 3, 5),
      now: today, locale: 'fr', format: 'dd MMMM yyyy')); // 05 mars 2007
}
