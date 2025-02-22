import 'package:flutter/material.dart';
import 'package:sleep_soundscape/view/settings_screens/widgets/setting_bottom_modal_sheet.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000000),
      body: Center(
        child: IconButton(
          onPressed: (){
            settingBottomModalSheet(context);
          },
          icon: Icon(Icons.menu,size: 50,),
        ),
      ),
    );
  }
}



