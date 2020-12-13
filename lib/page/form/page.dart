import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:print_to_pdf/page/form/hook.dart';
import 'package:print_to_pdf/page/form/view.dart';

class FormPage extends HookWidget {
  final String fileName;
  FormPage({this.fileName});

  @override
  Widget build(BuildContext context) {
    final state = useFormHook(fileName);
    return FormView(
      fileName: fileName,
      titleController: state.titleController,
      contentController: state.contentController,
      onChangeTitle: state.onChangeTitle,
      onChangeContent: state.onChangeContent,
      onTapCreate: state.onTapCreate,
    );
  }
}
