import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hive/hive.dart';
import 'package:print_to_pdf/main.dart';

class PreferenceState {
  final bool isDark;
  final Function(bool) onChanged;
  PreferenceState({this.isDark, this.onChanged});
}

PreferenceState usePreferenceHook() {
  final _preferenceBox = useState(Hive.box(preferenceBoxName));
  final _isDark = useState<bool>(
      _preferenceBox.value.get(preferenceKey, defaultValue: true));

  void _onChanged(bool value) {
    _isDark.value = value;
    _preferenceBox.value.put(preferenceKey, value);
  }

  return PreferenceState(
    isDark: _isDark.value,
    onChanged: _onChanged,
  );
}
