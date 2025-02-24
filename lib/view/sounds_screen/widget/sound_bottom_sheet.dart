import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

  void soundBottomSheet(BuildContext context) {
    final List<String> categories = ["Oceans", "Nature", "Rain", "Map", "Fire"];
    int selectedIndex = 0; // Track the selected category
    // Use a ValueNotifier to manage the state of the sound toggles.
    final ValueNotifier<List<bool>> isPressedNotifier =
    ValueNotifier(List.generate(6, (index) => false));

    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Color(0xff0F0F14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.9, // 90% of screen height
          decoration: BoxDecoration(
            color: Color(0xff0F0F13),
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
                    color: Colors.transparent,
                    border: Border.all(
                      color: Color.fromRGBO(255, 255, 255, 0.20),
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
                        color: Colors.white,
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
                      color: Color.fromRGBO(255, 255, 255, 0.08),
                      width: 1,
                    ),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(255, 255, 255, 0.08),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(255, 255, 255, 0.08),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      filled: true,
                      fillColor: Color(0xff19191C),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Color.fromRGBO(255, 255, 255, 0.50),
                      ),
                      hintText: "search",
                      hintStyle: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 0.50),
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
                              width: 0.8,
                            ),
                            color: isSelected
                                ? Color(0xffFAD051)
                                : Color(0xff19191C),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            categories[index],
                            style: TextStyle(
                              color: isSelected ? Colors.black : Colors.white,
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
                child: ValueListenableBuilder<List<bool>>(
                  valueListenable: isPressedNotifier,
                  builder: (context, isPressedList, child) {
                    return ListView.builder(
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4.0,
                            horizontal: 8.0,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[900],
                              borderRadius: BorderRadius.circular(10.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 5,
                                  spreadRadius: 1,
                                ),
                              ],
                            ),
                            child: ListTile(
                              leading: Image.asset(
                                'assets/images/white_sound.png',
                                width: 40,
                                height: 40,
                              ),
                              title: Text(
                                "Sound ${index + 1}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                ),
                              ),
                              subtitle: Text(
                                "Subtitle ${index + 1}",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              trailing: GestureDetector(
                                onTap: () {
                                  // Update the ValueNotifier instead of calling setState.
                                  final newList = List<bool>.from(isPressedList);
                                  newList[index] = !newList[index];
                                  isPressedNotifier.value = newList;
                                },
                                child: isPressedList[index]
                                    ? Image.asset(
                                  "assets/icons/play2.png",
                                  height: 30,
                                )
                                    : Image.asset(
                                  "assets/icons/play1.png",
                                  height: 30,
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
  }


//////////
