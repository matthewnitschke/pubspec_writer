import 'package:pubspec_parse/pubspec_parse.dart';

extension DependencyWriter on Dependency {
  dynamic toJson() {
    final dep = this;

    if (dep is GitDependency) return dep.toJson();
    if (dep is PathDependency) return dep.toJson();
    if (dep is HostedDependency) return dep.toJson();
  }
}

extension GitDependencyWriter on GitDependency {
  Map<String, dynamic> toJson() => {
        'git': {
          'url': url.toString(),
          if (path != null) 'path': path,
          if (ref != null) 'ref': ref,
        }
      };
}

extension PathDependencyWriter on PathDependency {
  Map<String, dynamic> toJson() => {'path': path};
}

extension HostedDependencyWriter on HostedDependency {
  dynamic toJson() {
    if (hosted == null) {
      return version.toString();
    }

    return {
      'hosted': hosted!.toJson(),
      'version': version.toString(),
    };
  }
}

extension HostedDetailsWriter on HostedDetails {
  dynamic toJson() {
    if (declaredName == null) {
      return url.toString();
    }

    return {
      'name': declaredName,
      if (url != null) 'url': url.toString(),
    };
  }
}
