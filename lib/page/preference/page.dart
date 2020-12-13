import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:print_to_pdf/page/preference/hook.dart';
import 'package:print_to_pdf/page/preference/view.dart';

class PreferencePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final state = usePreferenceHook();

    return PreferenceView(
      isDark: state.isDark,
      onChanged: state.onChanged,
    );
  }
}
