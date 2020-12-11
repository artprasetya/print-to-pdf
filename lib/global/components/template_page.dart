import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TemplatePage extends StatelessWidget {
  final String title;
  final bool centerTitle;
  final Widget body;
  final List<Widget> actions;
  final Widget floatingActionButton;
  final Widget footer;

  const TemplatePage({
    Key key,
    @required this.title,
    this.centerTitle = false,
    @required this.body,
    this.actions,
    this.floatingActionButton,
    this.footer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(title),
        centerTitle: centerTitle,
        actions: actions,
      ),
      body: Column(
        children: [
          Expanded(
            child: body,
          ),
          if (footer != null) _buildFooter(footer),
        ],
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}

_buildFooter(Widget footer) {
  return Container(
    color: Colors.transparent,
    width: double.infinity,
    child: SafeArea(
      top: false,
      child: Container(
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: footer,
      ),
    ),
  );
}
