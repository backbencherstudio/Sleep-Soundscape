import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sleep_soundscape/Utils/route_name.dart';
import 'package:sleep_soundscape/api_services/local_storage_services.dart';
import 'package:sleep_soundscape/model_view/login_auth_provider.dart';
import 'package:sleep_soundscape/model_view/onboarding_screen_provider.dart';
import 'package:sleep_soundscape/view/Login_Screen/Sign_in_Screen.dart';
import 'package:sleep_soundscape/view/home_screen/screen/home_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final loginAuthProvider = context.read<LoginAuthProvider>();
      final onboardingProvider = context.read<OnboardingScreenProvider>();

      // Ensure loginData is not null before accessing token.
      String? token;
      if (loginAuthProvider.loginData?.token != null) {
        token = await AuthStorageService.getToken(key: loginAuthProvider.loginData!.token!);
      }

      // Preload image for performance optimization.
      await precacheImage(const AssetImage('assets/images/onboarding_one.png'), context);

      debugPrint("\n\n\n get user-token: ${loginAuthProvider.loginData?.token}");

      // Wait 2 seconds before navigation (for splash delay).
      await Future.delayed(const Duration(seconds: 2));

      if (token != null && token.isNotEmpty) {
        // Token exists, navigate to HomeScreen.
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
        return; // Stop further execution.
      } else {
        // No token, navigate to SignInScreen.
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SignInScreen()),
        );
      }

      // Ensure onboardingProvider has completed loading before checking its value.
      if (onboardingProvider.isLoading) {
        await Future.doWhile(() async {
          await Future.delayed(const Duration(milliseconds: 100));
          return onboardingProvider.isLoading;
        });
      }

      // Navigate based on onboarding status.
      if (onboardingProvider.hasSeenOnboarding) {
        Navigator.pushReplacementNamed(context, RouteName.signUpScreen);
      } else {
        Navigator.pushReplacementNamed(context, RouteName.onboardingScreen);
      }
    });

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          FadeTransition(
            opacity: _animation,
            child: Image.asset(
              'assets/images/onboarding_one.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 380.h,
            left: 0,
            right: 0,
            child: Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Sleep\n",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 36.sp,
                      ),
                    ),
                    TextSpan(
                      text: "Soundscape",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: const Color(0xffFAD051),
                        fontWeight: FontWeight.w700,
                        fontSize: 36.sp,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
