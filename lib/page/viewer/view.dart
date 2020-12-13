import 'package:flutter/widgets.dart';
import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';
import 'package:print_to_pdf/global/components/template_page.dart';

class PdfViewerView extends StatelessWidget {
  final String fileName;
  final String path;

  const PdfViewerView({
    Key key,
    this.fileName,
    this.path,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TemplatePage(
      title: fileName,
      body: PDFViewerScaffold(path: path),
    );
  }
}
