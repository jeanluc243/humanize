import 'package:humanize/humanize.dart' as humanize;

void main() {
  print(humanize.appNumber(1)); // one
  print(humanize.appNumber(6)); // six
  print(humanize.ordinal(2)); // 2nd
  print(humanize.ordinal(24)); // 24th
}