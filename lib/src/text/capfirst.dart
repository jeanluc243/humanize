/// Capitalize the first letter of the string.
String capfirst(String s) => s.isEmpty ? s : s[0].toUpperCase() + s.substring(1);
