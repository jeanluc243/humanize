import 'package:test/test.dart';
import 'package:humanize/src/lists/oxford_comma.dart';
import 'package:humanize/src/lists/naturaljoin.dart';

void main() {
  test('oxfordComma en vs fr', () {
    expect(oxfordComma(['a', 'b', 'c'], locale: 'en'), 'a, b, and c');
    expect(oxfordComma(['a', 'b', 'c'], locale: 'fr'), 'a, b et c');
  });

  test('naturalJoin', () {
    expect(naturalJoin(['a', 'b', 'c']), 'a, b and c');
  });
}
