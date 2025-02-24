import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sleep_soundscape/Utils/route_name.dart';
import 'package:sleep_soundscape/model_view/sound_screen_provider.dart';
import 'package:sleep_soundscape/view/Login_Screen/Sign_in_Screen.dart';
import 'package:sleep_soundscape/view/Login_Screen/forgotPassword_Screen.dart';
import 'package:sleep_soundscape/view/Login_Screen/login_Screen.dart';
import 'package:sleep_soundscape/view/home_screen/screen/home_screen.dart';
import 'package:sleep_soundscape/view/settings_screens/profile_screen.dart';
import 'package:sleep_soundscape/view/settings_screens/settings_screen.dart';
import 'package:sleep_soundscape/view/settings_screens/widgets/about_screen.dart';
import 'package:sleep_soundscape/view/splash_screen/splash_screen.dart';
import 'model_view/parent_screen_provider.dart';
import 'model_view/reminder_screen_provider.dart';
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

        ChangeNotifierProvider<ReminderScreenProvider>(
          create: (_) => ReminderScreenProvider(),
        ),

        ChangeNotifierProvider<SoundScreenProvider>(
          create: (_) => SoundScreenProvider(),
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
                  color: Colors.white,
                ),

                headlineSmall: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
                bodyLarge: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                bodyMedium: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
                bodySmall:           TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w400,
                color: Colors.white,
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

              '/': (context) => const SplashScreen(),

              RouteName.profileScreen: (context) => ProfileScreen(),
              RouteName.aboutScreen: (context) => AboutScreen(),

              RouteName.signUpScreen: (context) => LoginScreen(),
              RouteName.signInScreen: (context) => SignInScreen(),
              RouteName.forgotPassword: (context) => ForgotpasswordScreen(),
              RouteName.homeScreen: (context) => HomeScreen(),
              //add prpose

            },
          );
        },
      ),
    );
  }
}
