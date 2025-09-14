/// Natural join with configurable separators.
String naturalJoin(
  List<String> items, {
  String locale = 'en',
  String delimiter = ', ',
  String lastDelimiterEn = ' and ',
  String lastDelimiterFr = ' et ',
}) {
  if (items.isEmpty) return '';
  if (items.length == 1) return items.first;
  final lastDelim = locale.toLowerCase().startsWith('fr') ? lastDelimiterFr : lastDelimiterEn;
  return items.sublist(0, items.length - 1).join(delimiter) + lastDelim + items.last;
}
