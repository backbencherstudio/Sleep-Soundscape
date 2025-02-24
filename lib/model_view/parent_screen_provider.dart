import 'package:flutter/material.dart';

class ParentScreensProvider extends ChangeNotifier {
  int selectedIndex = 0;

  void onSelectedIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
