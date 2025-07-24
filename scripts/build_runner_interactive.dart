#!/usr/bin/env dart

import 'dart:convert';
import 'dart:io';

void main(List<String> args) async {
  print('🔍 Scanning for packages with build_runner...\n');

  final packages = await findPackagesWithBuildRunner();

  if (packages.isEmpty) {
    print('❌ No packages found with build_runner dependency.');
    exit(1);
  }

  print('📦 Found ${packages.length} package(s) with build_runner:\n');

  // Display packages with numbers
  for (int i = 0; i < packages.length; i++) {
    print('${i + 1}. ${packages[i].name} (${packages[i].path})');
  }

  print('\n📋 Options:');
  print('• Enter a single number (e.g., 1)');
  print('• Enter multiple numbers separated by commas (e.g., 1,3,5)');
  print('• Enter "all" to select all packages');
  print('• Enter "q" to quit\n');

  stdout.write('Your choice: ');
  final input = stdin.readLineSync()?.trim() ?? '';

  if (input.toLowerCase() == 'q') {
    print('👋 Goodbye!');
    exit(0);
  }

  List<Package> selectedPackages = [];

  if (input.toLowerCase() == 'all') {
    selectedPackages = packages;
  } else {
    try {
      final indices = input
          .split(',')
          .map((s) => int.parse(s.trim()) - 1)
          .where((i) => i >= 0 && i < packages.length)
          .toList();

      if (indices.isEmpty) {
        print('❌ Invalid selection. Please try again.');
        exit(1);
      }

      selectedPackages = indices.map((i) => packages[i]).toList();
    } catch (e) {
      print('❌ Invalid input format. Please try again.');
      exit(1);
    }
  }

  print('\n🚀 Running build_runner watch for selected packages...\n');

  final processes = <Process>[];

  try {
    for (final package in selectedPackages) {
      print('▶️  Starting build_runner for ${package.name}...');

      final process = await Process.start(
        'dart',
        ['run', 'build_runner', 'watch', '--delete-conflicting-outputs'],
        workingDirectory: package.path,
        mode: ProcessStartMode.normal,
      );

      processes.add(process);

      // Forward stdout and stderr with package prefix
      process.stdout
          .transform(utf8.decoder)
          .transform(const LineSplitter())
          .listen((line) {
        print('[${package.name}] $line');
      });

      process.stderr
          .transform(utf8.decoder)
          .transform(const LineSplitter())
          .listen((line) {
        print('[${package.name}] ERROR: $line');
      });

      // Small delay between starting processes
      await Future.delayed(const Duration(milliseconds: 500));
    }

    print('\n✅ All build_runner processes started!');
    print('📝 Output will be prefixed with package names.');
    print('🛑 Press Ctrl+C to stop all processes.\n');

    // Wait for all processes to complete (they won't in watch mode)
    await Future.wait(processes.map((p) => p.exitCode));

  } catch (e) {
    print('\n❌ Error occurred: $e');

    // Kill all started processes
    for (final process in processes) {
      process.kill();
    }

    exit(1);
  }
}

Future<List<Package>> findPackagesWithBuildRunner() async {
  final packages = <Package>[];
  final currentDir = Directory.current;

  await for (final entity in currentDir.list(recursive: true, followLinks: false)) {
    if (entity is File && entity.path.endsWith('pubspec.yaml')) {
      try {
        final content = await entity.readAsString();

        if (hasBuildRunner(content)) {
          final packageDir = entity.parent;
          final packageName = extractPackageName(content) ??
              packageDir.path.split(Platform.pathSeparator).last;

          packages.add(Package(
            name: packageName,
            path: packageDir.path,
          ));
        }
      } catch (e) {
        // Skip files that can't be read
        continue;
      }
    }
  }

  // Sort packages by name for consistent ordering
  packages.sort((a, b) => a.name.compareTo(b.name));

  return packages;
}

bool hasBuildRunner(String pubspecContent) {
  final lines = pubspecContent.split('\n');
  bool inDevDependencies = false;
  bool inDependencies = false;

  for (final line in lines) {
    final trimmed = line.trim();

    if (trimmed == 'dependencies:') {
      inDependencies = true;
      inDevDependencies = false;
      continue;
    }

    if (trimmed == 'dev_dependencies:') {
      inDevDependencies = true;
      inDependencies = false;
      continue;
    }

    // Reset flags when we encounter a new top-level section
    if (line.isNotEmpty && !line.startsWith(' ') && !line.startsWith('\t')) {
      if (!trimmed.endsWith(':')) {
        inDependencies = false;
        inDevDependencies = false;
      }
    }

    // Check for build_runner in dependencies or dev_dependencies
    if ((inDependencies || inDevDependencies) &&
        (trimmed.startsWith('build_runner:') || trimmed == 'build_runner:')) {
      return true;
    }
  }

  return false;
}

String? extractPackageName(String pubspecContent) {
  final lines = pubspecContent.split('\n');

  for (final line in lines) {
    final trimmed = line.trim();
    if (trimmed.startsWith('name:')) {
      final parts = trimmed.split(':');
      if (parts.length >= 2) {
        return parts[1].trim().replaceAll('"', '').replaceAll("'", '');
      }
    }
  }

  return null;
}

class Package {
  final String name;
  final String path;

  Package({required this.name, required this.path});

  @override
  String toString() => '$name ($path)';
}