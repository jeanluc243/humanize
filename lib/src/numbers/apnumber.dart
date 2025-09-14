/// AP style numbers: spell out 1-9, otherwise return digits.
/// Supports basic locales: 'en' (default) and 'fr'.
String apNumber(int n, {String locale = 'en'}) {
  final isFr = locale.toLowerCase().startsWith('fr');
  const wordsEn = {
    1: 'one',
    2: 'two',
    3: 'three',
    4: 'four',
    5: 'five',
    6: 'six',
    7: 'seven',
    8: 'eight',
    9: 'nine',
  };
  const wordsFr = {
    1: 'un',
    2: 'deux',
    3: 'trois',
    4: 'quatre',
    5: 'cinq',
    6: 'six',
    7: 'sept',
    8: 'huit',
    9: 'neuf',
  };
  final words = isFr ? wordsFr : wordsEn;
  return words[n] ?? n.toString();
}
