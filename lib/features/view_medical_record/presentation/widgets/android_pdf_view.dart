import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AndroidPdfView extends StatelessWidget {
  final String filePath;
  const AndroidPdfView({super.key, required this.filePath});

  @override
  Widget build(BuildContext context) {
    return AndroidView(
      viewType: 'native-pdf-view',
      creationParams: {'filePath': filePath},
      creationParamsCodec: const StandardMessageCodec(),
    );
  }
}
