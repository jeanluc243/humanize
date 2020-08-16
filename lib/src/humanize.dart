/// Convert an integer to its ordinal as a string. 1 is '1st', 2 is '2nd',
/// 3 is '3rd', etc. works for any integer.
String ordinal(int value) {
  assert(value != null, '[value] must not be null');

  int tempValue;
  dynamic templates;
  String finalValue;

  List valueSpecial = [11, 12, 13];

  if (valueSpecial.contains(value % 100)) {
    return "${value}th";
  } else if (value.toString().length == 1) {
    templates = [
      "0",
      "1st",
      "2nd",
      "3rd",
      "4th",
      "5th",
      "6th",
      "7th",
      "8th",
      "9th",
    ];
    finalValue = templates[value];
  } else {
    tempValue = value % 10;
    templates = {
      // Ordinal format when value ends with 0, e.g. 80th
      "$tempValue": "${value}th",
      // Ordinal format when value ends with 1, e.g. 81st, except 11.
      "$tempValue": "${value}st",
      // Ordinal format when value ends with 2, e.g. 82nd, except 12.
      "$tempValue": "${value}nd",
      // Ordinal format when value ends with 3, e.g. 83rd, except 13.
      "$tempValue": "${value}rd",
      // Ordinal format when value ends with 4, e.g. 84th.
      "$tempValue": "${value}th",
      // Ordinal format when value ends with 5, e.g. 85th.
      "$tempValue": "${value}th",
      // Ordinal format when value ends with 6, e.g. 86th.
      "$tempValue": "${value}th",
      // Ordinal format when value ends with 7, e.g. 87th.
      "$tempValue": "${value}th",
      // Ordinal format when value ends with 8, e.g. 88th.
      "$tempValue": "${value}th",
      // Ordinal format when value ends with 9, e.g. 89th.
      "$tempValue": "${value}th",
    };
    finalValue = templates["$tempValue"];
  }
  return finalValue;
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

/// adds "in" or "ago" to a natural duration phrase. eg: "in 5 days", "2 months ago".
// this will be more useful when attempting internationalisation
String _applyAdposition(String value, bool inPast) {
  var modifier = inPast ? "ago" : "in";
  var isSuffix = inPast ? true : false;
  if (isSuffix)
    return value + " " + modifier;
  else
    return modifier + " " + value;
}

/// Present date values as a string in natural duration units like weeks,
/// months, and years relative to the current date.
///
/// Args:
///   `applyAdposition` (bool) Add "in" and "ago" to outputs. Default: true.
///   `applyAppNumber` (bool) Convert numbers to AP style. Default: false.
///
/// Returns:
///   * By default, a date 14 days in the past would return "2 weeks ago".
///   * By default, a date 40 days in the future would return "in 6 weeks".
///   * By default, a date 700 days in the past would return "2 years ago".
///
/// NOTE: Supports only English duration and unit names currently.
String naturalDuration(DateTime value,
    {bool applyAdposition = true, bool applyAppNumber = false}) {
  var duration = DateTime.now().difference(value);
  var inPast = duration.inMilliseconds < 0;
  var days = duration.inDays.abs();

  // TODO: use naturalTime and naturalDay here
  if (days < 1) return inPast ? "earlier today" : "today";
  if (days < 2) return inPast ? "yesterday" : "tomorrow";

  var weeks = (days / 7).round();
  var months = (days / 30).round();
  var years = (days / 365).round();
  var phrase;

  // up to 10 days, but not 1 week exactly
  if (days < 11 && days != 7) {
    phrase = "${applyAppNumber ? appNumber(days) : days} days";
  }
  // one week
  else if (weeks == 1) {
    phrase = "${applyAppNumber ? appNumber(weeks) : weeks} week";
  }
  // up to 8 weeks but not 4 weeks exactly
  else if (weeks < 8 && weeks != 4) {
    phrase = "${applyAppNumber ? appNumber(weeks) : weeks} weeks";
  }
  // 1 month
  else if (weeks == 4) {
    phrase = "${applyAppNumber ? appNumber(months) : months} month";
  }
  // multiple months
  else if (years < 1) {
    phrase = "${applyAppNumber ? appNumber(months) : months} months";
  }
  // 1 year
  else if (years == 1) {
    phrase = "${applyAppNumber ? appNumber(years) : years} year";
  }
  // multiple years
  else if (years > 1) {
    phrase = "${applyAppNumber ? appNumber(years) : years} years";
  }

  // TODO: throw an exception if phrase is still null?

  // add "in" or "ago" if applicable, then return
  return applyAdposition ? _applyAdposition(phrase, inPast) : phrase;
}
