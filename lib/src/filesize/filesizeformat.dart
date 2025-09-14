/// Format bytes into human-readable units.
String filesizeformat(num bytes, {int precision = 1}) {
  if (bytes.isNaN) return 'NaN';
  if (bytes.isInfinite) return 'Infinity';
  final units = ['bytes', 'KB', 'MB', 'GB', 'TB', 'PB'];
  double value = bytes.toDouble();
  int i = 0;
  while (value >= 1024 && i < units.length - 1) {
    value /= 1024;
    i++;
  }
  String s = value.toStringAsFixed(precision);
  if (precision > 0) {
    s = s.replaceFirst(RegExp(r'\.0+$'), '');
  }
  return '$s ${units[i]}';
}
