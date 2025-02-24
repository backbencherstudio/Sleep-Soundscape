// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
//
// import '../../../model_view/parent_screen_provider.dart';
//
// class CustomBottomBar extends StatelessWidget {
//   const CustomBottomBar({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(bottom: 15.h, left: 15.w, right: 15.w),
//       height: 72.h,
//       width: 320.w,
//       padding: EdgeInsets.symmetric(horizontal: 5.w),
//       decoration: BoxDecoration(
//         color: const Color(0xff0F1618),
//         borderRadius: BorderRadius.circular(16.r),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           _buildNavItem(
//             context,
//             index: 0,
//             icon: Icons.alarm,
//             label: "Alarm",
//           ),
//           _buildNavItem(
//             context,
//             index: 1,
//             icon: Icons.surround_sound_sharp,
//             label: "Sounds",
//           ),
//           _buildNavItem(
//             context,
//             index: 3,
//             icon: Icons.alarm_on_rounded,
//             label: "Audio Timer",
//           ),
//         ],
//       ),
//     );
//   }
//
//   /// Reusable method to build each bottom navigation item.
//   Widget _buildNavItem(BuildContext context,
//       {required int index, required IconData icon, required String label}) {
//     return Expanded(
//       child: GestureDetector(
//         onTap: () {
//           // Open corresponding bottom sheet based on index.
//           if (index == 0) {
//             showAlarmBottomSheet(context);
//           } else if (index == 1) {
//             showSoundBottomSheet(context);
//           } else if (index == 3) {
//             showAudioTimerBottomSheet(context);
//           }
//           // Update the provider with the selected index.
//           context.read<ParentScreensProvider>().onSelectedIndex(index);
//         },
//         child: Consumer<ParentScreensProvider>(
//           builder: (_, provider, child) {
//             bool isSelected = provider.selectedIndex == index;
//             return Container(
//               height: 56.h,
//               padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(16.r),
//                 // Optionally add a shadow if selected
//                 boxShadow: isSelected ? [] : [],
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(
//                     icon,
//                     color: const Color.fromRGBO(255, 255, 255, 0.60),
//                   ),
//                   SizedBox(height: 4.h),
//                   Text(
//                     label,
//                     style: TextStyle(
//                       fontSize: 12.sp,
//                       fontWeight: FontWeight.w500,
//                       color: const Color.fromRGBO(255, 255, 255, 0.60),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
