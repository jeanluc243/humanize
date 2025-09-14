/// Convert a string to Title Case (basic implementation).
String titlecase(String s) => s
    .split(RegExp(r'\s+'))
    .where((w) => w.isNotEmpty)
    .map((w) => w[0].toUpperCase() + (w.length > 1 ? w.substring(1).toLowerCase() : ''))
    .join(' ');
