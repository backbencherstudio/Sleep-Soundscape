import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity, // Full width
        height: double.infinity, // Full height
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/home_screen_img.png",
            ), // Your image path
            fit: BoxFit.cover, // Covers the entire screen
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.r),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              ListTile(
                leading: ClipOval(
                  child: Image.asset("assets/images/user_1.png"),
                ), // Icon on the left
                title: Text(
                  "Hello Robart",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Color(0xffFFFFFF),
                    fontWeight: FontWeight.w300,
                    fontSize: 12.sp,
                  ),
                ),

                trailing: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff121221),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.grey, // Correct border definition
                      width: 1.0, // Optional, adjust width of border
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(9.r),
                    child: Image.asset(
                      "assets/icons/save.png",
                      height: 7.h,
                      width: 7.w,
                    ), // Your image
                  ),
                ),
              ),
              SizedBox(height: 140.h),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Wake up ",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Color(0xffFFFFFF),
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: "time",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Color(0xffFAD051),
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              TimePickerSpinner(
                is24HourMode: false, // AM/PM format
                normalTextStyle: TextStyle(fontSize: 30, color: Colors.white),
                highlightedTextStyle: TextStyle(
                  fontSize: 40,
                  color: Colors.yellow,
                ),
                spacing: 50, // Adjust the spacing
                itemHeight: 50,
                onTimeChange: (time) {
                  // setState(() {
                  //   _time = time;
                  // });
                },
              ),
              SizedBox(height: 131.h),
              Image.asset("assets/icons/start_img.png", width: 50, height: 50),
              SizedBox(height: 23.h),
              Text(
                "Start",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Color(0xffFFFFFF),
                  fontSize: 50.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
//
// class AlarmScreen extends StatefulWidget {
//   const AlarmScreen({super.key});
//
//   @override
//   State<AlarmScreen> createState() => _AlarmScreenState();
// }

// class _AlarmScreenState extends State<AlarmScreen> {
//   DateTime _time = DateTime.now(); // Initial time
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Set Alarm'),
//       ),
//       body: Center(
//         child: TimePickerSpinner(
//           is24HourMode: false, // AM/PM format
//           normalTextStyle: TextStyle(fontSize: 30, color: Colors.white),
//           highlightedTextStyle: TextStyle(fontSize: 40, color: Colors.yellow),
//           spacing: 50, // Adjust the spacing
//           itemHeight: 50,
//           onTimeChange: (time) {
//             setState(() {
//               _time = time;
//             });
//             print("Selected time: $_time");
//           },
//         ),
//       ),
//     );
//   }
// }
