import 'package:flutter/material.dart';
import 'package:print_to_pdf/global/components/route_transition.dart';
import 'package:print_to_pdf/global/components/template_page.dart';
import 'package:print_to_pdf/global/database/helpers/helper.dart';
import 'package:print_to_pdf/global/database/models/data.dart';
import 'package:print_to_pdf/page/preference/preference.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DBHelper dbHelper = DBHelper();
  int count = 0;
  List<PDFData> pdfList;

  @override
  Widget build(BuildContext context) {
    if (pdfList == null) pdfList = List<PDFData>();

    return TemplatePage(
      title: 'Print to PDF',
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {
            Navigator.of(context).push(RouteTransition(page: PreferencePage()));
          },
        )
      ],
      body: Center(
        child: Container(
          child: Text('Hello World'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'Tambah Data',
        onPressed: () async {
          // var contact = await navigateToEntryForm(context, null);
          // if (contact != null) addContact(contact);
        },
      ),
    );
  }
}
