import 'package:humanize/src/numbers/apnumber.dart';
import 'package:humanize/src/numbers/ordinal.dart';
import 'package:humanize/src/numbers/intcomma.dart';
import 'package:humanize/src/filesize/filesizeformat.dart';
import 'package:humanize/src/dates/naturaltime.dart';

void main() {
  print(apNumber(5)); // five
  print(ordinal(23)); // 23rd
  print(intcomma(1234567)); // 1,234,567
  print(filesizeformat(1536000)); // 1.5 MB
  print(naturaltime(DateTime.now().subtract(Duration(minutes: 3)))); // 3 minutes ago
}
