import 'package:humanize/humanize.dart';

void main() {
  // Exemples demandés
  print(intcomma(4500));      // 4,500
  print(intcomma(4500.2));    // 4,500.2
  print(intcomma(45000));     // 45,000
  print(intcomma(450000));    // 450,000
  print(intcomma(4500000));   // 4,500,000

  // Entiers style français (espace insécable conseillé; simple espace ici)
  print(intcomma(1234567, sep: ' ')); // 1 234 567

  // Via la façade i18n (entiers)
  final hFr = HumanizeI18n('fr');
  print(hFr.intComma(1234567)); // 1 234 567
}
