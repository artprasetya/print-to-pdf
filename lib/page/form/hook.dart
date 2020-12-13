import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as PDFWidget;
import 'package:print_to_pdf/global/model/pdf_data.dart';
import 'package:print_to_pdf/main.dart';
import 'package:print_to_pdf/router/router.gr.dart';

class FormState {
  final TextEditingController titleController;
  final TextEditingController contentController;
  final Function(String) onChangeTitle;
  final Function(String) onChangeContent;
  final VoidCallback onTapCreate;

  FormState({
    this.titleController,
    this.contentController,
    this.onChangeTitle,
    this.onChangeContent,
    this.onTapCreate,
  });
}

FormState useFormHook(String fileName) {
  final _titleController = useTextEditingController();
  final _contentController = useTextEditingController();
  final _title = useState<String>('');
  final _content = useState<String>('');
  final _pdfBox = useState(Hive.box<PDFData>(pdfBoxName));

  void _onChangeTitle(String value) {
    _title.value = value;
  }

  void _onChangeContent(String value) {
    _content.value = value;
  }

  void _onTapCreate() async {
    final pdf = PDFWidget.Document();
    // Create PDF
    pdf.addPage(
      PDFWidget.MultiPage(
        pageFormat: PdfPageFormat.a4,
        header: (PDFWidget.Context context) => _buildHeader(_title, context),
        build: (PDFWidget.Context context) => _buildContent(_content),
        footer: (PDFWidget.Context context) => _buildFooter(context),
      ),
    );

    // Save File
    final String dir = (await getApplicationDocumentsDirectory()).path;
    final String path = '$dir/$fileName.pdf';
    final File file = File(path);
    await file.writeAsBytes(pdf.save());

    // Save to Box
    PDFData data = PDFData(fileName: fileName, path: path);
    _pdfBox.value.add(data);

    // Navigate to viewer page
    ExtendedNavigator.root.pushAndRemoveUntilPath(
      Routes.pdfViewerPage,
      Routes.homePage,
      arguments: PdfViewerPageArguments(
        fileName: fileName,
        path: path,
      ),
    );
  }

  return FormState(
    titleController: _titleController,
    contentController: _contentController,
    onChangeTitle: _onChangeTitle,
    onChangeContent: _onChangeContent,
    onTapCreate:
        (_title.value != '' && _content.value != '') ? _onTapCreate : null,
  );
}

_buildFooter(PDFWidget.Context context) {
  return PDFWidget.Container(
    alignment: PDFWidget.Alignment.centerRight,
    margin: PDFWidget.EdgeInsets.only(top: 1.0 * PdfPageFormat.cm),
    child: PDFWidget.Text(
      'Page ${context.pageNumber} of ${context.pagesCount}',
      style: PDFWidget.Theme.of(context)
          .defaultTextStyle
          .copyWith(color: PdfColors.grey),
    ),
  );
}

_buildContent(ValueNotifier<String> _content) {
  return [
    PDFWidget.Paragraph(text: _content.value),
  ];
}

_buildHeader(ValueNotifier<String> _title, PDFWidget.Context context) {
  return PDFWidget.Container(
    alignment: PDFWidget.Alignment.centerLeft,
    margin: const PDFWidget.EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
    padding: const PDFWidget.EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
    child: PDFWidget.Header(
      level: 0,
      child: PDFWidget.Row(
        mainAxisAlignment: PDFWidget.MainAxisAlignment.spaceBetween,
        children: [
          PDFWidget.Text(_title.value, textScaleFactor: 2),
          PDFWidget.PdfLogo(),
        ],
      ),
    ),
  );
}
