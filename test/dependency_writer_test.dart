import 'package:pub_semver/pub_semver.dart';
import 'package:pubspec_parse/pubspec_parse.dart';
import 'package:pubspec_writer_extensions/dependency_writer.dart';
import 'package:test/test.dart';

void main() {
  group('dependency_writer', () {
    group('git', () {
      test('only with url', () {
        final dep = GitDependency(Uri.parse('http://www.google.com'));

        expect(
          dep.toJson(),
          {
            'git': {'url': 'http://www.google.com'}
          },
        );
      });

      test('url and path', () {
        final dep = GitDependency(
          Uri.parse('http://www.google.com'),
          path: '/to/somewhere',
        );

        expect(
          dep.toJson(),
          {
            'git': {'url': 'http://www.google.com', 'path': '/to/somewhere'}
          },
        );
      });

      test('url and ref', () {
        final dep = GitDependency(
          Uri.parse('http://www.google.com'),
          ref: 'some_ref',
        );

        expect(
          dep.toJson(),
          {
            'git': {'url': 'http://www.google.com', 'ref': 'some_ref'}
          },
        );
      });
    });

    test('path', () {
      final dep = PathDependency('/to/somewhere');

      expect(
        dep.toJson(),
        {'path': '/to/somewhere'},
      );
    });

    group('hosted', () {
      test('without hosted config', () {
        final dep = HostedDependency(
          version: VersionConstraint.parse('^1.0.0'),
        );

        expect(dep.toJson(), '^1.0.0');
      });

      test('with hosted config that has name', () {
        final dep = HostedDependency(
          version: VersionConstraint.parse('^1.0.0'),
          hosted: HostedDetails(
            'some_package_name',
            Uri.parse('https://pub.some-domain.org'),
          ),
        );

        expect(dep.toJson(), {
          'version': '^1.0.0',
          'hosted': {
            'name': 'some_package_name',
            'url': 'https://pub.some-domain.org',
          },
        });
      });

      test('with hosted config without name', () {
        final dep = HostedDependency(
          version: VersionConstraint.parse('^1.0.0'),
          hosted: HostedDetails(
            null,
            Uri.parse('https://pub.some-domain.org'),
          ),
        );

        expect(dep.toJson(), {
          'version': '^1.0.0',
          'hosted': 'https://pub.some-domain.org',
        });
      });
    });
  });
}
