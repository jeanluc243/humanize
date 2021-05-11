import 'package:flutter_test/flutter_test.dart';

import 'package:humanize/humanize.dart' as humanize;

void main() {
  test('Humanize', () {
    expect(humanize.ordinal(2), "2nd");
    humanize.ordinal(1);
    
    // final calculator = Calculator();
    // expect(calculator.addOne(2), 3);
    // expect(calculator.addOne(-7), -6);
    // expect(calculator.addOne(0), 1);
    // expect(() => calculator.addOne(null), throwsNoSuchMethodError);
  });
}
