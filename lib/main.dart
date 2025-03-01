import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sleep_soundscape/Utils/route_name.dart';
import 'package:sleep_soundscape/model_view/ForgetPass_provider.dart';
import 'package:sleep_soundscape/model_view/login_auth_provider.dart';
import 'package:sleep_soundscape/model_view/notification_provider.dart';
import 'package:sleep_soundscape/model_view/onboarding_screen_provider.dart';
import 'package:sleep_soundscape/model_view/profile_screen_provider.dart';
import 'package:sleep_soundscape/model_view/sound_screen_provider.dart';
import 'package:sleep_soundscape/model_view/theme_provider.dart';
import 'package:sleep_soundscape/notification_services/notification_services.dart';
import 'package:sleep_soundscape/view/Download_Screen/test_Screen.dart';
import 'package:sleep_soundscape/view/Login_Screen/signIN_Screen.dart';
import 'package:sleep_soundscape/view/Login_Screen/completeProfile_Screen.dart';
import 'package:sleep_soundscape/view/Login_Screen/ForgetPass_Screnn/forgotPassword_Screen.dart';
import 'package:sleep_soundscape/view/Login_Screen/signUp_Screen.dart';
import 'package:sleep_soundscape/view/goal_Screen/goal_Screen.dart';
import 'package:sleep_soundscape/view/home_screen/screen/home_screen.dart';
import 'package:sleep_soundscape/view/onboarding_screen/onboarding_screen.dart';
import 'package:sleep_soundscape/view/settings_screens/personalization_screen.dart';
import 'package:sleep_soundscape/view/settings_screens/profile_screen.dart';
import 'package:sleep_soundscape/view/splash_screen/splash_screen.dart';
import 'package:timezone/data/latest.dart';
import 'model_view/localizaiton_provider.dart';
import 'model_view/parent_screen_provider.dart';
import 'model_view/reminder_screen_provider.dart';
import 'model_view/sign-up_provider.dart';
import 'model_view/sound_setting_provider.dart';
import 'model_view/temp.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await AndroidAlarmManager.initialize();
  initializeTimeZones();
  await initializeService();

  final prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("token");
  await Hive.initFlutter();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    AndroidAlarmManager.initialize();
    _askNecessaryPermission();
  }

  void _askNecessaryPermission() async {
    PermissionStatus notificationPermission =
        await Permission.notification.request();
    PermissionStatus others = await Permission.calendarFullAccess.request();
    await Permission.scheduleExactAlarm.request();
    await Permission.reminders.request();
    await Permission.accessMediaLocation.request();
    await Permission.audio.request();
    await Permission.ignoreBatteryOptimizations.request();
    await Permission.manageExternalStorage.request();
    await Permission.mediaLibrary.request();
    await Permission.storage.request();
    if (notificationPermission.isGranted) {
      debugPrint("\nNotification permission granted\n");
    } else if (notificationPermission.isDenied) {
      debugPrint("\nNotification permission denied\n");
    } else if (notificationPermission.isPermanentlyDenied) {
      debugPrint(
        "\nNotification permission permanently denied. Please enable it from settings.\n",
      );
      openAppSettings(); // Open app settings if permission is permanently denied
    }
  }

  // final double deviceWidth = 1440.0;
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
        ChangeNotifierProvider<ProfileScreenProvider>(
          create: (_) => ProfileScreenProvider(),
        ),
        ChangeNotifierProvider<NotificationProvider>(
          create: (_) => NotificationProvider(),
        ),
        ChangeNotifierProvider<OnboardingScreenProvider>(
          create: (_) => OnboardingScreenProvider(),
        ),

        ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
        ChangeNotifierProvider<LoginAuthProvider>(
          create: (_) => LoginAuthProvider(),
        ),
        ChangeNotifierProvider<ForgetPassProvider>(
          create: (_) => ForgetPassProvider(),
        ),
        ChangeNotifierProvider<SignUpProvider>(create: (_) => SignUpProvider()),

        ChangeNotifierProvider<ForgetPassProvider>(
          create: (_) => ForgetPassProvider(),
        ),
        ChangeNotifierProvider<SoundSettingProvider>(
          create: (_) => SoundSettingProvider(),
        ),
        ChangeNotifierProvider<LocalizationProvider>(
          create:
              (_) => LocalizationProvider(),
        ),
      ],
      child: ScreenUtilInit(
        //  designSize: Size(deviceWidth, deviceHeight),
        minTextAdapt: true,
        builder: (context, child) {
          final themeProvider = context.watch<ThemeProvider>();
          final localizationProvider = Provider.of<LocalizationProvider>(
            context,
          );

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Sleep Soundscape App',
            locale: localizationProvider.locale,
            supportedLocales: const [
              Locale('en'),
              Locale('es'),
            ],
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],

            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,

              appBarTheme: AppBarTheme(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                actionsIconTheme: IconThemeData(
                  color: Colors.white.withOpacity(0.6),
                ),
              ),

              ///light mode bottom sheet theme
              bottomSheetTheme: BottomSheetThemeData(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20.r),
                  ),
                ),
              ),

              ///light-mode text theme
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

                headlineSmall: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
                bodyLarge: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                bodyMedium: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                bodySmall: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              inputDecorationTheme: InputDecorationTheme(
                ///light-fill color of TextFormField
                filled: true,
                fillColor: Colors.black.withOpacity(0.04),

                ///light-mode label style
                labelStyle: TextStyle(color: Colors.black.withOpacity(0.6)),

                ///light-mode hint style
                hintStyle: TextStyle(color: Colors.black.withOpacity(0.6)),

                ///light-enabledBorder color of TextFormField
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.r),
                  borderSide: BorderSide(color: Colors.black.withOpacity(0.08)),
                ),

                ///light-disabledBorder color of TextFormField
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.r),
                  borderSide: BorderSide(color: Colors.black.withOpacity(0.08)),
                ),

                ///dark-focusedBorder color of TextFormField
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.r),
                  borderSide: BorderSide(color: Color(0xffFAD051)),
                ),

                ///dark-errorBorder color of TextFormField
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.r),
                  borderSide: BorderSide(color: Colors.red),
                ),

                prefixIconColor: Colors.black.withOpacity(0.6),
                suffixIconColor: Colors.black.withOpacity(0.6),
              ),

              ///colorScheme for dak mode theme
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.blue,
                primary: Color(0xffFAD051),
                onPrimary: Colors.black,
                secondary: Colors.black.withOpacity(0.04),
                onSecondary: Colors.black.withOpacity(0.6),
                onTertiary: Colors.black,
              ),
            ),
            themeMode: themeProvider.themeMode,
            darkTheme: ThemeData(
              scaffoldBackgroundColor: Colors.black,

              appBarTheme: AppBarTheme(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                actionsIconTheme: IconThemeData(
                  color: Colors.black.withOpacity(0.6),
                ),
              ),

              ///dark mode bottom sheet theme
              bottomSheetTheme: BottomSheetThemeData(
                backgroundColor: Color(0xff0F0F13),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20.r),
                  ),
                ),
              ),

              ///dark-mode text theme
              textTheme: TextTheme(
                headlineLarge: TextStyle(
                  fontSize: 48.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
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
                bodySmall: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              inputDecorationTheme: InputDecorationTheme(
                ///dark-fill color of TextFormField
                filled: true,
                fillColor: Colors.white.withOpacity(0.04),

                ///light-mode label style
                labelStyle: TextStyle(color: Colors.white.withOpacity(0.6)),

                ///light-mode hint style
                hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),

                ///dark-enabledBorder color of TextFormField
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.r),
                  borderSide: BorderSide(color: Colors.white.withOpacity(0.04)),
                ),

                ///dark-disabledBorder color of TextFormField
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.r),
                  borderSide: BorderSide(color: Colors.white.withOpacity(0.08)),
                ),

                ///dark-focusedBorder color of TextFormField
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.r),
                  borderSide: BorderSide(color: Color(0xffFAD051)),
                ),

                ///dark-errorBorder color of TextFormField
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.r),
                  borderSide: BorderSide(color: Colors.red),
                ),

                prefixIconColor: Colors.white.withOpacity(0.6),
                suffixIconColor: Colors.white.withOpacity(0.6),
              ),

              ///colorScheme for dak mode theme
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.blue,
                primary: Color(0xffFAD051),
                onPrimary: Colors.black,
                secondary: Colors.white.withOpacity(0.04),
                onSecondary: Colors.white.withOpacity(0.6),
                onTertiary: Colors.white,
              ),
            ),
            initialRoute: '/',
            routes: {
              '/': (context) => const SplashScreen(),
              RouteName.onboardingScreen: (context) => const OnboardingScreen(),
              RouteName.completeProfileScreen:
                  (context) => CompleteprofileScreen(),
              RouteName.profileScreen: (context) => ProfileScreen(),
              //  RouteName.aboutScreen: (context) => AboutScreen(),
              RouteName.signUpScreen: (context) => SignupScreen(),
              RouteName.signInScreen: (context) => SignInScreen(),
              RouteName.forgotPassword: (context) => ForgotpasswordScreen(),
              RouteName.homeScreen: (context) => HomeScreen(),
              RouteName.personalizationScreen:
                  (context) => PersonalizationScreen(),
              RouteName.goalScreen: (context) => GoalScreen(),

              //add prpose
            },
          );
        },
      ),
    );
  }
}
