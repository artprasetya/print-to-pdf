import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:print_to_pdf/page/form/view.dart';
import 'package:print_to_pdf/router/router.gr.dart';

class FormPage extends StatefulWidget {
  final String fileName;

  const FormPage({
    Key key,
    this.fileName,
  }) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  Widget build(BuildContext context) {
    return FormView(
      fileName: widget.fileName,
      onTapCreate: _onTapCreate,
    );
  }

  void _onTapCreate() {
    ExtendedNavigator.root.pushAndRemoveUntilPath(
      Routes.pdfViewerPage,
      Routes.homePage,
    );
  }
}
