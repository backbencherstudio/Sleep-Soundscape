import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sleep_soundscape/model_view/sound_screen_provider.dart';

import '../../../model_view/theme_provider.dart';

  void soundBottomSheet(BuildContext context) {
    final List<String> categories = ["Oceans", "Nature", "Rain", "Map", "Fire"];
    int selectedIndex = 0; // Track the selected category
    // Use a ValueNotifier to manage the state of the sound toggles.
    // final ValueNotifier<List<bool>> isPressedNotifier =
    // ValueNotifier(List.generate(6, (index) => false));
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      // backgroundColor: Color(0xff0F0F14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.9, // 90% of screen height
          decoration: BoxDecoration(
            // color: Color(0xff0F0F13),
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
          ),
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button to close the bottom sheet
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 7.w),
                  decoration: BoxDecoration(
                    // color: Colors.transparent,
                    border: Border.all(
                       color: themeProvider.themeMode == ThemeMode.dark ? Color.fromRGBO(255, 255, 255, 0.20) :Colors.black,
                      width: 1,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(7.r),
                    child: Transform.translate(
                      offset: Offset(2, 0),
                      child: Icon(
                        Icons.arrow_back_ios,
                         color:  themeProvider.themeMode == ThemeMode.dark ? Colors.white : Colors.black,
                        size: 10.sp,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 32.h),
              // Search field
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 7.w),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(
                       color: Colors.transparent,
                     // width: 1,
                    ),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,

                          // color: Color.fromRGBO(255, 255, 255, 0.08),
                          //width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,

                          // color: Color.fromRGBO(255, 255, 255, 0.08),
                         // width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      filled: true,
                       fillColor:  themeProvider.themeMode == ThemeMode.dark ? Color(0xff19191C) : Color(0xffF5F5F5),
                      prefixIcon: Icon(
                        Icons.search,
                        // color: Color.fromRGBO(255, 255, 255, 0.50),
                      ),
                      hintText: "search",
                      hintStyle: TextStyle(
                        // color: Color.fromRGBO(255, 255, 255, 0.50),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              // Horizontal list for categories
              SizedBox(
                height: 40.h, // Fixed height for smoother UI
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    bool isSelected = selectedIndex == index;
                    return GestureDetector(
                      onTap: () {
                        // If you want to update the selected category without setState,
                        // consider using another ValueNotifier.
                        // For now, this remains unchanged.
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 12.h,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14.r),
                            border: Border.all(
                               color: Colors.grey,
                              width: 0.1,
                            ),



                            color: isSelected
                                ? Color(0xffFAD051)
                                :   themeProvider.themeMode == ThemeMode.dark ? Color(0xff19191C) : Color(0xffF5F5F5),



                          ),
                          alignment: Alignment.center,
                          child: Text(
                            categories[index],
                            style: TextStyle(
                              // color: isSelected ? Colors.black : Colors.white,
                              fontSize: 14.sp,
                              fontWeight:
                              isSelected ? FontWeight.w400 : FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 24.h),
              // Sound list using a ValueListenableBuilder to react to changes in isPressedNotifier.
              Expanded(
                child: Consumer<SoundScreenProvider>(
                  builder: (context, soundScreenProvider,child) {
                    return ListView.builder(
                      itemCount: soundScreenProvider.musicModel!.musicList!.length,
                      itemBuilder: (context, index) {
                        final music = soundScreenProvider.musicModel!.musicList![index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4.0,
                            horizontal: 8.0,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                               color: themeProvider.themeMode == ThemeMode.dark ? Colors.grey[900] :   Color(0xffF5F5F5) ,
                              borderRadius: BorderRadius.circular(10.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.transparent,
                                  blurRadius: 1,
                                  spreadRadius: 1,
                                ),
                              ],
                            ),
                            child: ListTile(
                              leading: Image.asset(
                                music.imagePath!,
                                width: 40,
                                height: 40,
                                fit: BoxFit.cover,
                              ),
                              title: Text(
                                music.title!,
                                style:Theme.of(context).textTheme.bodySmall?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                ),
                              ),
                              subtitle: Text(
                                music.subtitle!,
                                style:Theme.of(context).textTheme.bodySmall?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.sp,
                                ),
                              ),
                              trailing: Consumer<SoundScreenProvider>(
                                builder: (_, soundScreenProvider, child) {
                                  return GestureDetector(
                                    onTap: () async {
                                      await soundScreenProvider.playMusic(index);
                                    },
                                    child: soundScreenProvider.playedMusic == index
                                        ? Image.asset(
                                      "assets/icons/play2.png" ,
                                      height: 30,
                                     // color: themeProvider.themeMode == ThemeMode.dark ? Colors.white54 : Colors.black12,
                                    )
                                        : Image.asset(
                                      "assets/icons/play1.png",
                                      height: 30,
                                      color: themeProvider.themeMode == ThemeMode.dark ? Colors.white54 : Colors.black,
                                    ),
                                  );
                                }
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                ),
              ),
            ],
          ),
        );
      },
    );
  }


//////////
