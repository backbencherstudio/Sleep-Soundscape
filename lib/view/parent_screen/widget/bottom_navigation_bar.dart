import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../model_view/parent_screen_provider.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.h, left: 15.w, right: 15.w),
      height: 72.h,
      width: 320.w,
      padding: EdgeInsets.only(left: 5.w, right: 5.w),
      decoration: BoxDecoration(
        color: Color(0xff0B1118),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildNavItem(
            context,
            index: 0,
            icon: Icons.alarm,
            label: "Alarm",
          ),
          _buildNavItem(
            context,
            index: 1,
            icon: Icons.surround_sound_sharp,
            label: "Sounds",
          ),
          _buildNavItem(
            context,
            index: 3,
            icon: Icons.alarm_on_rounded,
            label: "Audio Timer",
          ),
        ],
      ),
    );
  }

  /// Reusable method to build bottom navigation item
  Widget _buildNavItem(BuildContext context, {required int index, required IconData icon, required String label}) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          context.read<ParentScreensProvider>().onSelectedIndex(index);
        },
        child: Consumer<ParentScreensProvider>(
          builder: (_, parentScreenProvider, child) {
            bool isSelected = parentScreenProvider.selectedIndex == index;
            return Container(
              height: 56.h,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(16.r),
                boxShadow: isSelected
                    ? [

                ]
                    : [],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color: isSelected ? Colors.black : Colors.grey,
                  ),
                  SizedBox(height: 4.h), // Space between icon and text
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: isSelected ? Colors.black : Colors.grey,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
