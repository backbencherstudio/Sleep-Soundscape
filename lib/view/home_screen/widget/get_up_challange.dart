import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sleep_soundscape/view/home_screen/widget/shake_time.dart';

import '../../../global_widget/switch_button.dart';

void getChallange(BuildContext context) {
  ValueNotifier<bool> isAlarmSwitched = ValueNotifier<bool>(false);

  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    backgroundColor: Color(0xff0F0F13),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
    ),
    builder: (BuildContext context) {

      return Container(
        height: MediaQuery.of(context).size.height * 0.9,

        decoration: BoxDecoration(
          color: Color(0xff0F0F13)    ,
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
                      color: Colors.transparent,
                      border: Border.all(color: Colors.grey, width: 1),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(7.r),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 10.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 70.w,),
                RichText(text: TextSpan(children: [

                  TextSpan(
                    text: "Get-up ",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(
                    text: "challange",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Color(0xffFAD051),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                    ),

                  ),



                ])),

              ],
            ),
            SizedBox(height: 32.h),
            
            Container(
              padding: EdgeInsets.symmetric(vertical: 32,horizontal: 90),
              decoration:
              BoxDecoration(
                color: Color(0xff19191C),
                border: Border.all(
                  width: 1,
                  color: Colors.transparent
                ),
                borderRadius: BorderRadius.circular(14.r),

                
              ),child:Column(
              children: [
                Text("Shake",style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500
                ),),
                Image.asset('assets/icons/challange.png',width: 120.w,height: 90.h,),
                
                Text("Shake your phone 30 times to get up",style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Color.fromRGBO(255, 255, 255, 0.3),
                  fontWeight: FontWeight.w300,
                  fontSize: 12.sp
                ),)
              ],
            ),
            
            
            ),
            SizedBox(height: 12.h,),
            Text("Shape phone",style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Color.fromRGBO(255, 255, 255, 0.4),
              fontSize: 12.sp,
              fontWeight: FontWeight.w400
            ),),
            _buildSwitchRow("Get-up challenge", isAlarmSwitched),
            SizedBox(height: 12.h,),
            _buildInfoRow("Shake times", "30", ()=>shakeTime(context)),




          ],
        ),
      );
    },
  );

}
Widget _buildInfoRow(String text, String actionText, VoidCallback? onTap) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: Text(
          text,
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      Row(
        children: [
          Text(actionText, style: TextStyle(   color: Color.fromRGBO(255, 255, 255, 0.60),
            fontSize: 12.sp,
            fontWeight: FontWeight.w300,)),
          if (onTap != null) ...[
            SizedBox(width: 5.w),
            GestureDetector(
              onTap: onTap,
              child: Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Colors.white),
            ),
          ]
        ],
      ),
    ],
  );
}

Widget _buildSwitchRow(String label, ValueNotifier<bool> switchNotifier) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [

      Text(
        label,
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Colors.white,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
      ValueListenableBuilder<bool>(
        valueListenable: switchNotifier,
        builder: (context, value, child) {
          return SwitchButton(
            isSwitchOn: value,
            onChange: (bool newValue) {
              switchNotifier.value = newValue;
            },
          );
        },
      ),
    ],
  );
}