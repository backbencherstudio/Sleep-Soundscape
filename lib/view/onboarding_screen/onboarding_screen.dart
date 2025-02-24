import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sleep_soundscape/Utils/route_name.dart';
import 'package:sleep_soundscape/view/parent_screen/screen/parent_screen.dart';
import '../../global_widget/custom_button.dart';
import '../home_screen/screen/home_screen.dart'; // Import Home Screen

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      precacheImage(AssetImage('assets/images/home_screen_img.png'), context);

    });
  }
  final List<Map<String, dynamic>> onboardingData = [
    {
      "image": "assets/images/onboarding_one.png",
      "title1": "Embark on a",
      "title2": "Serene Journey",
      "title3": "to Dreamland",
    },
    {
      "image": "assets/images/onboarding_two.png",
      "title1": "Discover Tranquil",
      "title2": "Tunes for Restful",
      "title3": "Nights",
    },
    {
      "image": "assets/images/onboarding_three.png",
      "title1": "Sleep Soundscape",
      "title2": "Your Peaceful",
      "title3": "Slumber Guide",
    },
  ];

  void _nextPage() {
    if (_currentPage < onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushNamedAndRemoveUntil(context, RouteName.signUpScreen, (_)=>false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: onboardingData.length,
            itemBuilder: (context, index) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    onboardingData[index]["image"],
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 100.h,
                    left: 23.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "${onboardingData[index]["title1"]} \n",
                                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 40.sp,
                                ),
                              ),
                              TextSpan(
                                text: "${onboardingData[index]["title2"]}\n",
                                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: const Color(0xffFAD051),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 40.sp,
                                ),
                              ),
                              TextSpan(
                                text: onboardingData[index]["title3"],
                                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 40.sp,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 20.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            onboardingData.length,
                                (index) => AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              width: _currentPage == index ? 45.w : 9.w,
                              height: 9.h,
                              decoration: BoxDecoration(

                                color: _currentPage == index
                                    ? const Color(0xffFAD051)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(4.5),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: CustomButton(
                            text: _currentPage == onboardingData.length - 1
                                ? 'Get Started'
                                : 'Next',
                            onPressed: _nextPage,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),

          // Page Indicator (Dots)

        ],
      ),
    );
  }
}
