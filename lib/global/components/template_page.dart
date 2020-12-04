import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TemplatePage extends StatelessWidget {
  final String title;
  final bool centerTitle;
  final Widget body;
  final List<Widget> actions;
  final Widget floatingActionButton;

  const TemplatePage({
    Key key,
    @required this.title,
    this.centerTitle = false,
    @required this.body,
    this.actions,
    this.floatingActionButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: centerTitle,
        actions: actions,
      ),
      body: body,
      floatingActionButton: floatingActionButton,
    );
  }
}
