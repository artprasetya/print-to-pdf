import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:print_to_pdf/page/home/view.dart';
import 'package:print_to_pdf/page/home/widgets/components/form_insert_file_name.dart';

class HomPage extends StatefulWidget {
  @override
  _HomPageState createState() => _HomPageState();
}

class _HomPageState extends State<HomPage> {
  List<DummyData> list = [
    DummyData(
      id: 'ID',
      title: 'Title',
      content: 'Content',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return HomeView(
      list: list,
      onTapItem: () {},
      onTapDelete: () {},
      onTapCreate: () => _showDialog(context),
    );
  }

  Future<void> _showDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: buildFormInsertFileNameDialog(
        context,
        () {},
      ),
    );
  }
}
