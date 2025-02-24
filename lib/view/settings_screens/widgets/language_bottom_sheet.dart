import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sleep_soundscape/Utils/route_name.dart';
import 'package:sleep_soundscape/global_widget/custom_button.dart';
import 'package:sleep_soundscape/view/settings_screens/widgets/change_password_bottom_sheet.dart';
import 'package:sleep_soundscape/view/settings_screens/widgets/invite_friend_bottom_sheet.dart';
import 'package:sleep_soundscape/view/settings_screens/widgets/notification_bottom_sheet.dart';
import 'package:sleep_soundscape/view/settings_screens/widgets/settings_item_tile.dart';
import 'package:sleep_soundscape/view/settings_screens/widgets/sign_out_bottom_sheet.dart';

import 'bottom_sheet_header.dart';

final List<String> languages = [
  "System default",
  "English",
  "Hindi",
  "Punjabi",
  "Chinese",
  "Italian",
  "Dutch",
  "French",
  "Spanish",
  "German",
];

String selectedLanguage = "System default";

void LanguageBottomSheet(BuildContext context){
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
                BottomSheetHeader(imagePath:  "assets/icons/back.png",title:  "Language",),

                Expanded(
                  child: Column(
                    children: [
                       SizedBox(height: 24.h),
                      ListView.separated(
                        shrinkWrap: true,
                        itemCount: languages.length,
                        separatorBuilder: (context, index) => Divider(color: Color.fromRGBO(255, 255, 255, 0.1), height: 1),
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              languages[index],
                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.w300,
                                fontFamily: "Lexend"
                              ),
                            ),
                            trailing: selectedLanguage == languages[index]
                                ? const Icon(Icons.radio_button_checked, color: Color(0xFFFAD051))
                                : const Icon(Icons.radio_button_off, color: Color.fromRGBO(255,255,255,0.6)),
                            onTap: () {
                              // setState(() {
                              //   selectedLanguage = languages[index];
                              // });
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }
  );
}
