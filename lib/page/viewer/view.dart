import 'package:flutter/widgets.dart';
import 'package:print_to_pdf/global/components/template_page.dart';

class PdfViewerView extends StatelessWidget {
  final VoidCallback onBack;

  const PdfViewerView({
    Key key,
    this.onBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TemplatePage(
      title: 'PDF Viewer',
      body: Container(),
    );
  }
}
