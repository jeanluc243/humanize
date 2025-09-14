import 'package:test/test.dart';
import 'package:humanize/src/numbers/intcomma.dart';
import 'package:humanize/src/numbers/ordinal.dart';
import 'package:humanize/src/numbers/apnumber.dart';
import 'package:humanize/src/numbers/intword.dart';

void main() {
  test('intcomma formats thousands', () {
    expect(intcomma(1234567), '1,234,567');
  });

  test('ordinal basic cases', () {
    expect(ordinal(1), '1st');
    expect(ordinal(2), '2nd');
    expect(ordinal(3), '3rd');
    expect(ordinal(11), '11th');
    expect(ordinal(12), '12th');
    expect(ordinal(13), '13th');
  });

  test('apNumber 1..10', () {
    expect(apNumber(1), 'one');
    expect(apNumber(9), 'nine');
    expect(apNumber(10), '10');
  });

  test('intword short and long', () {
    expect(intword(1200, short: true), '1.2 k');
    expect(intword(1500000, short: false), '1.5 million');
  });
}
