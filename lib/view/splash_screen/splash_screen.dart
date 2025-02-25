import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sleep_soundscape/Utils/route_name.dart';
import 'package:sleep_soundscape/model_view/onboarding_screen_provider.dart';
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
      await precacheImage(const AssetImage('assets/images/onboarding_one.png'), context);
      await Future.delayed(const Duration(seconds: 2));

      final onboardingProvider = Provider.of<OnboardingScreenProvider>(context, listen: false);
      // Wait if provider is still loading.
      if (onboardingProvider.isLoading) {
        await Future.doWhile(() async {
          await Future.delayed(const Duration(milliseconds: 100));
          return onboardingProvider.isLoading;
        });
      }

      if (onboardingProvider.hasSeenOnboarding) {
        // Onboarding completed before; navigate to SignUp (or Home) screen.
        Navigator.pushReplacementNamed(context, RouteName.signUpScreen);
      } else {
        // First time launch; navigate to Onboarding screen.
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
