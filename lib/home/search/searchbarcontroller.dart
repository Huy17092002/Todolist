import 'package:flutter/material.dart';

class SearchBarController {
  late bool isSearch;
  late bool isFix;
  late double opacityFix;
  late double opacityCancel;
  late TextEditingController myController;
  late FocusNode focusNode;

  SearchBarController({
    required this.isSearch,
    required this.isFix,
    required this.opacityCancel,
    required this.opacityFix,
    required this.myController,
    required this.focusNode,
  });

  void cancel() {
    isSearch = false;
    isFix = false;
    opacityFix = 1;
    opacityCancel = 0;
    myController.clear();
    focusNode.unfocus();
  }

  void onTapSearch() {
    isSearch = true;
    isFix = true;
    opacityCancel = 1;
    opacityFix = 0;
  }
}





