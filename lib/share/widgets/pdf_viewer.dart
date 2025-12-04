import 'dart:io';
import 'package:flutter/material.dart';
import 'package:inter_hospital_app/share/utils/app_logger.dart';
import 'package:open_filex/open_filex.dart';

class PdfViewer extends StatefulWidget {
  final String filePath;

  const PdfViewer(this.filePath, {super.key});

  @override
  State<PdfViewer> createState() => _PdfViewerState();
}

class _PdfViewerState extends State<PdfViewer> {
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _openPdf();
  }

  Future<void> _openPdf() async {
    try {
      final file = File(widget.filePath);

      if (await file.exists()) {
        setState(() => _loading = false);
        final result = await OpenFilex.open(file.path);
        AppLogger().info("PDF opened: ${result.message}");
      } else {
        throw Exception("File not found: ${widget.filePath}");
      }
    } catch (e) {
      AppLogger().error("Error opening PDF: $e");
      setState(() {
        _error = e.toString();
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_error != null) {
      return Center(
        child: Text(
          "Không thể mở file PDF:\n$_error",
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.red),
        ),
      );
    }

    // Khi đã mở file PDF, ta có thể hiển thị thông báo hoặc placeholder
    return const Center(
      child: Text(
        "PDF đã được mở bằng ứng dụng hệ thống.",
        style: TextStyle(fontSize: 16, color: Colors.grey),
      ),
    );
  }
}
