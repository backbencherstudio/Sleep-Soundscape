import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sleep_soundscape/view/settings_screens/widgets/settings_item_tile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000000),
      body: Center(
        child: IconButton(
          onPressed: (){
            settingModalSheet(context);
          },
          icon: Icon(Icons.menu,size: 50,),
        ),
      ),
    );
  }
}


void settingModalSheet(BuildContext context){
  showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10.w),
        topRight: Radius.circular(10.w),
      )
    ),
      context: context,
      isScrollControlled: true,
      backgroundColor: Color(0xFF0F0F13),
      builder: (contex) {
        return SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.9,
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                SizedBox(height: 6.h,),
            
                Container(
                  width: 115.w,
                  height: 6.h,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 0.10),
                      borderRadius: BorderRadius.circular(100.r)
                  ),
                ),
                SizedBox(height: 12.h,),
                AppBar(
                  backgroundColor: Color(0xFF0F0F13) ,
                  leadingWidth: 32.w,
                  leading: GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child:  ImageIcon(AssetImage("assets/icons/back.png"),size: 32.r,color: Colors.white,)),   //Image.asset("assets/icons/back.png",width: 32.w,height: 32.h,fit: BoxFit.contain,)),
                  centerTitle: true,
                  title: Text("Settings",),
                  titleTextStyle: TextStyle(
                      fontFamily: "Lexend",
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500
                  ),
                ),
                
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 24.h,),
                        SettingsItemTile(onTap: (){},imagePath: "assets/icons/profile.png",title: "Profile",),
                        SizedBox(height: 18.h,),
                        Divider(color: Color.fromRGBO(255, 255, 255, 0.1),),
                        SizedBox(height: 24.h,),
                        SettingsItemTile(onTap: (){},imagePath: "assets/icons/cng-password.png",title: "Change Password"),
                        SizedBox(height: 18.h,),
                        Divider(color: Color.fromRGBO(255, 255, 255, 0.1),),
                        SizedBox(height: 24.h,),
                        SettingsItemTile(onTap: (){},imagePath: "assets/icons/invite-friends.png",title: "Invite Friends"),
                        SizedBox(height: 18.h,),
                        Divider(color: Color.fromRGBO(255, 255, 255, 0.1),),
                        SizedBox(height: 24.h,),
                        SettingsItemTile(onTap: (){},imagePath: "assets/icons/notification.png",title: "Notifications"),
                        SizedBox(height: 18.h,),
                        Divider(color: Color.fromRGBO(255, 255, 255, 0.1),),
                        SizedBox(height: 24.h,),
                        SettingsItemTile(onTap: (){},imagePath: "assets/icons/language.png",title: "Language"),
                        SizedBox(height: 18.h,),
                        Divider(color: Color.fromRGBO(255, 255, 255, 0.1),),
                        SizedBox(height: 24.h,),
                        SettingsItemTile(onTap: (){},imagePath: "assets/icons/Personalization.png",title: "Personalization"),
                        SizedBox(height: 18.h,),
                        Divider(color: Color.fromRGBO(255, 255, 255, 0.1),),
                        SizedBox(height: 24.h,),
                        SettingsItemTile(onTap: (){},imagePath: "assets/icons/apple-health.png",title: "Apple Health"),
                        SizedBox(height: 18.h,),
                        Divider(color: Color.fromRGBO(255, 255, 255, 0.1),),
                        SizedBox(height: 24.h,),
                        SettingsItemTile(onTap: (){},imagePath: "assets/icons/faq.png",title: "FAQs"),
                        SizedBox(height: 18.h,),
                        Divider(color: Color.fromRGBO(255, 255, 255, 0.1),),
                        SizedBox(height: 24.h,),
                        SettingsItemTile(onTap: (){},imagePath: "assets/icons/about.png",title: "About"),
                        SizedBox(height: 40.h,),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: 32.h,)
              ],
            ),
          ),
        );
      }
  );
}

