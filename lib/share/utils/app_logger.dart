import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

import '../constants/file.dart';
import 'rolling_file_writer.dart';

class AppLogger {
  static final AppLogger _instance = AppLogger();
  late final Logger _logger;
  late final RollingFileWriter _writingFiles;

  AppLogger() {
    _logger = Logger(
      printer: SimplePrinter()
    );

    if (kDebugMode) {
      // Chỉ tạo file log khi debug
      createWritingFiles();
    }
  }

  Future<void> createWritingFiles() async {
    final dir = await getApplicationDocumentsDirectory();
    final file1 = File('${dir.path}/app_log_1.txt');
    final file2 = File('${dir.path}/app_log_2.txt');
    final files = [file1, file2];
    _writingFiles =
        RollingFileWriter(files: files, maxSize: FileConstants.maxLogSize);
  }

  void debug(dynamic message) {
    if (kDebugMode) _logger.d(message);
  }

  void info(dynamic message) {
    if (kDebugMode) _logger.i(message);
  }

  void warn(dynamic message) {
    if (kDebugMode) _logger.w(message);
  }

  void error(dynamic message) {
    if (kDebugMode) _logger.e(message);
  }

  void writeFile(dynamic message) {
    if (kDebugMode) _writingFiles.write(message.toString());
  }

  Logger get logger => _instance._logger;
}
