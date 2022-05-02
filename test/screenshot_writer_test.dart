import 'package:pubspec_parse/pubspec_parse.dart';
import 'package:pubspec_writer_extensions/screenshot_writer.dart';
import 'package:test/test.dart';

void main() {
  test('screenshot_writer', () {
    final screenshot = Screenshot('some description', '../to/somewhere');

    expect(
      screenshot.toJson(),
      {
        'description': 'some description',
        'path': '../to/somewhere',
      },
    );
  });
}
