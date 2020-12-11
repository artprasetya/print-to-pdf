import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:print_to_pdf/page/home/view.dart';
import 'package:print_to_pdf/page/home/widgets/components/dialog_insert_file_name.dart';
import 'package:print_to_pdf/router/router.gr.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        _onTapNext,
      ),
    );
  }

  void _onTapNext() {
    ExtendedNavigator.root
        .push(Routes.formPage, arguments: FormPageArguments(fileName: 'Test'));
  }
}
