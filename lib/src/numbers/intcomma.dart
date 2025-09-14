/// Format an integer with thousand separators (e.g., 1,234,567).
String intcomma(num value, {String sep = ','}) {
  final s = value.toStringAsFixed(0);
  final re = RegExp(r'(\d)(?=(\d{3})+(?!\d))');
  return s.replaceAllMapped(re, (m) => '${m[1]}$sep');
}
