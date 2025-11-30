import 'dart:io';
import 'package:dio/dio.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

import 'app_logger.dart';

class PdfFileManager {
  static final Dio _dio = Dio();

  /// Tải file PDF từ URL và lưu vào thư mục ứng dụng
  static Future<String> downloadPdf(String url, String fileName) async {
    final dir = await getApplicationDocumentsDirectory();
    final filePath = '${dir.path}/$fileName.pdf';

    try {
      AppLogger().info("Downloading PDF from: $url");

      final response = await _dio.download(url, filePath);

      if (response.statusCode == 200) {
        AppLogger().info("PDF saved to: $filePath");
        return filePath;
      } else {
        throw Exception("Download failed with code ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error downloading PDF: $e");
    }
  }

  /// Mở file PDF bằng app hệ thống (Google PDF Viewer, Drive, v.v.)
  static Future<void> openPdf(String filePath) async {
    final file = File(filePath);

    if (await file.exists()) {
      AppLogger().info("Opening PDF: $filePath");
      final result = await OpenFilex.open(file.path);
      AppLogger().info("Open result: ${result.message}");
    } else {
      throw Exception("File not found: $filePath");
    }
  }

  /// Xoá file PDF cục bộ
  static Future<void> deletePdf(String filePath) async {
    final file = File(filePath);

    if (await file.exists()) {
      await file.delete();
      AppLogger().info("Deleted PDF: $filePath");
    } else {
      AppLogger().warn("File not found to delete: $filePath");
    }
  }

  /// Tiện ích: Tải và mở PDF trực tiếp
  static Future<void> downloadAndOpenPdf(String url, String fileName) async {
    final path = await downloadPdf(url, fileName);
    await openPdf(path);
  }
}
