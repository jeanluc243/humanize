import 'package:humanize/humanize.dart';

void main() {
  // Dates
  print(naturaltime(DateTime.now().subtract(Duration(minutes: 3))));
  print(naturaldelta(Duration(hours: 2), locale: 'fr'));

  // Lists
  print(naturalJoin(['a', 'b', 'c'], locale: 'fr')); // a, b et c
  print(oxfordComma(['a', 'b', 'c'], locale: 'en')); // a, b, and c

  // Numbers
  print(intcomma(1234567));
  print(ordinal(1, locale: 'fr'));
  print(intword(1500000, short: true));

  // Filesize
  print(filesizeformat(1536));

  // Text
  print(capfirst('hello'));
  print(titlecase('hello world'));
  print(truncatechars('abcdef', 4));
}

