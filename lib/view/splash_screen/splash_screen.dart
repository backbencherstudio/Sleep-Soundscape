import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sleep_soundscape/Utils/route_name.dart';

import '../home_screen/screen/home_screen.dart';
import '../onboarding_screen/onboarding_screen.dart';

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
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();

    /// **Fix: Defer the context-dependent code using `addPostFrameCallback`**
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      precacheImage(AssetImage('assets/images/onboarding_one.png'), context);

      // Navigate to next screen after 3 seconds
      await Future.delayed(const Duration(seconds: 3), () {
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => OnboardingScreen()),
          );
          Navigator.pushReplacementNamed(context, RouteName.onboardingScreen);
        }
      });
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
              fit: BoxFit.cover, // Ensures full-screen display
            ),
          ),
          Positioned(
            top: 380,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Sleep\n",
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Color(0xffFFFFFF),
                            fontWeight: FontWeight.w700,
                            fontSize: 36.sp,
                          ),
                        ),
                        TextSpan(
                          text: "Soundscape",
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Color(0xffFAD051),
                            fontWeight: FontWeight.w700,
                            fontSize: 36.sp,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
