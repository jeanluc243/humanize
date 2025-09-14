/// Minimal locale utilities for natural text.
class SimpleLocale {
  final String code;
  final String andWord;
  final String decimalSeparator;
  final String thousandSeparator;

  const SimpleLocale({
    required this.code,
    required this.andWord,
    this.decimalSeparator = '.',
    this.thousandSeparator = ',',
  });

  static const en = SimpleLocale(
    code: 'en',
    andWord: 'and',
    decimalSeparator: '.',
    thousandSeparator: ',',
  );

  static const fr = SimpleLocale(
    code: 'fr',
    andWord: 'et',
    decimalSeparator: ',',
    thousandSeparator: ' ',
  );
}
