import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:print_to_pdf/page/home/hook.dart';
import 'package:print_to_pdf/page/home/view.dart';

class HomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final state = useHomeHook(context);
    return HomeView(
      isLoading: state.isLoading,
      pdfBox: state.pdfBox,
      onTapItem: state.onTapItem,
      onTapDelete: state.onTapDelete,
      onTapCreate: state.onTapCreate,
      onTapPreference: state.onTapPreference,
    );
  }
}
