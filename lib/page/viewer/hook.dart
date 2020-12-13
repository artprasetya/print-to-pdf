import 'package:flutter/material.dart';
import 'package:share/share.dart';

class PDFViewerState {
  final VoidCallback onTapShare;
  PDFViewerState({this.onTapShare});
}

PDFViewerState usePDFViewerHook(
  String fileName,
  String path,
) {
  void _onTapShare() async {
    await Share.shareFiles([path], text: fileName);
  }

  return PDFViewerState(onTapShare: _onTapShare);
}
