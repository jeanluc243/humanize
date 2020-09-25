/// Convert an integer to its ordinal as a string. 1 is '1st', 2 is '2nd',
/// 3 is '3rd', etc. works for any integer.
String ordinal(int value) {
  assert(value != null, '[value] must not be null');

  var specialValue = [11, 12, 13].contains(value % 100);
  if (specialValue) {
    return "${value}th";
  } else if (value.toString().length == 1) {
    switch (value) {
      case 0:
        return "0";
      case 1:
        return "${value}st";
      case 2:
        return "${value}nd";
      case 3:
        return "${value}rd";
      default:
        return "${value}th";
    }
  } else {
    switch (value % 10) {
      case 1:
        return "${value}st";
      case 2:
        return "${value}nd";
      case 3:
        return "${value}rd";
      default:
        return "${value}th";
    }
  }
}

/// Convert an integer to a string containing commas every three digits.
/// For example, 3000 becomes '3,000' and 45000 becomes '45,000'.
String intComma(int value) {
  // Convert int value to a String one
  String valueToString = '$value';

  // Use RegExp function witch used to match strings or parts of strings
  RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  Function mathFunc = (Match match) => '${match[1]},';

  // Store the result in a new String value

  String newValue = valueToString.replaceAllMapped(reg, mathFunc);

  return '$newValue';
}

/// Convert a large integer to a friendly text representation. Works best
/// for numbers over 1 million. For example, 1000000 becomes '1.0 million',
/// 1200000 becomes '1.2 million' and '1200000000' becomes '1.2 billion'.
String intWord(int value) {
  if (value < 1000000) {
    return "$value";
  }
  // TODO : Implement numbers Hight to 1M
}

/// For numbers 1-9, return the number spelled out. Otherwise, return the
/// number. This follows Associated Press style.
String appNumber(int value) {
  List values = [
    "one",
    "two",
    "three",
    "four",
    "five",
    "six",
    "seven",
    "eight",
    "nine"
  ];

  if (value < 0 || value > 10) {
    return "$value";
  } else {
    return values[value - 1];
  }
}

/// For date values that are tomorrow, today or yesterday compared to
/// present day return representing string. Otherwise, return a string
/// formatted according to settings.DATE_FORMAT.
String naturalDay(DateTime value) {
  return "";
}

/// For date and time values show how many seconds, minutes, or hours ago
/// compared to current timestamp return representing string.
String naturalTime(DateTime value) {
  return "";
}
