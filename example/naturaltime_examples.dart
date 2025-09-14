import 'package:humanize/humanize.dart';

void main() {
  // Référence: maintenant = 17 février 2007 16:30:00
  final now = DateTime(2007, 2, 17, 16, 30, 0);

  // FR exemples proches de la spécification Django (version simplifiée)
  print(naturaltime(now.subtract(Duration(seconds: 29)), now: now, locale: 'fr')); // il y a 29 secondes
  print(naturaltime(now.subtract(Duration(minutes: 1)), now: now, locale: 'fr'));  // il y a 1 minute
  print(naturaltime(now.subtract(Duration(minutes: 4, seconds: 25)), now: now, locale: 'fr')); // il y a 4 minutes
  print(naturaltime(now.subtract(Duration(hours: 1)), now: now, locale: 'fr'));   // il y a 1 heure
  print(naturaltime(now.subtract(Duration(hours: 2)), now: now, locale: 'fr'));   // il y a 2 heures

  print(naturaltime(now.add(Duration(seconds: 30)), now: now, locale: 'fr'));     // dans 30 secondes
  print(naturaltime(now.add(Duration(minutes: 1)), now: now, locale: 'fr'));      // dans 1 minute
  print(naturaltime(now.add(Duration(minutes: 4, seconds: 35)), now: now, locale: 'fr')); // dans 4 minutes
  print(naturaltime(now.add(Duration(hours: 1)), now: now, locale: 'fr'));        // dans 1 heure
  print(naturaltime(now.add(Duration(hours: 2)), now: now, locale: 'fr'));        // dans 2 heures
  print(naturaltime(now.add(Duration(days: 1)), now: now, locale: 'fr'));         // dans 1 jour

  // EN equivalents
  print(naturaltime(now.subtract(Duration(minutes: 3)), now: now));               // 3 minutes ago
  print(naturaltime(now.add(Duration(hours: 2)), now: now));                      // in 2 hours
  // Combined examples
  print(naturaltime(now.subtract(Duration(days: 1, hours: 2)), now: now, locale: 'fr')); // il y a un jour, 2 heures
  print(naturaltime(now.add(Duration(days: 9)), now: now));                        // in 1 week, 2 days
}
