import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:print_to_pdf/page/viewer/view.dart';

class PdfViewerPage extends HookWidget {
  final String fileName;
  final String path;

  PdfViewerPage({this.fileName, this.path});

  @override
  Widget build(BuildContext context) {
    return PdfViewerView(
      fileName: fileName,
      path: path,
    );
  }
}
