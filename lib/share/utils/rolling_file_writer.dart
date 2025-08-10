import 'dart:io';

import 'package:inter_hospital_app/share/constants/file.dart';

class RollingFileWriter {
  final List<File> files;
  final int maxSize;

  int _currentIndex = 0;

  RollingFileWriter({
    required this.files,
    this.maxSize = FileConstants.maxSizeFile,
  }) {
    if (files.isEmpty) {
      throw ArgumentError('File list cannot be empty');
    }
  }

  Future<void> write(String message) async {
    await _rotate();
    if (await _currentFile.length() >= maxSize) {
      await _deleteContent();
    }
    await _currentFile.writeAsString('$message\n', mode: FileMode.append);
  }

  File get _currentFile => files[_currentIndex];

  Future<void> _rotate() async {
    if (await _isFull()) {
      _currentIndex = (_currentIndex + 1) % files.length;
    }
  }

  Future<bool> _isFull() async {
    if (await _currentFile.exists()) {
      final size = await _currentFile.length();
      if (size >= maxSize) return true;
    }
    return false;
  }

  Future<void> _deleteContent() async {
    if (await _currentFile.exists()) {
      await _currentFile.writeAsString('', mode: FileMode.write);
    }
  }
}
