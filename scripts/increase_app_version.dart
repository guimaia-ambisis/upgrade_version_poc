//ignore_for_file: avoid_print
import 'dart:io';

void main() {
  /// Reading the pubspec.yaml file
  final pubspecFile = File('pubspec.yaml');
  final pubspecContent = pubspecFile.readAsStringSync();

  /// Separating lines of the file
  final lines = pubspecContent.split('\n');

  /// Getting the version line
  final versionLine = lines.firstWhere((line) => line.startsWith('version:'));

  /// Getting the version number
  final version = versionLine.trim().substring(9);

  /// Getting the patch number
  final patch = int.parse(version.split('.').last.split('+').first);

  /// Getting the build number
  final buildNumber = int.parse(version.split("+").last);

  /// Setting the new version, increasing 1 in the patch and build numbers
  final newVersion = version.replaceAll(
      '.$patch+$buildNumber', '.${patch + 1}+${buildNumber + 1}');

  /// Replacing the old version with the new one in pubspec.yaml content
  final newPubspecContent = pubspecContent.replaceAll(version, newVersion);

  /// Updating the pubspec.yaml file
  pubspecFile.writeAsStringSync(newPubspecContent);

  print('Versão atualizada para $newVersion');
}
