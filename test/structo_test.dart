import 'package:flutter_test/flutter_test.dart';

import '../bin/structo.dart';

void main() {
  test('adds one to input values', () {
    final _ = createStructure(
      'test_dir',
      ['folder1', 'folder2/file.txt'],
      ['file1.txt', 'subdir/file2.txt'],
    );
  });
}
