import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sleep_soundscape/view/Banner/widget/glassBox.dart';
import 'package:sleep_soundscape/view/Login_Screen/widget/myButton.dart';

class BannerScreen extends StatelessWidget {
  const BannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();

    List<Map<String, dynamic>> condition = [
      {
        "title": "Now ",
        "icon": " ",
        "discription":
            "Get instant access and see how it can change your life.",
      },
      {
        "title": "Day 5",
        "icon": " ",
        "discription":
            "We'll remind you with an email or notification that your trial is ending.",
      },
      {
        "title": "Day 7 ⭐",
        "icon": " ",
        "discription":
            "Get instant access and see how it can change your life.",
      },
      {
        "title": "Day 10",
        "icon": " ",
        "discription":
            "Get instant access and see how it can change your life.",
      },
    ];

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/icons/bgdark.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: Image.asset("assets/icons/cross.png"),
                        ),
                      ),
                    ),
                    Image.asset(
                      "assets/icons/Wrap.png",
                      height: 147.h,
                      width: 137.w,
                    ),
                    SizedBox(height: 32.h),
                    Glassbox(
                      title: "\$ 68.99 / Yearly",
                      discription: "7days free trial",
                      coup: "50% off",
                    ),
                    SizedBox(height: 12.h),
                    Glassbox(
                      title: "\$ 3.99 / Monthly",
                      discription: "7days free trial",
                    ),
                    SizedBox(height: 12.h),
                    Mybutton(
                      text: "Sign up",
                      color: Color(0xFFFAD051),
                      ontap: () {},
                    ),
                    SizedBox(height: 20.h),

                    Container(
                      height: 200.h,
                      child: ScrollbarTheme(
                        data: ScrollbarThemeData(
                          thumbColor: MaterialStateProperty.all(
                            Colors.yellow,
                          ), // Change scrollbar color
                          thickness: MaterialStateProperty.all(
                            6,
                          ), // Thickness of scrollbar
                          radius: Radius.circular(
                            10,
                          ), // Rounded corners for scrollbar
                        ),
                        child: Scrollbar(
                          controller: scrollController,
                          thumbVisibility: true,
                          trackVisibility: true,
                          thickness: 1,
                          scrollbarOrientation:
                              ScrollbarOrientation
                                  .left, // Move scrollbar to left
                          child: ListView.builder(
                            controller: scrollController,
                            itemCount: condition.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: 15),
                                child: ListTile(
                                  title: Text(
                                    condition[index]["title"],
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodySmall?.copyWith(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFFFAD051),
                                    ),
                                  ),
                                  subtitle: Text(
                                    condition[index]["discription"],
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodySmall?.copyWith(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w300,
                                      color: Color(0xFFFFFFFF).withOpacity(0.8),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 32.h),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
