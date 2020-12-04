import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:print_to_pdf/global/components/template_page.dart';
import 'package:print_to_pdf/global/saver/saver.dart';
import 'package:print_to_pdf/global/theme/app_theme.dart';
import 'package:print_to_pdf/global/theme/bloc/theme_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencePage extends StatefulWidget {
  @override
  _PreferencePageState createState() => _PreferencePageState();
}

class _PreferencePageState extends State<PreferencePage> {
  bool _isSwitched = false;

  @override
  void initState() {
    super.initState();
    getSwitherValue();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TemplatePage(
      title: 'Preference',
      body: _buildSwitcher(context),
    );
  }

  void getSwitherValue() async {
    // _isSwitched = await Saver().retrieve('isLight') ?? false;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isSwitched = prefs.getBool('isLight') ?? false;
  }

  void saveSwitherValue(bool value) async {
    // _isSwitched = await Saver().save('isLight', value);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('key', value);
  }

  Widget _buildSwitcher(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Switch Theme'),
          Switch(
            value: _isSwitched,
            onChanged: (value) {
              onChangeSwitcher(value);
            },
            activeColor: Colors.blue,
          ),
        ],
      ),
    );
  }

  void onChangeSwitcher(bool value) {
    setState(() {
      _isSwitched = value;
      saveSwitherValue(_isSwitched);
    });

    BlocProvider.of<ThemeBloc>(context).add(ChangeTheme(
      theme: _isSwitched ? AppTheme.Light : AppTheme.Dark,
      isLight: _isSwitched,
    ));

    // _bloc.add(
    //   ChangeTheme(
    //     theme: _isSwitched ? AppTheme.Light : AppTheme.Dark,
    //     isLight: value,
    //   ),
    // );
  }
}
