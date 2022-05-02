import 'package:pubspec_parse/pubspec_parse.dart';

extension ScreenshotWriter on Screenshot {
  Map<String, dynamic> toJson() => {
        'description': description,
        'path': path,
      };
}
