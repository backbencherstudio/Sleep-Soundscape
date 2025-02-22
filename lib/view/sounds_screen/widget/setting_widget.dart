// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// void  _bottomSheetSetting(context){
//
//   showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(top: Radius.circular(30))
//       ),
//       builder: (BuildContext context){
//         return Container(
//           padding: EdgeInsets.symmetric(horizontal: 20),
//           height: MediaQuery.of(context).size.height*0.96,
//           decoration: BoxDecoration(
//             color: Color(0xff0F0F13),
//
//           ),child: Column(
//           children: [
//             SizedBox(height:24.h ,),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//
//                   decoration: BoxDecoration(
//                       color: Colors.transparent,
//                       border: Border.all(
//                         color: Colors.grey,
//                         width:1,
//                       ),
//                       shape: BoxShape.circle
//                   ),child: Padding(
//                   padding:  EdgeInsets.all(7.r),
//                   child: Icon(Icons.arrow_back_ios,color: Colors.white,size: 10.sp,),
//                 ),
//                 ),
//                 RichText(text: TextSpan(
//                     children: [
//                       TextSpan(
//                           text: "Sleep ",
//                           style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                               color: Colors.white,
//                               fontSize: 20.sp,
//                               fontWeight: FontWeight.w500
//
//                           )
//                       ),
//                       TextSpan(
//                           text: "Setting",
//                           style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                               color: Color(0xffFAD051),
//                               fontWeight: FontWeight.w500,
//                               fontSize: 20.sp
//                           )
//                       )
//                     ]
//                 )),
//                 Text("Done",style: Theme.of(context).textTheme?.bodyMedium?.copyWith(
//                     color: Colors.red,
//                     fontSize: 14.sp,
//                     fontWeight: FontWeight.w400
//                 ),)
//               ],),
//             SizedBox(height: 35.h,),
//             Align(
//               alignment: Alignment.topLeft,
//               child: Text(
//                 "Alarm",
//                 textAlign: TextAlign.left,
//                 style: Theme.of(context).textTheme.bodySmall?.copyWith(
//                   color: Color.fromRGBO(255, 255, 255, 0.30),
//                   fontWeight: FontWeight.w400,
//                   fontSize: 12.sp,
//                 ),
//               ),
//             ),
//
//             SizedBox(height: 18.h,),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(textAlign: TextAlign.left,"Alarm",style: Theme.of(context).textTheme.bodySmall?.copyWith(
//                     color: Colors.white,
//                     fontSize: 14.sp,
//                     fontWeight: FontWeight.w400
//                 ),),
//                 SwitchButton( isSwitchOn: isSwitched,
//                   onChange: (bool value) {
//                     setState(() {
//                       isSwitched = value;
//                     });
//                   },
//                 ),
//               ],
//             ),
//             Divider(),
//             SizedBox(height: 18.h,),
//             Align(
//               alignment: Alignment.topLeft,
//               child: Text(textAlign: TextAlign.left,"Sleep Analysis",style: Theme.of(context).textTheme.bodySmall?.copyWith(
//                   color: Color.fromRGBO(255, 255, 255, 0.30),
//                   fontWeight: FontWeight.w400,
//                   fontSize: 12.sp
//               ),),
//             ),
//             SizedBox(height: 18.h,),
//
//             Align(
//               alignment: Alignment.topLeft,
//
//               child: Text(textAlign: TextAlign.left,"Sounds Detection",style: Theme.of(context).textTheme.bodySmall?.copyWith(
//                   color: Colors.white,
//                   fontWeight: FontWeight.w400,
//                   fontSize: 14.sp
//               ),),
//             ),
//
//             SizedBox(height: 4.h,),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween, // Ensures proper spacing
//               children: [
//                 Expanded( // Prevents overflow
//                   child: Text(
//                     "To keep running in low battery, Sleep will stop detection when the battery is below 20% and finish analysis when the battery is below 10%.",
//                     maxLines: 5,
//
//                     overflow: TextOverflow.ellipsis, // Prevents layout overflow
//                     style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.sp,color: Color.fromRGBO(255, 255, 255, 0.60)), // Optional styling
//                   ),
//                 ),
//                 Row( // Replaces OverflowBar for better layout control
//                   children: [
//                     Text("On", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
//                     Icon(Icons.arrow_forward_ios_rounded, size: 16,color: Colors.white,),
//                   ],
//                 ),
//               ],
//             ),
//             Divider(),
//             Align(
//               alignment: Alignment.topLeft,
//               child: Text(
//                 "Soundscapes",
//                 textAlign: TextAlign.left,
//                 style: Theme.of(context).textTheme.bodySmall?.copyWith(
//                   color: Color.fromRGBO(255, 255, 255, 0.30),
//                   fontWeight: FontWeight.w400,
//                   fontSize: 12.sp,
//                 ),
//               ),
//             ),
//
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween, // Ensures proper spacing
//               children: [
//                 Expanded( // Prevents overflow
//                   child: Text(
//                     "Soundscapes",
//                     maxLines: 5,
//
//                     overflow: TextOverflow.ellipsis, // Prevents layout overflow
//                     style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.sp,color: Color.fromRGBO(255, 255, 255, 0.60)), // Optional styling
//                   ),
//                 ),
//                 Row( // Replaces OverflowBar for better layout control
//                   children: [
//                     Text("Calm Light", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
//                     Icon(Icons.arrow_forward_ios_rounded, size: 16,color: Colors.white,),
//                   ],
//                 ),
//
//               ],
//             ),
//             SizedBox(height: 35.h,),
//             Align(
//               alignment: Alignment.topLeft,
//               child: Text(
//                 "Alarm",
//                 textAlign: TextAlign.left,
//                 style: Theme.of(context).textTheme.bodySmall?.copyWith(
//                   color: Color.fromRGBO(255, 255, 255, 0.30),
//                   fontWeight: FontWeight.w400,
//                   fontSize: 12.sp,
//                 ),
//               ),
//             ),
//
//             SizedBox(height: 18.h,),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(textAlign: TextAlign.left,"Alarm",style: Theme.of(context).textTheme.bodySmall?.copyWith(
//                     color: Colors.white,
//                     fontSize: 14.sp,
//                     fontWeight: FontWeight.w400
//                 ),),
//                 SwitchButton( isSwitchOn: isSwitched,
//                   onChange: (bool value) {
//                     setState(() {
//                       isSwitched = value;
//                     });
//                   },
//                 ),
//               ],
//             ),
//             SizedBox(height: 20,),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween, // Ensures proper spacing
//               children: [
//                 Expanded( // Prevents overflow
//                   child: Text(
//                     "Audio timer",
//                     maxLines: 5,
//
//                     overflow: TextOverflow.ellipsis, // Prevents layout overflow
//                     style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.sp,color: Color.fromRGBO(255, 255, 255, 0.60)), // Optional styling
//                   ),
//                 ),
//                 Row( // Replaces OverflowBar for better layout control
//                   children: [
//                     Text("5 min", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
//                     Icon(Icons.arrow_forward_ios_rounded, size: 16,color: Colors.white,),
//                   ],
//                 ),
//
//               ],
//             ),
//
//           ],
//         ),
//
//         );
//
//       });
// }
