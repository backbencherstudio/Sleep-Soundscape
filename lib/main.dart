import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sleep_soundscape/Utils/route_name.dart';
import 'package:sleep_soundscape/view/Banner/banner_Screen.dart';
import 'package:sleep_soundscape/view/Login_Screen/completeProfile_Screen.dart';
import 'package:sleep_soundscape/view/login_Screen/login_Screen.dart';
import 'package:sleep_soundscape/view/onboarding_screen/onboarding_screen.dart';
import 'package:sleep_soundscape/view/parent_screen/screen/parent_screen.dart';
import 'package:sleep_soundscape/view/splash_screen/splash_screen.dart';
import 'model_view/parent_screen_provider.dart';
import 'model_view/temp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

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
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            ),
            initialRoute: '/',
            routes: {
              '/': (context) => const BannerScreen(),
              // '/${RouteName.onboardingScreen}':
              //     (context) => const OnboardingScreen(),
              // '/': (context) => const SplashScreen(),
              // '/${RouteName.onboardingScreen}':
              //     (context) => const OnboardingScreen(),
              // '/${RouteName.parentScreens}': (context) => const ParentScreens(),
            },
          );
        },
      ),
    );
  }
}
