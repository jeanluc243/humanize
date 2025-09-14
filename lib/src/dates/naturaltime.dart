/// Human readable relative time, e.g. "3 minutes ago" or "in 2 hours".
/// For differences over a day, combines units (e.g., "1 week, 2 days").
String naturaltime(DateTime moment, {DateTime? now, String locale = 'en'}) {
  final base = now ?? DateTime.now();
  final delta = moment.difference(base);
  final abs = delta.abs();
  final isFr = locale.toLowerCase().startsWith('fr');

  String phrase(String amount) {
    if (abs.inSeconds == 0) {
      return isFr ? 'maintenant' : 'now';
    }
    if (delta.isNegative) {
      return isFr ? 'il y a $amount' : '$amount ago';
    } else {
      return isFr ? 'dans $amount' : 'in $amount';
    }
  }

  String enUnit(int n, String sing, String plur) => n == 1 ? '1 $sing' : '$n $plur';
  String frUnit(int n, String sing, String plur, {bool fem = false}) {
    if (n == 1) {
      return fem ? 'une $sing' : 'un $sing';
    }
    return '$n $plur';
  }

  // Combine for >= 1 day
  if (abs.inDays >= 1) {
    final days = abs.inDays;
    final weeks = days ~/ 7;
    final remDays = days % 7;
    if (weeks >= 1) {
      final part1 = isFr
          ? frUnit(weeks, 'semaine', 'semaines', fem: true)
          : enUnit(weeks, 'week', 'weeks');
      if (remDays > 0) {
        final part2 = isFr
            ? frUnit(remDays, 'jour', 'jours')
            : enUnit(remDays, 'day', 'days');
        return phrase('$part1, $part2');
      }
      return phrase(part1);
    }
    // < 7 days: days + hours
    final hours = abs.inHours % 24;
    final part1 = isFr ? frUnit(days, 'jour', 'jours') : enUnit(days, 'day', 'days');
    if (hours > 0) {
      final part2 = isFr ? frUnit(hours, 'heure', 'heures', fem: true) : enUnit(hours, 'hour', 'hours');
      return phrase('$part1, $part2');
    }
    return phrase(part1);
  }

  if (abs.inHours >= 1) {
    final n = abs.inHours;
    final text = isFr ? frUnit(n, 'heure', 'heures', fem: true) : enUnit(n, 'hour', 'hours');
    return phrase(text);
  }
  if (abs.inMinutes >= 1) {
    final n = abs.inMinutes;
    final text = isFr ? frUnit(n, 'minute', 'minutes', fem: true) : enUnit(n, 'minute', 'minutes');
    return phrase(text);
  }
  final n = abs.inSeconds;
  final text = isFr ? frUnit(n, 'seconde', 'secondes', fem: true) : enUnit(n, 'second', 'seconds');
  return phrase(text);
}
