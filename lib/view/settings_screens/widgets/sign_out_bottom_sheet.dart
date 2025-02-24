// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:sleep_soundscape/global_widget/custom_button.dart';
// void signOutBottomSheet(BuildContext context) {
//   showModalBottomSheet(
//     context: context,
//     backgroundColor: Colors.transparent,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
//     ),
//     builder: (BuildContext context) {
//       return Container(
//         height: MediaQuery.of(context).size.height*0.5,
//         decoration: BoxDecoration(
//           color: Color(0xff0F0F13),
//           borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
//         ),
//         padding: EdgeInsets.all(16.w),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Center(
//               child: RichText(
//                 text: TextSpan(
//                   children: [
//                     TextSpan(
//                       text: "Ready to  ",
//                       style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                         color: Colors.white,
//                         fontSize: 20.sp,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     TextSpan(
//                       text: "Sleep?",
//                       style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                         color: Color(0xffFAD051),
//                         fontSize: 20.sp,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 12.h),
//
//             // Preferred Earphones
//         Align(
//           alignment: Alignment.center,
//           child: Image.asset("assets/images/question_mark.png"),
//         ),
//             SizedBox(height: 40.h),
//
//             Align(
//                 alignment: Alignment.center,
//                 child: CustomButton(text: "Set Timer", onPressed: (){})),
//             SizedBox(height: 6.h),
//
//           ],
//         ),
//       );
//     },
//   );
// }
