/// Convert integer to ordinal string.
/// en: 1 -> 1st, 2 -> 2nd; fr: 1 -> 1er, others -> 2e, 3e ...
String ordinal(int n, {String locale = 'en'}) {
  if (locale.toLowerCase().startsWith('fr')) {
    if (n == 1) return '1er';
    return '${n}e';
  }
  final int mod100 = n % 100;
  if (mod100 >= 11 && mod100 <= 13) return '${n}th';
  switch (n % 10) {
    case 1:
      return '${n}st';
    case 2:
      return '${n}nd';
    case 3:
      return '${n}rd';
    default:
      return '${n}th';
  }
}
