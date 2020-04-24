import 'package:humanize/humanize.dart' as humanize;

void main() {
  print(humanize.appNumber(1)); // one
  print(humanize.appNumber(9)); // six
  print(humanize.intComma(100));
  print(humanize.intComma(80010000));
  print(humanize.ordinal(2)); // 2nd
  print(humanize.ordinal(1));
  print(humanize.ordinal(24)); // 24th
}