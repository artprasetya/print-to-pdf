import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hive/hive.dart';
import 'package:print_to_pdf/config/router/router.gr.dart';
import 'package:print_to_pdf/global/model/pdf_data.dart';
import 'package:print_to_pdf/main.dart';
import 'package:print_to_pdf/page/home/widgets/components/dialog/dialog.dart';

class HomeState {
  final bool isLoading;
  final Function(PDFData) onTapItem;
  final Function(int) onTapDelete;
  final VoidCallback onTapCreate;
  final VoidCallback onTapPreference;
  final Box<PDFData> pdfBox;

  HomeState({
    this.isLoading,
    this.onTapItem,
    this.onTapDelete,
    this.onTapCreate,
    this.onTapPreference,
    this.pdfBox,
  });
}

HomeState useHomeHook(BuildContext context) {
  final _isLoading = useState<bool>(false);
  final _pdfBox = useState(Hive.box<PDFData>(pdfBoxName));

  void _onTapItem(PDFData data) {
    ExtendedNavigator.root.push(
      Routes.pdfViewerPage,
      arguments: PdfViewerPageArguments(
        fileName: data.fileName,
        path: data.path,
      ),
    );
  }

  Future<void> _onTapDelete(int key) async {
    await _pdfBox.value.delete(key);
  }

  Future<void> _onTapCreate() {
    return showDialog(
      context: context,
      builder: buildFormInsertFileNameDialog(context),
    );
  }

  void _onTapPreference() {
    ExtendedNavigator.root.push(Routes.preferencePage);
  }

  return HomeState(
    isLoading: _isLoading.value,
    onTapItem: _onTapItem,
    onTapDelete: _onTapDelete,
    onTapCreate: _onTapCreate,
    onTapPreference: _onTapPreference,
    pdfBox: _pdfBox.value,
  );
}
