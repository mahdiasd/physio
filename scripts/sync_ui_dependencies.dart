import 'dart:io';
import 'package:yaml/yaml.dart';
import 'package:yaml_edit/yaml_edit.dart';

Future<void> main() async {
  final devDepsFile = File('scripts/ui_dependencies.yaml');
  if (!devDepsFile.existsSync()) {
    print('❌ ui_dependencies.yaml not found in scripts/!');
    exit(1);
  }

  final devDepsContent = await devDepsFile.readAsString();
  final devDepsYaml = loadYaml(devDepsContent) as YamlMap?;
  if (devDepsYaml == null || devDepsYaml['dependencies'] == null) {
    print('❌ ui_dependencies.yaml does not contain dependencies section!');
    exit(1);
  }

  final devDependencies = Map<String, dynamic>.from(
    devDepsYaml['dependencies'] as Map,
  );

  // Find all pubspec.yaml in ../packages/features/**
  final featuresDir = Directory('packages/features');
  if (!featuresDir.existsSync()) {
    print('❌ ../packages/features directory not found!');
    exit(1);
  }

  final directories = featuresDir
      .listSync(recursive: true)
      .whereType<Directory>()
      .where((dir) => File('${dir.path}/pubspec.yaml').existsSync());

  for (final dir in directories) {
    final pubspecPath = '${dir.path}/pubspec.yaml';
    final pubspecFile = File(pubspecPath);
    final content = await pubspecFile.readAsString();

    final editor = YamlEditor(content);

    try {
      // Overwrite the 'dependencies' section in each pubspec.yaml
      editor.update(['dependencies'], devDependencies);
    } catch (e) {
      print('❌ Failed to update dependencies in $pubspecPath: $e');
      continue;
    }

    String result = editor.toString();

    // Optional: tidy up formatting if needed (your original replaceAllMapped)
    result = result.replaceAllMapped(
        RegExp(r'(^|\n)(dependencies:)'),
            (match) => '${match.group(1)}\n${match.group(2)}'
    );

    await pubspecFile.writeAsString(result);
    print('✅ Synced dependencies in $pubspecPath');
  }

  print('🎉 All pubspec.yaml files are synced with scripts/ui_dependencies.yaml!');
}