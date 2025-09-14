/// Human readable relative time, e.g. "3 minutes ago" or "in 2 hours".
String naturaltime(DateTime moment, {DateTime? now, String locale = 'en'}) {
  final base = now ?? DateTime.now();
  final delta = moment.difference(base);
  final abs = delta.abs();

  String phrase(String amount) {
    if (delta.isNegative) {
      return locale.startsWith('fr') ? 'il y a $amount' : '$amount ago';
    } else {
      return locale.startsWith('fr') ? 'dans $amount' : 'in $amount';
    }
  }

  if (abs.inDays >= 1) {
    final n = abs.inDays;
    final unit = locale.startsWith('fr') ? (n == 1 ? 'jour' : 'jours') : (n == 1 ? 'day' : 'days');
    return phrase('$n $unit');
  }
  if (abs.inHours >= 1) {
    final n = abs.inHours;
    final unit = locale.startsWith('fr') ? (n == 1 ? 'heure' : 'heures') : (n == 1 ? 'hour' : 'hours');
    return phrase('$n $unit');
  }
  if (abs.inMinutes >= 1) {
    final n = abs.inMinutes;
    final unit = locale.startsWith('fr') ? (n == 1 ? 'minute' : 'minutes') : (n == 1 ? 'minute' : 'minutes');
    return phrase('$n $unit');
  }
  final n = abs.inSeconds;
  final unit = locale.startsWith('fr') ? (n == 1 ? 'seconde' : 'secondes') : (n == 1 ? 'second' : 'seconds');
  return phrase('$n $unit');
}
