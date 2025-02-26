import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sleep_soundscape/Utils/route_name.dart';
import 'package:sleep_soundscape/global_widget/custom_button.dart';
import 'package:sleep_soundscape/model_view/theme_provider.dart';
import 'package:sleep_soundscape/view/settings_screens/widgets/change_password_bottom_sheet.dart';
import 'package:sleep_soundscape/view/settings_screens/widgets/invite_friend_bottom_sheet.dart';
import 'package:sleep_soundscape/view/settings_screens/widgets/language_bottom_sheet.dart';
import 'package:sleep_soundscape/view/settings_screens/widgets/notification_bottom_sheet.dart';
import 'package:sleep_soundscape/view/settings_screens/widgets/settings_item_tile.dart';
import 'package:sleep_soundscape/view/settings_screens/widgets/sign_out_bottom_sheet.dart';

import 'bottom_sheet_header.dart';
import 'faq_bottom_sheet.dart';

void settingBottomModalSheet(BuildContext context){
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.w),
            topRight: Radius.circular(10.w),
          )
      ),
      context: context,
      isScrollControlled: true,
      // backgroundColor: Color(0xFF0F0F13),
      builder: (context) {

        final darkTheme = context.watch<ThemeProvider>().isDarkMode;

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
                      color: darkTheme ? Color.fromRGBO(255, 255, 255, 0.10) : Color.fromRGBO(0, 0, 0, 0.10),
                      borderRadius: BorderRadius.circular(100.r)
                  ),
                ),
                SizedBox(height: 12.h,),
                BottomSheetHeader(imagePath:  "assets/icons/back.png",title:  "Settings",),

                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // SizedBox(height: 24.h,),
                        // SettingsItemTile(onTap: (){
                        //   Navigator.pushNamed(context, RouteName.profileScreen);
                        // },imagePath: "assets/icons/profile.png",title: "Profile",),
                        // SizedBox(height: 18.h,),
                        // Divider(color: Color.fromRGBO(255, 255, 255, 0.1),),
                        SizedBox(height: 24.h,),
                        SettingsItemTile(onTap: (){
                          ChangePasswordBottomSheet(context);
                        },imagePath: "assets/icons/cng-password.png",title: "Change Password"),
                        SizedBox(height: 18.h,),
                        Divider( color: darkTheme ? Color.fromRGBO(255, 255, 255, 0.1) : Color.fromRGBO(0, 0, 0, 0.1), ),
                        SizedBox(height: 24.h,),
                        SettingsItemTile(onTap: (){
                          InviteFriendBottomSheet(context);
                        },imagePath: "assets/icons/invite-friends.png",title: "Invite Friends"),
                        SizedBox(height: 18.h,),
                        Divider( color: darkTheme ? Color.fromRGBO(255, 255, 255, 0.1) : Color.fromRGBO(0, 0, 0, 0.1), ),
                        SizedBox(height: 24.h,),
                        SettingsItemTile(onTap: (){
                          NotificationBottomSheet(context);
                        },imagePath: "assets/icons/notification.png",title: "Notifications"),
                        SizedBox(height: 18.h,),
                        Divider( color: darkTheme ? Color.fromRGBO(255, 255, 255, 0.1) : Color.fromRGBO(0, 0, 0, 0.1), ),
                        SizedBox(height: 24.h,),
                        SettingsItemTile(onTap: (){
                          LanguageBottomSheet(context);
                        },imagePath: "assets/icons/language.png",title: "Language"),
                        SizedBox(height: 18.h,),
                        Divider( color: darkTheme ? Color.fromRGBO(255, 255, 255, 0.1) : Color.fromRGBO(0, 0, 0, 0.1), ),
                        SizedBox(height: 24.h,),
                        SettingsItemTile(onTap: (){
                          Navigator.pushNamed(context, RouteName.personalizationScreen);
                        },imagePath: "assets/icons/Personalization.png",title: "Personalization"),
                        SizedBox(height: 18.h,),
                        Divider( color: darkTheme ? Color.fromRGBO(255, 255, 255, 0.1) : Color.fromRGBO(0, 0, 0, 0.1), ),
                        SizedBox(height: 24.h,),
                        SettingsItemTile(onTap: (){},imagePath: "assets/icons/apple-health.png",title: "Apple Health"),
                        SizedBox(height: 18.h,),
                        Divider( color: darkTheme ? Color.fromRGBO(255, 255, 255, 0.1) : Color.fromRGBO(0, 0, 0, 0.1), ),
                        SizedBox(height: 24.h,),
                        SettingsItemTile(onTap: ()=>faqBottomSheet(context),imagePath: "assets/icons/faq.png",title: "FAQs"),
                        SizedBox(height: 18.h,),
                        Divider( color: darkTheme ? Color.fromRGBO(255, 255, 255, 0.1) : Color.fromRGBO(0, 0, 0, 0.1), ),
                        SizedBox(height: 24.h,),
                        SettingsItemTile(onTap: (){

                          Navigator.pushNamed(context, RouteName.aboutScreen);
                        },imagePath: "assets/icons/about.png",title: "About"),
                        SizedBox(height: 32.h,),
                        CustomButton(text: "Sign out", onPressed: ()=>signOutBottomSheet(context)),
                        SizedBox(height: 40.h,),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
  );
}
