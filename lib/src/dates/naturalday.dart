/// Natural day labeling: today, tomorrow, yesterday; otherwise formatted date.
/// Supports locales 'en' and 'fr'. Basic formatting tokens: yyyy, MM, dd, MMM, MMMM.
String naturalday(DateTime date,
    {DateTime? now, String locale = 'en', String format = 'yyyy-MM-dd'}) {
  final base = now ?? DateTime.now();
  final d0 = DateTime(base.year, base.month, base.day);
  final d1 = DateTime(date.year, date.month, date.day);
  final diffDays = d1.difference(d0).inDays;

  final isFr = locale.toLowerCase().startsWith('fr');
  if (diffDays == 0) return isFr ? "aujourd'hui" : 'today';
  if (diffDays == 1) return isFr ? 'demain' : 'tomorrow';
  if (diffDays == -1) return isFr ? 'hier' : 'yesterday';

  return _formatDate(d1, format, locale);
}

String _formatDate(DateTime dt, String pattern, String locale) {
  final isFr = locale.toLowerCase().startsWith('fr');
  const monthsEn = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  const monthsFr = [
    'janvier',
    'février',
    'mars',
    'avril',
    'mai',
    'juin',
    'juillet',
    'août',
    'septembre',
    'octobre',
    'novembre',
    'décembre',
  ];
  final months = isFr ? monthsFr : monthsEn;

  String two(int v) => v < 10 ? '0$v' : '$v';
  final replacements = <String, String>{
    'yyyy': dt.year.toString().padLeft(4, '0'),
    'MMMM': months[dt.month - 1],
    'MMM': months[dt.month - 1].substring(0, isFr ? 3 : 3),
    'MM': two(dt.month),
    'dd': two(dt.day),
  };

  // Replace longer tokens first to avoid partial overlaps
  var out = pattern;
  for (final token in ['yyyy', 'MMMM', 'MMM', 'MM', 'dd']) {
    out = out.replaceAll(token, replacements[token]!);
  }
  return out;
}

