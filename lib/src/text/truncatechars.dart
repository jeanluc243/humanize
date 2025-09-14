/// Truncate to at most [max] characters, adding [ellipsis] if truncated.
String truncatechars(String s, int max, {String ellipsis = '...'}) {
  if (max <= 0) return '';
  if (s.length <= max) return s;
  if (ellipsis.length >= max) return ellipsis.substring(0, max);
  return s.substring(0, max - ellipsis.length) + ellipsis;
}
