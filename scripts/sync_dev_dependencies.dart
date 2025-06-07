import 'dart:io';
import 'package:yaml/yaml.dart';
import 'package:yaml_edit/yaml_edit.dart';

Future<void> main() async {
  // dev_dependencies.yaml is in the scripts/ folder (current directory)
  final devDepsFile = File('scripts/dev_dependencies.yaml');
  if (!devDepsFile.existsSync()) {
    print('❌ dev_dependencies.yaml not found in scripts/!');
    exit(1);
  }

  final devDepsContent = await devDepsFile.readAsString();
  final devDepsYaml = loadYaml(devDepsContent) as YamlMap?;
  if (devDepsYaml == null || devDepsYaml['dev_dependencies'] == null) {
    print('❌ dev_dependencies.yaml does not contain dev_dependencies section!');
    exit(1);
  }

  final devDependencies = Map<String, dynamic>.from(
    devDepsYaml['dev_dependencies'] as Map,
  );

  // Define the folders to search in (relative to scripts/)
  final searchFolders = [
    '../packages',
    '../core',
    '../data',
    '../domain',
  ];

  final pubspecFiles = <File>[];

  for (final folder in searchFolders) {
    final dir = Directory(folder);
    if (!dir.existsSync()) continue;

    dir.listSync(recursive: true)
        .whereType<File>()
        .where((file) => file.path.endsWith('pubspec.yaml'))
        .forEach(pubspecFiles.add);
  }

  for (final pubspecFile in pubspecFiles) {
    final content = await pubspecFile.readAsString();
    final editor = YamlEditor(content);

    try {
      editor.update(['dev_dependencies'], devDependencies);
    } catch (e) {
      print('❌ Failed to update dev_dependencies in ${pubspecFile.path}: $e');
      continue;
    }

    String result = editor.toString();

    result = result.replaceAllMapped(
        RegExp(r'(^|\n)(dev_dependencies:)'),
            (match) => '${match.group(1)}\n${match.group(2)}'
    );

    await pubspecFile.writeAsString(result);
    print('✅ Synced dev_dependencies in ${pubspecFile.path}');
  }

  print('🎉 All pubspec.yaml files are synced with scripts/dev_dependencies.yaml!');
}