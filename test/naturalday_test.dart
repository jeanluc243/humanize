import 'package:test/test.dart';
import 'package:humanize/src/dates/naturalday.dart';

void main() {
  group('naturalday EN/FR', () {
    final ref = DateTime(2007, 2, 17, 12, 0, 0);

    test('labels around reference day (EN)', () {
      expect(naturalday(DateTime(2007, 2, 16), now: ref, locale: 'en'), 'yesterday');
      expect(naturalday(DateTime(2007, 2, 17), now: ref, locale: 'en'), 'today');
      expect(naturalday(DateTime(2007, 2, 18), now: ref, locale: 'en'), 'tomorrow');
    });

    test('labels around reference day (FR)', () {
      expect(naturalday(DateTime(2007, 2, 16), now: ref, locale: 'fr'), 'hier');
      expect(naturalday(DateTime(2007, 2, 17), now: ref, locale: 'fr'), "aujourd'hui");
      expect(naturalday(DateTime(2007, 2, 18), now: ref, locale: 'fr'), 'demain');
    });

    test('formatted other day (EN)', () {
      expect(
        naturalday(DateTime(2007, 3, 5), now: ref, locale: 'en', format: 'dd MMMM yyyy'),
        '05 March 2007',
      );
    });

    test('formatted other day (FR)', () {
      expect(
        naturalday(DateTime(2007, 3, 5), now: ref, locale: 'fr', format: 'dd MMMM yyyy'),
        '05 mars 2007',
      );
    });
  });
}

