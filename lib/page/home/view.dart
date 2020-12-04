import 'package:flutter/material.dart';
import 'package:print_to_pdf/global/components/template_page.dart';
import 'package:print_to_pdf/global/database/helpers/helper.dart';
import 'package:print_to_pdf/global/database/models/data.dart';

class DummyData {
  final String id;
  final String title;
  final String content;

  DummyData({
    this.id,
    this.title,
    this.content,
  });
}

class HomeView extends StatelessWidget {
  final List<DummyData> list;
  final Function onTapItem;
  final Function onTapDelete;
  final Function onTapCreate;

  const HomeView({
    Key key,
    this.list,
    this.onTapItem,
    this.onTapDelete,
    this.onTapCreate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DBHelper _dbHelper = DBHelper();
    int _count = 0;
    List<PDFData> _pdfList;

    return TemplatePage(
      title: 'Print to PDF',
      centerTitle: true,
      // actions: <Widget>[
      //   IconButton(
      //     icon: Icon(Icons.settings),
      //     onPressed: () {
      //       Navigator.of(context).push(RouteTransition(page: PreferencePage()));
      //     },
      //   )
      // ],
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(12),
          child: ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: list.length,
            separatorBuilder: (context, index) => SizedBox(height: 8),
            itemBuilder: (context, index) => PDFItem(
              data: list[index],
              onTapItem: onTapItem,
              onTapDelete: onTapDelete,
            ),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'Create New',
        onPressed: onTapCreate,
      ),
    );
  }
}

class PDFItem extends StatelessWidget {
  final DummyData data;
  final Function onTapItem;
  final Function onTapDelete;

  const PDFItem({
    Key key,
    this.data,
    this.onTapItem,
    this.onTapDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Card(
        child: InkWell(
          onTap: onTapItem,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(data.title),
                      SizedBox(height: 4),
                      Text(data.content),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: onTapDelete,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
