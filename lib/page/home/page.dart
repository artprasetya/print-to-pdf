import 'package:flutter/widgets.dart';
import 'package:print_to_pdf/page/home/view.dart';

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
      onTapCreate: () {},
    );
  }
}
