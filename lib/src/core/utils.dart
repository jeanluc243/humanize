/// Small helpers used across modules.
T clamp<T extends num>(T value, {required T min, required T max}) {
  if (min > max) throw ArgumentError('min must be <= max');
  if (value < min) return min;
  if (value > max) return max;
  return value;
}

String plural(num n, String singular, [String? pluralForm]) {
  return n == 1 ? singular : (pluralForm ?? '${singular}s');
}

String capitalize(String s) => s.isEmpty ? s : '${s[0].toUpperCase()}${s.substring(1)}';
