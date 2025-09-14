import 'package:test/test.dart';
import 'package:humanize/src/text/capfirst.dart';
import 'package:humanize/src/text/titlecase.dart';
import 'package:humanize/src/text/truncatechars.dart';
import 'package:humanize/src/text/truncatewords.dart';

void main() {
  test('capfirst', () {
    expect(capfirst('hello'), 'Hello');
  });

  test('titlecase', () {
    expect(titlecase('hello world'), 'Hello World');
  });

  test('truncatechars', () {
    expect(truncatechars('abcdef', 4), 'a...');
  });

  test('truncatewords', () {
    expect(truncatewords('a b c d e', 3), 'a b c...');
  });
}
