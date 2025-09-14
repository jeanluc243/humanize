/// Describe a Duration in natural language, e.g. "3 days" or "2 hours".
String naturaldelta(Duration delta, {String locale = 'en'}) {
  final abs = delta.abs();
  final days = abs.inDays;
  final hours = abs.inHours % 24;
  final minutes = abs.inMinutes % 60;
  final seconds = abs.inSeconds % 60;

  String unit(num n, String en, String fr) {
    final name = locale.startsWith('fr') ? fr : en;
    final plural = n == 1 ? name : (locale.startsWith('fr') ? '${name}s' : '${name}s');
    return '$n $plural';
  }

  if (days > 0) return unit(days, 'day', 'jour');
  if (hours > 0) return unit(hours, 'hour', 'heure');
  if (minutes > 0) return unit(minutes, 'minute', 'minute');
  return unit(seconds, 'second', 'seconde');
}
