import 'package:humanize/humanize.dart';

void main() {
  // Calendar math vs time math
  final d = DateTime(2017, 2, 13);

  // Calendar math: add 1 month => March 13
  final cal = d.addCalendarMonths(1);
  print(cal.toISODate()); // '2017-03-13'

  // Time math: add 30 days => March 15 (Feb has 28 days in 2017)
  final time = d.add(Duration(days: 30));
  print(time.toISODate()); // '2017-03-15'

  // End-of-month clamping example: Jan 31 + 1 month => Feb 28 (2017)
  final jan31 = DateTime(2017, 1, 31);
  print(jan31.addCalendarMonths(1).toISODate()); // '2017-02-28'

  // Years: Feb 29, 2016 + 1 year => Feb 28, 2017
  final feb29 = DateTime(2016, 2, 29);
  print(feb29.addCalendarYears(1).toISODate()); // '2017-02-28'
}

