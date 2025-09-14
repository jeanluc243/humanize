import 'package:test/test.dart';
import 'package:humanize/src/dates/naturaltime.dart';

void main() {
  group('naturaltime combined units (EN/FR)', () {
    final now = DateTime(2007, 2, 17, 16, 30, 0);

    test('FR: past day + hours', () {
      expect(
        naturaltime(now.subtract(Duration(days: 1, hours: 2)), now: now, locale: 'fr'),
        'il y a un jour, 2 heures',
      );
    });

    test('EN: future days + hour', () {
      expect(
        naturaltime(now.add(Duration(days: 3, hours: 1)), now: now),
        'in 3 days, 1 hour',
      );
    });

    test('EN: past weeks + days', () {
      expect(
        naturaltime(now.subtract(Duration(days: 9)), now: now),
        '1 week, 2 days ago',
      );
    });

    test('FR: future weeks + days', () {
      expect(
        naturaltime(now.add(Duration(days: 8)), now: now, locale: 'fr'),
        'dans une semaine, 1 jour',
      );
    });
  });
}

