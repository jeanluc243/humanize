import 'package:flutter_test/flutter_test.dart';

import 'package:humanize/humanize.dart' as humanize;

void main() {
  test('Humanize', () {
    expect(humanize.ordinal(1), "1st");
    expect(humanize.ordinal(2), "2nd");
    expect(humanize.ordinal(3), "3rd");
    expect(humanize.ordinal(4), "4th");
    expect(humanize.ordinal(10), "10th");
    expect(humanize.ordinal(11), "11th");
    expect(humanize.ordinal(12), "12th");
    expect(humanize.ordinal(13), "13th");
    expect(humanize.ordinal(14), "14th");
    expect(humanize.ordinal(20), "20th");
    expect(humanize.ordinal(21), "21st");
    expect(humanize.ordinal(22), "22nd");
    expect(humanize.ordinal(23), "23rd");
    expect(humanize.ordinal(24), "24th");

    // final calculator = Calculator();
    // expect(calculator.addOne(2), 3);
    // expect(calculator.addOne(-7), -6);
    // expect(calculator.addOne(0), 1);
    // expect(() => calculator.addOne(null), throwsNoSuchMethodError);
  });
}
