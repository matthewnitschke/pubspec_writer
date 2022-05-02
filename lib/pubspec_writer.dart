import 'package:pubspec_parse/pubspec_parse.dart';
import 'package:pubspec_writer/dependency_writer.dart';
import 'package:pubspec_writer/screenshot_writer.dart';

extension PubspecWriter on Pubspec {
  Map<String, dynamic> toJson() => {
        'name': name,
        if (version != null) 'version': version,
        if (description != null) 'description': description,
        if (homepage != null) 'homepage': homepage,
        if (publishTo != null) 'publish_to': publishTo,
        if (repository != null) 'repository': repository.toString(),
        if (issueTracker != null) 'issue_tracker': issueTracker.toString(),
        if (screenshots != null)
          'screenshots': screenshots!.map((ss) => ss.toJson()),
        if (environment != null)
          'environment':
              environment!.map((key, vc) => MapEntry(key, vc.toString())),
        if (dependencies.isNotEmpty)
          'dependencies':
              dependencies.map((name, dep) => MapEntry(name, dep.toJson())),
        if (devDependencies.isNotEmpty)
          'dev_dependencies':
              devDependencies.map((name, dep) => MapEntry(name, dep.toJson())),
        if (dependencyOverrides.isNotEmpty)
          'dependency_overrides': dependencyOverrides
              .map((name, dep) => MapEntry(name, dep.toJson())),
        if (flutter != null) 'flutter': flutter,
      };
}
