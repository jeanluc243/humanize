/// Human-friendly representation for large numbers.
/// Examples: 1200000 -> '1.2 million' or short '1.2 M'.
String intword(num n,
    {int precision = 1, bool short = false, String locale = 'en'}) {
  final num absN = n.abs();
  final signs = n < 0 ? '-' : '';
  const unitsLongEn = ['thousand', 'million', 'billion', 'trillion'];
  const unitsShortEn = ['k', 'M', 'B', 'T'];

  if (absN < 1000) {
    return '$n';
  }

  int unitIndex = -1;
  num value = absN;
  while (value >= 1000 && unitIndex < unitsLongEn.length - 1) {
    value /= 1000;
    unitIndex++;
  }

  String formatted = value.toStringAsFixed(precision);
// Trim trailing zeros and dot
  if (precision > 0) {
    formatted = formatted.replaceFirst(RegExp(r'0+$'), '');
    formatted = formatted.replaceFirst(RegExp(r'\.$'), '');
  }

  if (short) {
    final suffix = unitsShortEn[unitIndex];
    return '$signs$formatted $suffix';
  }

  final suffix = unitsLongEn[unitIndex];
  return '$signs$formatted $suffix';
}
