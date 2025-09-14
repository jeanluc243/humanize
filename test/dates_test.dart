import 'package:test/test.dart';
import 'package:humanize/src/dates/naturaldelta.dart';
import 'package:humanize/src/dates/naturaltime.dart';

void main() {
  test('naturaldelta hours/minutes', () {
    expect(naturaldelta(Duration(hours: 2)), '2 hours');
    expect(naturaldelta(Duration(minutes: 1)), '1 minute');
  });

  test('naturaltime past and future', () {
    final now = DateTime(2025, 1, 1, 12, 0, 0);
    expect(naturaltime(now.subtract(Duration(minutes: 3)), now: now), '3 minutes ago');
    expect(naturaltime(now.add(Duration(hours: 2)), now: now), 'in 2 hours');
  });
}
