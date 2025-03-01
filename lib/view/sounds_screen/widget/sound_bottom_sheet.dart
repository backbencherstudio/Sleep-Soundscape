import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sleep_soundscape/model_view/sound_screen_provider.dart';
import '../../../model_view/theme_provider.dart';

void soundBottomSheet(BuildContext context) {
  final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
  final soundScreenProvider = Provider.of<SoundScreenProvider>(context, listen: false);
  ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);

  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
    ),
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.9,
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Close Button
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 7.w),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: themeProvider.themeMode == ThemeMode.dark
                            ? Color.fromRGBO(255, 255, 255, 0.20)
                            : Colors.black,
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
                          color: themeProvider.themeMode == ThemeMode.dark ? Colors.white : Colors.black,
                          size: 10.sp,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 32.h),

                // Search Field
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7.w),
                  child: TextFormField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      filled: true,
                      fillColor: themeProvider.themeMode == ThemeMode.dark
                          ? Color(0xff19191C)
                          : Color(0xffF5F5F5),
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search",
                    ),
                  ),
                ),
                SizedBox(height: 12.h),

                // Categories List
                ValueListenableBuilder<int>(
                  valueListenable: selectedIndexNotifier,
                  builder: (context, selectedIndex, child) {
                    return SizedBox(
                      height: 40.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: soundScreenProvider.categories.length,
                        itemBuilder: (context, index) {
                          bool isSelected = selectedIndex == index;
                          return GestureDetector(
                            onTap: () {
                              selectedIndexNotifier.value = index;
                              soundScreenProvider.fetchSound(soundScreenProvider.categories[index]);
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.w),
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14.r),
                                  border: Border.all(color: Colors.transparent, width: 1),
                                  color: isSelected
                                      ? Color(0xffFAD051)
                                      : themeProvider.themeMode == ThemeMode.dark
                                      ? Color(0xff19191C)
                                      : Color(0xffF5F5F5),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  soundScreenProvider.categories[index],
                                  style: TextStyle(fontSize: 14.sp, fontWeight: isSelected ? FontWeight.w400 : FontWeight.normal),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
                SizedBox(height: 24.h),

                // Sound List
                Expanded(
                  child: Consumer<SoundScreenProvider>(
                    builder: (context, soundScreenProvider, child) {
                      if (soundScreenProvider.isLoading) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (soundScreenProvider.soundList.isEmpty) {
                        return Center(child: Text("No sounds available"));
                      }

                      return ListView.builder(
                        itemCount: soundScreenProvider.soundList.length,
                        itemBuilder: (context, index) {
                          final music = soundScreenProvider.soundList[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: themeProvider.themeMode == ThemeMode.dark ? Colors.grey[900] : Color(0xffF5F5F5),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: ListTile(
                                leading: music.imagePath != null && music.imagePath!.isNotEmpty
                                    ? Image.network(
                                  music.imagePath!,
                                  width: 40,
                                  height: 40,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.asset(
                                      'assets/images/calm.png', // Fallback if network image fails
                                      width: 40,
                                      height: 40,
                                      fit: BoxFit.cover,
                                    );
                                  },
                                )
                                    : Image.asset(
                                  'assets/images/calm.png', // Default asset image
                                  width: 40,
                                  height: 40,
                                  fit: BoxFit.cover,
                                ),

                                title: Text(music.title ?? '',style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: themeProvider.themeMode == ThemeMode.dark ? Colors.white54 : Colors.black87
                                ),),
                                subtitle: Text(music.subtitle ?? '',style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: themeProvider.themeMode == ThemeMode.dark ? Colors.white54 : Colors.black87
                                ),),
                                trailing: GestureDetector(
                                  onTap: () {
                                    soundScreenProvider.playMusic(index);
                                  },
                                  child: soundScreenProvider.playedMusic == index && soundScreenProvider.isPlaying
                                      ? Image.asset("assets/icons/play2.png", height: 30) // Pause icon
                                      : Image.asset(
                                    "assets/icons/play1.png",
                                    height: 30,
                                    color: themeProvider.themeMode == ThemeMode.dark ? Colors.white54 : Colors.black,
                                  ),
                                ),




                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

