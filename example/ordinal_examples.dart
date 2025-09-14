import 'package:humanize/humanize.dart';

void main() {
  // FR
  print(ordinal(1, locale: 'fr')); // 1er
  print(ordinal(2, locale: 'fr')); // 2e
  print(ordinal(3, locale: 'fr')); // 3e
  print(ordinal(100, locale: 'fr')); // 100e

  // EN
  print(ordinal(1)); // 1st
  print(ordinal(2)); // 2nd
  print(ordinal(3)); // 3rd
  print(ordinal(11)); // 11th
  print(ordinal(183)); // 183rd
}
