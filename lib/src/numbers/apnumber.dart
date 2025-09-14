/// AP style numbers: spell out 1-9, otherwise return digits.
String apNumber(int n) {
  const words = {
    1: 'one',
    2: 'two',
    3: 'three',
    4: 'four',
    5: 'five',
    6: 'six',
    7: 'seven',
    8: 'eight',
    9: 'nine',
  };
  return words[n] ?? n.toString();
}
