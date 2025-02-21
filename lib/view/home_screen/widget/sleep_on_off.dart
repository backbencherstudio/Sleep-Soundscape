// import 'package:flutter/material.dart';
//
// class BottomSheetWidget {
//   static void show({
//     required BuildContext context,
//     String title = "Enter Your Credentials",
//     required Widget content,
//   }) {
//     showModalBottomSheet(
//       context: context,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (BuildContext context) {
//         return Padding(
//           padding: EdgeInsets.all(16),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(
//                 title,
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 10),
//               content, // Dynamic content passed from the caller
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
