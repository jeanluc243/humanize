import 'package:test/test.dart';
import 'package:humanize/src/filesize/filesizeformat.dart';

void main() {
  test('filesizeformat basic', () {
    expect(filesizeformat(0), '0 bytes');
    expect(filesizeformat(1024), '1 KB');
  });
}
