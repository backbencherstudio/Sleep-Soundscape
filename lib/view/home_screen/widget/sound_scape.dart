import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../model_view/theme_provider.dart';

void soundScape(BuildContext context) {
  // List<bool> isPressedList = List.generate(
  //   6,
  //   (index) => false,
  // ); // Track state for each item
  final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    // backgroundColor: Color(0xff0F0F13),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
    ),
    builder: (BuildContext context) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.96,

        decoration: BoxDecoration(
          // color: Color(0xff0F0F13),
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        ),
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      // color: Colors.transparent,
                      border: Border.all(
                          // color: Colors.grey,
                          width: 1),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(7.r),
                      child: Transform.translate(
                          offset: Offset(2, 0),
                          child: Icon(Icons.arrow_back_ios,
                              // color: Colors.white,
                              size: 10.sp)),
                    ),
                  ),
                ),
                SizedBox(width: 70.w),
                Text(
                  "Soundscape ",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    // color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),

            Expanded(
              child: ListView.builder(
                itemCount: 15,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4.0,
                      horizontal: 8.0,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                         color: themeProvider.themeMode == ThemeMode.dark ? Color(0xff19191C) : Color(0xffF5F5F5), // Background color
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                        border: Border.all(
                          color: themeProvider.themeMode == ThemeMode.dark ? Colors.transparent : Color.fromRGBO(255, 255, 255, 0.70),
                          width: 2
                        ),
                        // Rounded corners
                        // boxShadow: [
                        //   BoxShadow(
                        //     // color: Colors.black.withOpacity(0.2),
                        //     blurRadius: 1,
                        //     spreadRadius: 1,
                        //   ),
                        // ],
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
                             color: themeProvider.themeMode == ThemeMode.dark  ?  Colors.white : Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                          ),
                        ),

                        trailing:
                            index == 0
                                ? Icon(Icons.check, color: Color(0xffFAD051))
                                : null,
                      ),
                    ),
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
