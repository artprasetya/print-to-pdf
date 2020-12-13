import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:print_to_pdf/global/model/pdf_data.dart';

class PDFItem extends StatelessWidget {
  final int itemKey;
  final PDFData data;
  final Function(PDFData) onTapItem;
  final Function(int) onTapDelete;

  const PDFItem({
    Key key,
    this.itemKey,
    this.data,
    this.onTapItem,
    this.onTapDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Card(
        child: InkWell(
          onTap: () => onTapItem(data),
          child: Container(
            color: Colors.transparent,
            padding: EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 12,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(data.fileName ?? ''),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => onTapDelete(itemKey),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
