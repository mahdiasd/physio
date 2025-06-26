import 'dart:io';

void main() async {
  final packagesDir = Directory('packages');

  if (!packagesDir.existsSync()) {
    print('❌ No "packages" directory found.');
    exit(1);
  }

  final packagePaths = <String>[];

  void findPackages(Directory dir) {
    for (var entity in dir.listSync(recursive: true, followLinks: false)) {
      if (entity is File && entity.path.endsWith('pubspec.yaml')) {
        final packageDir = entity.parent.path;
        packagePaths.add(packageDir);
      }
    }
  }

  findPackages(packagesDir);

  if (packagePaths.isEmpty) {
    print('❌ No Dart/Flutter packages with pubspec.yaml found inside /packages.');
    exit(1);
  }

  print('\n📦 Available Packages:\n');
  for (var i = 0; i < packagePaths.length; i++) {
    print('${i + 1}. ${packagePaths[i]}');
  }

  stdout.write('\n➡️  Enter the number of the package you want to build: ');
  final input = stdin.readLineSync(encoding: systemEncoding);
  final index = int.tryParse(input ?? '');

  if (index == null || index < 1 || index > packagePaths.length) {
    print('\n❌ Invalid selection. Exiting.');
    exit(1);
  }

  final selectedPackagePath = packagePaths[index - 1];

  print('\n✅ Running build_runner for: $selectedPackagePath\n');

  final process = await Process.start(
    'dart',
    ['run', 'build_runner', 'build', '--delete-conflicting-outputs'],
    workingDirectory: selectedPackagePath,
    runInShell: true,
  );

  await stdout.addStream(process.stdout);
  await stderr.addStream(process.stderr);

  final exitCode = await process.exitCode;
  if (exitCode == 0) {
    print('\n🎉 Build completed successfully for $selectedPackagePath.');
  } else {
    print('\n❌ Build failed for $selectedPackagePath.');
    exit(exitCode);
  }
}
