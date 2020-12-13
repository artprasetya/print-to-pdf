import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:print_to_pdf/global/components/template_page.dart';
import 'package:print_to_pdf/global/model/pdf_data.dart';
import 'package:print_to_pdf/page/home/widgets/components/item/pdf_item.dart';

class HomeView extends StatelessWidget {
  final bool isLoading;
  final Function(PDFData) onTapItem;
  final Function(int) onTapDelete;
  final VoidCallback onTapCreate;
  final Box<PDFData> pdfBox;

  const HomeView({
    Key key,
    this.isLoading = false,
    this.onTapItem,
    this.onTapDelete,
    this.onTapCreate,
    this.pdfBox,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TemplatePage(
      title: 'Print to PDF',
      centerTitle: true,
      loading: isLoading,
      body: ValueListenableBuilder(
        valueListenable: pdfBox.listenable(),
        builder: (context, Box<PDFData> value, _) {
          List<int> keys = value.keys.cast<int>().toList();
          return keys.isNotEmpty
              ? _buildListView(keys)
              : Center(
                  child: Text('Data is empty'),
                );
        },
      ),
      floatingActionButton: !isLoading
          ? FloatingActionButton(
              child: Icon(Icons.add),
              tooltip: 'Create New',
              onPressed: onTapCreate,
            )
          : null,
    );
  }

  _buildListView(List<int> keys) {
    return SingleChildScrollView(
      child: ListView.separated(
        padding: EdgeInsets.all(12),
        itemCount: keys.length,
        reverse: true,
        shrinkWrap: true,
        separatorBuilder: (context, index) => SizedBox(height: 8),
        itemBuilder: (context, index) {
          final int key = keys[index];
          final PDFData data = pdfBox.get(key);
          return PDFItem(
            itemKey: key,
            data: data,
            onTapItem: onTapItem,
            onTapDelete: onTapDelete,
          );
        },
      ),
    );
  }
}
