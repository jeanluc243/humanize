import 'package:humanize/humanize.dart';

void main() {
  final hFr = HumanizeI18n('fr');
  final hEn = HumanizeI18n('en');

  // Dates
  print(hFr.naturalTime(DateTime.now().subtract(Duration(minutes: 5))));
  print(hEn.naturalDelta(Duration(hours: 1)));
  // naturalday (référence: 17/02/2007)
  final ref = DateTime(2007, 2, 17, 12);
  print(hFr.naturalDay(DateTime(2007, 2, 16),
      now: ref, format: 'dd MMMM yyyy')); // hier
  print(hFr.naturalDay(DateTime(2007, 2, 17),
      now: ref, format: 'dd MMMM yyyy')); // aujourd'hui
  print(hFr.naturalDay(DateTime(2007, 2, 18),
      now: ref, format: 'dd MMMM yyyy')); // demain
  print(hEn.naturalDay(DateTime(2007, 2, 18),
      now: ref, format: 'dd MMMM yyyy')); // demain
  print(hEn.naturalDay(DateTime(2007, 3, 5),
      now: ref, format: 'dd MMMM yyyy')); // 05 March 2007

  // Lists
  print(hFr.naturalJoin(['a', 'b', 'c']));
  print(hEn.oxford(['a', 'b', 'c']));

  // Numbers
  print(hFr.apNumber(5)); // cinq
  print(hEn.apNumber(5)); // five
  print(hFr.intComma(1234567)); // 1 234 567
  print(hEn.intComma(1234567)); // 1,234,567
  print(hFr.ordinal(5)); // 5e
  print(hEn.ordinal(4)); // 4th
  print(hEn.intWord(1500000, short: true)); // 1.5 M
  print(hEn.intWord(150000, short: true)); // 1.5 M

  // intword: EN vs FR
  print(hEn.intWord(1000000)); // 1.0 million
  print(hFr.intWord(1000000)); // 1,0 million
  print(hEn.intWord(1200000)); // 1.2 million
  print(hFr.intWord(1200000)); // 1,2 millions
  print(hEn.intWord(1200000000)); // 1.2 billion
  print(hFr.intWord(1200000000)); // 1,2 milliards
  print(hFr.intWord(-1200000000)); // -1,2 milliards

  // Filesize
  print(hEn.fileSize(1536));

  // Text
  print(hEn.capFirst('hello'));
  print(hEn.titleCase('hello world'));
  print(hFr.truncateWords('a b c d e', 3));
}
