import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sleep_soundscape/Utils/route_name.dart';
import 'package:sleep_soundscape/global_widget/custom_button.dart';
import 'package:sleep_soundscape/l10n.dart';
import 'package:sleep_soundscape/model_view/local_Provider.dart';
import 'package:sleep_soundscape/model_view/theme_provider.dart';
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

int selectedLanguage = 0; // Default to "System default"

void LanguageBottomSheet(BuildContext context) {
  showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10.w),
        topRight: Radius.circular(10.w),
      ),
    ),
    context: context,
    isScrollControlled: true,
    builder: (context) {
      final localProvider = context.watch<LocalProvider>(); // Access LocalProvider
      final darkTheme = context.watch<ThemeProvider>().isDarkMode;
      
      return SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.9,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(height: 6.h),

              // Top Drag Handle
              Container(
                width: 115.w,
                height: 6.h,
                decoration: BoxDecoration(
                  color: darkTheme
                      ? Color.fromRGBO(255, 255, 255, 0.10)
                      : Color.fromRGBO(0, 0, 0, 0.10),
                  borderRadius: BorderRadius.circular(100.r),
                ),
              ),
              SizedBox(height: 12.h),

              // Bottom Sheet Header
              BottomSheetHeader(
                imagePath: "assets/icons/back.png",
                title: "Language",
              ),

              SizedBox(height: 24.h),

              // Language Selection List
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: languages.length,
                  separatorBuilder: (context, index) => Divider(
                    color: darkTheme
                        ? Color.fromRGBO(255, 255, 255, 0.1)
                        : Color.fromRGBO(0, 0, 0, 0.1),
                    height: 1,
                  ),
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        languages[index],
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w300,
                              fontFamily: "Lexend",
                            ),
                      ),
                      trailing: selectedLanguage == index
                          ? Icon(Icons.radio_button_checked, color: Color(0xFFFAD051))
                          : Icon(Icons.radio_button_off,
                              color: darkTheme
                                  ? Color.fromRGBO(255, 255, 255, 0.6)
                                  : Color.fromRGBO(0, 0, 0, 0.6)),
                      onTap: () {
                        selectedLanguage = index;

                        
                        if (index == 0) {
                          localProvider.clearLocale(); 
                        } else {
                          localProvider.setLocale(L10n.all[index - 1]); 
                        }

                        Navigator.pop(context); 
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
