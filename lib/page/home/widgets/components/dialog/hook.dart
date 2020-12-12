import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:print_to_pdf/router/router.gr.dart';

class DialogInputFileNameState {
  final String fileName;
  final bool enabledButton;
  final TextEditingController controller;
  final VoidCallback onTapNext;
  final Function(String) onChange;

  DialogInputFileNameState({
    this.fileName,
    this.enabledButton,
    this.controller,
    this.onTapNext,
    this.onChange,
  });
}

DialogInputFileNameState useDialogInputFileName() {
  final _fileName = useState<String>('');
  final _controller = useTextEditingController();
  final _enabledButton = useState<bool>(false);

  bool setEnabledButton(String value) =>
      _enabledButton.value = _fileName.value != '';

  void _onChange(String value) {
    _fileName.value = value;
    setEnabledButton(value);
  }

  void _onTapNext() {
    ExtendedNavigator.root.pop();
    ExtendedNavigator.root.push(
      Routes.formPage,
      arguments: FormPageArguments(fileName: _fileName.value),
    );
    _onChange('');
  }

  return DialogInputFileNameState(
    fileName: _fileName.value,
    enabledButton: _enabledButton.value,
    controller: _controller,
    onTapNext: _onTapNext,
    onChange: _onChange,
  );
}
