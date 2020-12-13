import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';

class PdfViewerView extends StatelessWidget {
  final String fileName;
  final String path;
  final VoidCallback onTapShare;

  const PdfViewerView({
    Key key,
    this.fileName,
    this.path,
    this.onTapShare,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
        appBar: AppBar(
          title: Text(fileName),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.share),
              onPressed: onTapShare,
            ),
          ],
        ),
        path: path);
  }
}
