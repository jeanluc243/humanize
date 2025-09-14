import 'package:humanize/humanize.dart';

void main() {
  print(apNumber(5)); // five
  print(ordinal(23)); // 23rd
  print(intcomma(1234567)); // 1,234,567
  print(filesizeformat(1536000)); // 1.5 MB
  print(naturaltime(DateTime.now().subtract(Duration(minutes: 3)))); // 3 minutes ago
}
