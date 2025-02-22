
import 'package:flutter/material.dart';
import '../view/home_screen/screen/home_screen.dart';
import '../view/sounds_screen/screen/sound_screen.dart';

class ParentScreensProvider with ChangeNotifier {
  final List<Widget> _screens = [const HomeScreen(), SoundScreen()];
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;
  List<Widget> get screens => _screens;

  void onSelectedIndex(int selectedIndex) {
    if (_selectedIndex != selectedIndex) {
      _selectedIndex = selectedIndex;
      notifyListeners();
    }
  }
}
