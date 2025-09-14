/// Join items using an Oxford comma in English, and no serial comma in French.
String oxfordComma(List<String> items, {String locale = 'en'}) {
  if (items.isEmpty) return '';
  if (items.length == 1) return items.first;
  final conj = locale.toLowerCase().startsWith('fr') ? 'et' : 'and';
  final serialComma = !locale.toLowerCase().startsWith('fr');
  if (items.length == 2) return '${items[0]} $conj ${items[1]}';
  final leading = items.sublist(0, items.length - 1).join(', ');
  final comma = serialComma ? ',' : '';
  return '$leading$comma $conj ${items.last}';
}
