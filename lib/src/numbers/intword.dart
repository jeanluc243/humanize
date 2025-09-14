/// Human-friendly representation for large numbers.
/// - Long form (default): 1,200,000 -> '1.2 million' (EN) or '1,2 millions' (FR)
/// - Short form:         1,200      -> '1.2 k'
/// Keeps one decimal by default (precision), localizes decimal separator for FR.
String intword(num n,
    {int precision = 1, bool short = false, String locale = 'en'}) {
  final bool isFr = locale.toLowerCase().startsWith('fr');
  final num absN = n.abs();
  final String sign = n < 0 ? '-' : '';

  // Return as-is for small numbers
  if (absN < 1000) return '$n';

  // Short unit labels (common across locales)
  const unitsShort = ['k', 'M', 'B', 'T', 'P', 'E', 'Z', 'Y'];

  // Long unit labels EN (short scale) and FR (long scale) up to a reasonable range.
  const unitsLongEn = [
    'thousand',
    'million',
    'billion',
    'trillion',
    'quadrillion',
    'quintillion',
    'sextillion',
    'septillion',
    'octillion',
    'nonillion',
    'decillion',
    'undecillion',
    'duodecillion',
    'tredecillion',
    'quattuordecillion',
    'quindecillion',
    'sexdecillion',
    'septendecillion',
    'octodecillion',
    'novemdecillion',
    'vigintillion',
    'unvigintillion',
    'duovigintillion',
    'trevigintillion',
    'quattuorvigintillion',
    'quinvigintillion',
    'sexvigintillion',
    'septenvigintillion',
    'octovigintillion',
    'novemvigintillion',
    'trigintillion',
    'untrigintillion',
    'duotrigintillion', // 10^99
  ];
  const unitsLongFr = [
    'mille',
    'million',
    'milliard',
    'billion',
    'billiard',
    'trillion',
    'trilliard',
    'quadrillion',
    'quadrilliard',
    'quintillion',
    'quintilliard',
    'sextillion',
    'sextilliard',
    'septillion',
    'septilliard',
    'octillion',
    'octilliard',
    'nonillion',
    'nonilliard',
    'decillion',
    'decilliard',
    'undecillion',
    'undecilliard',
    'duodecillion',
    'duodecilliard',
    'tredecillion',
    'tredecilliard',
    'quattuordecillion',
    'quattuordecilliard',
    'quindecillion',
    'quindecilliard',
    'sexdecillion',
    'sexdecilliard',
    'septendecillion',
    'septendecilliard',
    'octodecillion',
    'octodecilliard',
    'novemdecillion',
    'novemdecilliard',
    'vigintillion',
    'vigintilliard',
    // ... extended as needed
  ];

  // Special handling for googol (10^100)
  if (absN >= 1e100) {
    final valueGoogol = absN / 1e100;
    var formatted = valueGoogol.toStringAsFixed(precision);
    if (isFr) formatted = formatted.replaceAll('.', ',');
    final unit = 'googol'; // same in FR/EN
    return '$sign$formatted $unit';
  }

  // Scale by thousands until under 1000 or end of units
  int unitIndex = -1;
  num value = absN;
  final int maxIndex = (isFr ? unitsLongFr.length : unitsLongEn.length) - 1;
  while (value >= 1000 && unitIndex < maxIndex) {
    value /= 1000;
    unitIndex++;
  }

  // Format number with fixed decimals; localize decimal separator for FR
  var formatted = value.toStringAsFixed(precision);
  if (isFr) formatted = formatted.replaceAll('.', ',');

  if (short) {
    final idx = unitIndex.clamp(0, unitsShort.length - 1);
    final suffix = unitsShort[idx];
    return '$sign$formatted $suffix';
  }

  // Long unit label
  String unit = (isFr ? unitsLongFr[unitIndex] : unitsLongEn[unitIndex]);
  if (isFr) {
    // Pluralize for FR when value != 1.0 (except 'mille' which is invariable)
    final isExactlyOne = formatted == '1' || formatted == '1,0' || formatted == '1,00';
    if (unit != 'mille' && !isExactlyOne) {
      unit = unit.endsWith('s') ? unit : unit + 's';
    }
  }
  // EN: keep as singular form ("1.5 million")

  return '$sign$formatted $unit';
}
