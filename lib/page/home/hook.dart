import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:print_to_pdf/page/home/view.dart';
import 'package:print_to_pdf/page/home/widgets/components/dialog/dialog.dart';

class HomeState {
  final bool isLoading;
  final List<DummyData> list;
  final VoidCallback onTapItem;
  final VoidCallback onTapDelete;
  final VoidCallback onTapCreate;

  HomeState({
    this.isLoading,
    this.list,
    this.onTapItem,
    this.onTapDelete,
    this.onTapCreate,
  });
}

HomeState useHomeHook(BuildContext context) {
  // State
  final _isLoading = useState<bool>(false);
  final _list = useState<List<DummyData>>([]);

  // Setter
  bool setLoading(bool value) => _isLoading.value = value;

  insertData() {
    setLoading(true);
    _list.value.addAll([
      DummyData(
        id: "1",
        title: 'Title',
        content: 'Content',
      )
    ]);
  }

  // Function
  void _onTapItem() {
    log('On Tap Item');
  }

  void _onTapDelete() {
    log('On Tap Delete');
  }

  Future<void> _onTapCreate() {
    return showDialog(
      context: context,
      builder: buildFormInsertFileNameDialog(context),
    );
  }

  useEffect(() {
    insertData();
    setLoading(false);
  }, [_list.value]);

  return HomeState(
    isLoading: _isLoading.value,
    list: _list.value,
    onTapItem: _onTapItem,
    onTapDelete: _onTapDelete,
    onTapCreate: _onTapCreate,
  );
}
