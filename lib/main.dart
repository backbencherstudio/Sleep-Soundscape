import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sleep_soundscape/Utils/route_name.dart';
import 'package:sleep_soundscape/view/Feedback_Screen/feedback_Screen.dart';
import 'package:sleep_soundscape/view/settings_screens/profile_screen.dart';
import 'package:sleep_soundscape/view/settings_screens/settings_screen.dart';
import 'model_view/parent_screen_provider.dart';
import 'model_view/temp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // final double deviceWidth = 1440.0;
  // static const double deviceHeight = 1383.0;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeScreenProvider>(
          create: (_) => HomeScreenProvider(),
        ),
        ChangeNotifierProvider<ParentScreensProvider>(
          create: (_) => ParentScreensProvider(),
        ),
      ],
      child: ScreenUtilInit(
        //  designSize: Size(deviceWidth, deviceHeight),
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Counter App',
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              textTheme: TextTheme(
                headlineLarge: TextStyle(
                  fontSize: 48.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                headlineMedium: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                bodyLarge: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                bodyMedium: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              inputDecorationTheme: InputDecorationTheme(
                filled: true,
                fillColor: Color.fromRGBO(255, 255, 255, 0.04),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.r),
                  borderSide: BorderSide(
                    color: Color.fromRGBO(255, 255, 255, 0.08),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.r),
                  borderSide: BorderSide(
                    color: Color.fromRGBO(255, 255, 255, 0.08),
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.r),
                  borderSide: BorderSide(color: Color(0xFFF45757)),
                ),
              ),
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            ),
            initialRoute: '/',
            routes: {
              '/': (context) => FeedbackScreen(),
              RouteName.profileScreen: (context) => ProfileScreen(),
            },
          );
        },
      ),
    );
  }
}
