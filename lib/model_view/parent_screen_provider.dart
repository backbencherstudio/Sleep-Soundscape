
import 'package:flutter/material.dart';

import '../view/home_screen/screen/home_screen.dart';
import '../view/sounds_screen/screen/sound_screen.dart';

class ParentScreensProvider with ChangeNotifier{

  List<Widget> screens = [const HomeScreen(),SoundScreen()];
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void onSelectedIndex(int selectedIndex){
    _selectedIndex = selectedIndex;
    notifyListeners();
    debugPrint("Selected Index : $selectedIndex");
  }

}