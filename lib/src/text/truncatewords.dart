/// Truncate to at most [maxWords] words, adding [ellipsis] if truncated.
String truncatewords(String s, int maxWords, {String ellipsis = '...'}) {
  if (maxWords <= 0) return '';
  final words = s.trim().split(RegExp(r'\s+'));
  if (words.length <= maxWords) return s.trim();
  return words.take(maxWords).join(' ') + ellipsis;
}
