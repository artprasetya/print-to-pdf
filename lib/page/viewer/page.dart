import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:print_to_pdf/page/viewer/view.dart';

class PdfViewerPage extends StatefulWidget {
  @override
  _PdfViewerPageState createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
  @override
  Widget build(BuildContext context) {
    return PdfViewerView(
      onBack: _onBack,
    );
  }

  void _onBack() {
    ExtendedNavigator.root.pop();
  }
}
