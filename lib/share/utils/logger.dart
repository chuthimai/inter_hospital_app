import 'dart:io';

import 'package:inter_hospital_app/share/constants/file.dart';
import 'package:inter_hospital_app/share/utils/rolling_file_writer.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

class AppLogger {
  static final AppLogger _instance = AppLogger._internal();
  late final Logger _logger;
  late final RollingFileWriter _writingFiles;

  AppLogger._internal() {
    _logger = Logger();
    createWritingFiles();
  }

  Future<void> createWritingFiles() async {
    final dir = await getApplicationDocumentsDirectory();
    final file1 = File('${dir.path}/app_log_1.txt');
    final file2 = File('${dir.path}/app_log_2.txt');
    final files = [file1, file2];
    _writingFiles =
        RollingFileWriter(files: files, maxSize: FileConstants.maxLogSize);
  }

  void debug(dynamic message) => logger.d(message);

  void info(dynamic message) => logger.i(message);

  void warn(dynamic message) => logger.w(message);

  void error(dynamic message) => logger.e(message);

  void writeFile(dynamic message) => _writingFiles.write(message.toString());

  Logger get logger => _instance._logger;
}
