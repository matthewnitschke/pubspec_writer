# Pubspec Writer

Extension methods for the official [`pubspec_parse`](https://github.com/dart-lang/pubspec_parse) method's that facilitate writing the objects back to data formats.

## Usage

```dart
import 'package:pubspec_parse/pubspec_parse.dart';
import 'package:pubspec_writer/pubspec_writer.dart';

void main() {
    final pubspec = Pubspec.parse(someYaml);

    print(pubspec.toJson()); // outputs Map<String, dynamic>
}
```

this can be used in conjunction with [`yaml_writer`](https://github.com/gmpassos/yaml_writer) to write with yaml output:

```dart
import 'package:pubspec_parse/pubspec_parse.dart';
import 'package:pubspec_writer/pubspec_writer.dart';
import 'package:yaml_writer/yaml_writer.dart';

void main() {
    final pubspec = Pubspec.parse(someYaml);

    final yamlWriter = YAMLWriter();
    print(yamlWriter.write(pubspec.toJson()));
}
```