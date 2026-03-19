// ignore_for_file: avoid_print
import 'dart:io';

void main() async {
  print('Starting build_runner...');
  final result = await Process.run(
    'dart',
    ['run', 'build_runner', 'build', '--delete-conflicting-outputs'],
    runInShell: true,
  );
  
  print('STDOUT:');
  print(result.stdout);
  print('STDERR:');
  print(result.stderr);
  print('Exit code: ${result.exitCode}');
  
  if (result.exitCode == 0) {
    print('Starting tests...');
    final testResult = await Process.run(
      'flutter',
      ['test', 'test/auth_provider_test.dart', 'test/claims_provider_test.dart'],
      runInShell: true,
    );
    print('Test STDOUT:');
    print(testResult.stdout);
    print('Test STDERR:');
    print(testResult.stderr);
  }
}
