<p align="right">
<!-- <a href="https://flutter.dev/docs/development/packages-and-plugins/favorites"><img src="https://raw.githubusercontent.com/jeanluc243/humanize/stable/assets/favorite.png" width="100" alt="build"></a> -->
</p>


<p align="center">
<img src="https://raw.githubusercontent.com/jeanluc243/humanize/stable/assets/logo_humnanize.png" height="100" alt="Humanize" />

</p>

<p align="center">
  <a href="https://pub.dev/packages/humanize"><img src="https://img.shields.io/pub/v/humanize.svg" alt="pub.dev"></a>
  <!-- <a href="https://github.com/felangel/bloc/actions"><img src="https://github.com/jeanluc243/humanize/actions/workflows/main.yaml/badge.svg" alt="build"></a> -->
<!-- 
  <a href="https://github.com/jeanluc243/humanize/actions"><img src="https://github.com/jeanluc243/humanize/workflows/CI/badge.svg" alt="CI"></a> -->
<a href="https://github.com/jeanluc243/humanize"><img src="https://img.shields.io/github/stars/jeanluc243/humanize.svg?style=flat&logo=github&colorB=deeppink&label=stars" alt="Star on Github"></a>
<a href="https://github.com/Solido/awesome-flutter#standard"><img src="https://img.shields.io/badge/awesome-flutter-blue.svg?longCache=true" alt="Awesome Flutter"></a>
<a href="https://fluttersamples.com"><img 
src="https://img.shields.io/badge/flutter-samples-teal.svg?longCache=true" alt="Flutter Samples"></a>
<a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/license-MIT-purple.svg" alt="License: MIT"></a>

<!-- <a href="https://discord.gg/bloc"><img src="https://img.shields.io/discord/649708778631200778.svg?logo=discord&color=blue" alt="Discord"></a> -->

</p>

# Humanize 

## Humanize for Dart & Flutter 👋

Humanize is a compact toolkit that makes UI strings feel natural. It bridges raw data and human-friendly phrasing with helpers for dates, numbers, lists, and text in English and French.

## Table of Contents

- [Overview](#overview)
- [Feature Highlights](#feature-highlights)
- [Getting Started](#getting-started)
  - [Installation](#installation)
  - [Quick Start](#quick-start)
- [Usage Guide](#usage-guide)
  - [Dates & Times](#dates--times)
  - [Numbers](#numbers)
  - [Lists, Text & Filesize](#lists-text--filesize)
  - [Calendar Math](#calendar-math)
  - [i18n Facade](#i18n-facade)
- [Examples & Tests](#examples--tests)
- [Notes & Limitations](#notes--limitations)
- [Resources](#resources)
- [Keywords](#keywords)
- [Maintainers](#maintainers)
- [Support](#support)

## Overview

Humanize focuses on pragmatic, readable output for UI strings. It packages natural phrases (e.g., “3 minutes ago”, “tomorrow”) and formatting helpers under a consistent API with light-touch locale support.

## Feature Highlights

- Relative time and calendar-friendly deltas via `naturaltime`, `naturaldelta`, `naturalday`
- Flexible formatting for `DateTime` (ISO, RFC 2822, HTTP, timestamps, locale-aware)
- Humanized lists and text helpers: `naturalJoin`, `oxfordComma`, `capfirst`, `titlecase`, `truncate*`
- Number utilities with locale presets: `intcomma`, `intword`, `ordinal`, `apNumber`
- File size display with `filesizeformat`
- Calendar math helpers: `addCalendarMonths`, `addCalendarYears`
- Lightweight i18n facade through `HumanizeI18n`

## Getting Started

## Installation

```yaml
dependencies:
  humanize: latest_version
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

## Usage Guide

### Dates & Times

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

### Numbers

```dart
print(intcomma(4500));    // 4,500
print(intword(1500000, short: true)); // 1.5 M
print(ordinal(1, locale: 'fr')); // 1er
print(apNumber(5, locale: 'fr')); // cinq
```

### Lists, Text & Filesize

```dart
print(naturalJoin(['a','b','c'], locale: 'fr')); // a, b et c
print(oxfordComma(['a','b','c']));               // a, b, and c
print(capfirst('hello'));                        // Hello
print(filesizeformat(1536));                     // 1.5 KB
```

### Calendar Math

```dart
final d = DateTime(2017, 2, 13);
print(d.addCalendarMonths(1).toISODate());    // 2017-03-13
print(d.add(Duration(days: 30)).toISODate()); // 2017-03-15
```

### i18n Facade

```dart
final hFr = HumanizeI18n('fr');
print(hFr.naturalTime(DateTime.now().subtract(Duration(minutes: 3))));
print(hFr.intComma(1234567)); // 1 234 567
```

## Examples & Tests

Examples in `example/`: basic_usage.dart, i18n_facade.dart, intcomma_examples.dart, naturaltime_examples.dart, naturalday_examples.dart, ordinal_examples.dart, formatting_examples.dart, math_examples.dart

Run tests:

```bash
dart test
```

## Notes & Limitations

- Built-in locales: `en`, `fr`. PRs welcome to extend.
- For strict formatting (currencies, complex calendars), combine with `package:intl` and use Humanize for human-friendly phrasing.
- Localized RFC/HTTP outputs are intended for display only (not protocol-compliant).

## Resources

- License: see `LICENSE`
- Repo: https://github.com/jeanluc243/humanize
- Issues: https://github.com/jeanluc243/humanize/issues

## Keywords

- Dart string formatting
- Flutter localization helpers
- humanize dates and numbers
- Dart natural language utilities
- human-readable UI text toolkit

## Maintainers

- Jean-Luc Kabulu — [@jeanluc243](https://github.com/jeanluc243)

## Support

If Humanize makes your UI sparkle, feel free to fuel the magic with a donation—anything from a cheeky 🍺 to the legendary MacBook Pro upgrade 💻😂. Tap the link, pick your vibe, and let's keep shipping joy: [Buy Me a Coffee](https://www.buymeacoffee.com/jeanluc243).
