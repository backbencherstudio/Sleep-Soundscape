import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sleep_soundscape/view/home_screen/screen/home_screen.dart';
import 'package:sleep_soundscape/view/settings_screens/settings_screen.dart';
import 'model_view/temp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final double deviceWidth = 1440.0;
  static const double deviceHeight = 1383.0;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeScreenProvider>(
          create: (_) => HomeScreenProvider(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: Size(deviceWidth, deviceHeight),
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

              '/': (context) => const SettingsScreen(),



            },
          );
        },
      ),
    );
  }
}
// echo "# sleep-soundscape" >> README.md
// git init
// git add README.md
// git commit -m "first commit"
// git branch -M main
// git remote add origin https://github.com/backbencherstudio/sleep-soundscape.git
// git push -u origin main
//
//
//
// git remote add origin https://github.com/backbencherstudio/sleep-soundscape.git
// git branch -M main
// git push -u origin main