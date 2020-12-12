import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:print_to_pdf/page/home/widgets/components/dialog/hook.dart';

WidgetBuilder buildFormInsertFileNameDialog(BuildContext context) {
  return (BuildContext context) => DialogInputFileName(context: context);
}

class DialogInputFileName extends HookWidget {
  final BuildContext context;
  DialogInputFileName({this.context});

  @override
  Widget build(BuildContext context) {
    // Hook
    final state = useDialogInputFileName();

    return SimpleDialog(
      contentPadding: EdgeInsets.all(24),
      children: [
        TextField(
          controller: state.controller,
          onChanged: (value) => state.onChange(value),
          decoration: InputDecoration(
            isDense: true,
            border: OutlineInputBorder(),
            hintText: 'Insert file name here',
          ),
        ),
        SizedBox(height: 12),
        RaisedButton(
          child: Text('Next'),
          onPressed: state.enabledButton ? state.onTapNext : null,
        ),
      ],
    );
  }
}
