<p align="center">
  <a href="https://pub.dev/packages/humanize"><img src="https://img.shields.io/pub/v/humanize.svg" alt="pub.dev"></a>
  <a href="https://github.com/jeanluc243/humanize/actions"><img src="https://github.com/jeanluc243/humanize/workflows/CI/badge.svg" alt="CI"></a>
</p>

# Humanize (Dart)

Tiny, fast helpers to turn numbers, dates, lists, and text into human-friendly strings — inspired by Django Humanize and Luxon — with simple locale support (en/fr) and a compact API.

## Table of Contents

- Overview
- Features
- Installation
- Quick Start
- Dates & Times
- Numbers
- Lists, Text, Filesize
- Calendar Math
- i18n Facade
- Examples, Tests
- Notes
- License & Links

## Overview

Humanize focuses on pragmatic, readable output for UI strings. It includes “natural” phrases (e.g., “3 minutes ago”, “tomorrow”) and formatting helpers, plus a neat i18n facade.

## Features

- Relative time: `naturaltime`, `naturaldelta`
- Natural day: `naturalday`
- DateTime formats: ISO, RFC 2822, HTTP, timestamps
- Locale formats: `toLocaleString(...)` (presets + Intl-like options)
- Lists: `naturalJoin`, `oxfordComma`
- Numbers: `intcomma`, `intword` (en/fr), `ordinal`, `apNumber`
- Filesize: `filesizeformat`
- Text: `capfirst`, `titlecase`, `truncate*`
- Calendar math: `addCalendarMonths`, `addCalendarYears`
- i18n facade: `HumanizeI18n`

## Installation

```yaml
dependencies:
  humanize: ^0.5.0
```

```dart
import 'package:humanize/humanize.dart';
```

## Quick Start

```dart
print(naturaltime(DateTime.now().subtract(Duration(minutes: 3)), locale: 'en')); // 3 minutes ago
print(naturaldelta(Duration(hours: 2), locale: 'fr'));                            // 2 heures

final ref = DateTime(2007, 2, 17, 12);
print(naturalday(DateTime(2007, 2, 16), now: ref, locale: 'en', format: 'dd MMMM yyyy')); // yesterday

print(naturalJoin(['a','b','c'], locale: 'fr')); // a, b et c
print(oxfordComma(['a','b','c'], locale: 'en')); // a, b, and c

print(intcomma(4500.2));            // 4,500.2
print(intcomma(1234567, sep: ' ')); // 1 234 567
print(intword(1200000, locale: 'fr')); // 1,2 millions
print(filesizeformat(1536));        // 1.5 KB
```

## Dates & Times

```dart
final now = DateTime(2007, 2, 17, 16, 30, 0);
print(naturaltime(now.add(Duration(days: 9)), now: now)); // in 1 week, 2 days
print(naturaltime(now.subtract(Duration(days: 1, hours: 2)), now: now, locale: 'fr')); // il y a un jour, 2 heures

final dt = DateTime(2017,4,20,11,32);
print(dt.toISO());      // 2017-04-20T11:32:00.000-04:00
print(dt.toRFC2822());  // Thu, 20 Apr 2017 11:32:00 -0400
print(dt.toHTTP());     // Thu, 20 Apr 2017 15:32:00 GMT
print(dt.asLocale('fr').toHTTP()); // jeu., 20 avr. 2017 15:32:00 GMT (display)

// Locale formats
print(dt.toLocaleString());                                 // e.g., 4/20/2017
print(dt.toLocaleString(HumanDateFormat.DATETIME_FULL));    // April 20, 2017...
print(dt.asLocale('fr').toLocaleString(HumanDateFormat.DATETIME_FULL)); // 20 avril 2017...
```

## Numbers

```dart
print(intcomma(4500));    // 4,500
print(intword(1500000, short: true)); // 1.5 M
print(ordinal(1, locale: 'fr')); // 1er
print(apNumber(5, locale: 'fr')); // cinq
```

## Lists, Text, Filesize

```dart
print(naturalJoin(['a','b','c'], locale: 'fr')); // a, b et c
print(oxfordComma(['a','b','c']));               // a, b, and c
print(capfirst('hello'));                        // Hello
print(filesizeformat(1536));                     // 1.5 KB
```

## Calendar Math

```dart
final d = DateTime(2017, 2, 13);
print(d.addCalendarMonths(1).toISODate());    // 2017-03-13
print(d.add(Duration(days: 30)).toISODate()); // 2017-03-15
```

## i18n Facade

```dart
final hFr = HumanizeI18n('fr');
print(hFr.naturalTime(DateTime.now().subtract(Duration(minutes: 3))));
print(hFr.intComma(1234567)); // 1 234 567
```

## Examples, Tests

Examples in `example/`: basic_usage.dart, i18n_facade.dart, intcomma_examples.dart, naturaltime_examples.dart, naturalday_examples.dart, ordinal_examples.dart, formatting_examples.dart, math_examples.dart

Run tests:

```bash
dart test
```

## Notes

- Built-in locales: `en`, `fr`. PRs welcome to extend.
- For strict formatting (currencies, complex calendars), combine with `package:intl` and use Humanize for human-friendly phrasing.
- Localized RFC/HTTP outputs are intended for display only (not protocol-compliant).

## License & Links

- License: see `LICENSE`
- Repo: https://github.com/jeanluc243/humanize
- Issues: https://github.com/jeanluc243/humanize/issues

