import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:print_to_pdf/global/components/template_page.dart';

class PreferenceView extends StatelessWidget {
  final bool isDark;
  final Function(bool) onChanged;

  const PreferenceView({
    Key key,
    this.isDark,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TemplatePage(
      title: 'Preference',
      body: SingleChildScrollView(
        child: SwitchListTile(
          title: Text('Dark Mode'),
          value: isDark,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
