import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sleep_soundscape/global_widget/custom_button.dart';
import 'package:sleep_soundscape/model_view/theme_provider.dart';
import 'package:sleep_soundscape/view/settings_screens/widgets/bottom_sheet_header.dart';
void faqBottomSheet(BuildContext context) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    // backgroundColor: const Color(0xff0F0F14),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
    ),
    builder: (BuildContext context) {

      final darkTheme = context.watch<ThemeProvider>().isDarkMode;

      return Container(
        height: MediaQuery.of(context).size.height * 0.9, // 90% of screen height
        decoration: BoxDecoration(
          // color: const Color(0xff0F0F13),
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.h)),
        ),
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
            // Header: Back button and title.
            BottomSheetHeader(imagePath: "assets/icons/back.png", title: "FAQs"),
            SizedBox(height: 32.h),
            // Search field.
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 7.w),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(
                    color: const Color.fromRGBO(255, 255, 255, 0.08),
                    width: 1,
                  ),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: darkTheme ? const Color.fromRGBO(255, 255, 255, 0.50) : const Color.fromRGBO(0, 0, 0, 0.50)
                    ),
                    hintText: "search",
                    hintStyle: TextStyle(
                      color: darkTheme ? const Color.fromRGBO(255, 255, 255, 0.50) : const Color.fromRGBO(0, 0, 0, 0.50),
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 24.h),
            TextIconRow(text: "Lorem ipsum dolor sit amet"),
            SizedBox(height: 24.h),

            Divider(color:darkTheme ? Color.fromRGBO(255, 255, 255, 0.10) : Color.fromRGBO(0, 0, 0, 0.10),height: 1,),
            SizedBox(height: 24.h),
            TextIconRow(text: "Lorem ipsum dolor sit amet"),
            SizedBox(height: 24.h),

            Divider(color:darkTheme ? Color.fromRGBO(255, 255, 255, 0.10) : Color.fromRGBO(0, 0, 0, 0.10),height: 1,),

            SizedBox(height: 24.h),
            TextIconRow(text: "Lorem ipsum dolor sit amet"),
            SizedBox(height: 24.h),

            Divider(color:darkTheme ? Color.fromRGBO(255, 255, 255, 0.10) : Color.fromRGBO(0, 0, 0, 0.10),height: 1,),
            SizedBox(height: 32.h,),

            CustomButton(text: "Continue", onPressed: (){})

          ],
        ),
      );
    },
  );
}
class TextIconRow extends StatelessWidget {
  final String text;
  final IconData icon;

  const TextIconRow({
    Key? key,
    required this.text,
    this.icon = Icons.keyboard_arrow_down_outlined,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 11.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Icon(
            icon,

            size: 24.sp,
          ),
        ],
      ),
    );
  }
}