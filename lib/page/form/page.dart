import 'package:flutter/widgets.dart';
import 'package:print_to_pdf/page/form/view.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  Widget build(BuildContext context) {
    return FormView();
  }
}
