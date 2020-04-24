# humanize

A package for translating numbers and dates into a human readable format.

[![Pub](https://img.shields.io/pub/v/humanize.svg?style=flat-square)](https://pub.dartlang.org/packages/humanize)



## Usage

```dart

import 'package:humanize/humanize.dart' as humanize;

main(){
    print(humanize.appNumber(1)); // one
    print(humanize.ordinal(3)); // 3rd
}
```

## Function

#### appNumber

For numbers 1-9, return the number spelled out. Otherwise, return the number.
```dart

import 'package:humanize/humanize.dart' as humanize;

main(){
    print(humanize.appNumber(1)); // one
    print(humanize.appNumber(5)); // five
    print(humanize.appNumber(15)); // '15'
}
```

#### ordinal
Convert an integer to its ordinal as a string. 1 is '1st', 2 is '2nd',
3 is '3rd', etc. works for any integer.


```dart

import 'package:humanize/humanize.dart' as humanize;

main(){
    print(humanize.ordinal(80)); // 80th
    print(humanize.ordinal(81)); // 81st /// except 11.
    print(humanize.ordinal(82)); // 82nd /// except 12.
    print(humanize.ordinal(83)); // 81rd /// except 13.
    print(humanize.ordinal(84)); // 84th    
}
```

### intComma
Convert an integer to a string containing commas every three digits.
For example, 3000 becomes '3,000' and 45000 becomes '45,000'.


```dart

import 'package:humanize/humanize.dart' as humanize;

main(){
    print(humanize.intComma(80010000)); //80,010,000
}

```

## TODO

### intWord
Convert a large integer to a friendly text representation. Works best
for numbers over 1 million. For example, 1000000 becomes '1.0 million',
1200000 becomes '1.2 million' and '1200000000' becomes '1.2 billion'.

### naturalDay
For date values that are tomorrow, today or yesterday compared to
present day return representing string. Otherwise, return a string
formatted according to DATE_FORMAT.

### naturalTime
For date and time values show how many seconds, minutes, or hours ago
compared to current timestamp return representing string.

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/jeanluc243/humanize/issues


# V2.0 (dev Branch)

# Adding differents Languages