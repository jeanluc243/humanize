/// Format a number with thousand separators in the integer part.
/// Keeps the fractional part as-is if present (e.g., 4500.2 -> 4,500.2).
String intcomma(num value, {String sep = ','}) {
  var s = value.toString();
  var sign = '';
  if (s.startsWith('-')) {
    sign = '-';
    s = s.substring(1);
  }
  String intPart;
  String fracPart = '';
  final dot = s.indexOf('.');
  if (dot >= 0) {
    intPart = s.substring(0, dot);
    fracPart = s.substring(dot + 1);
  } else {
    intPart = s;
  }
  final re = RegExp(r'(\d)(?=(\d{3})+(?!\d))');
  final grouped = intPart.replaceAllMapped(re, (m) => '${m[1]}$sep');
  final frac = fracPart.isNotEmpty ? '.$fracPart' : '';
  return '$sign$grouped$frac';
}
