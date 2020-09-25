import 'package:flutter_test/flutter_test.dart';

import 'package:humanize/humanize.dart' as humanize;

void main() {
  test('Humanize ordinal', () {
    expect(humanize.ordinal(1), "1st");
    expect(humanize.ordinal(2), "2nd");
    expect(humanize.ordinal(3), "3rd");

    expect(humanize.ordinal(10), "10th");
    expect(humanize.ordinal(11), "11th");
    expect(humanize.ordinal(13), "13th");

    expect(humanize.ordinal(22), "22nd");
    expect(humanize.ordinal(33), "33rd");
    
    // final calculator = Calculator();
    // expect(calculator.addOne(2), 3);
    // expect(calculator.addOne(-7), -6);
    // expect(calculator.addOne(0), 1);
    // expect(() => calculator.addOne(null), throwsNoSuchMethodError);
  });
}
