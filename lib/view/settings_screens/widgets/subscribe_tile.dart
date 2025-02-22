import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubscribeTile extends StatelessWidget {
  const SubscribeTile({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 77.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(255, 255, 255, 0.04),
            Color.fromRGBO(255, 191, 0, 0.04),
          ], // Gold fading effect
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(16.r), // Rounded corners
      ),
      child: ListTile(
        minTileHeight: 77.h,
        tileColor: Colors.transparent,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Sleep\n",
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge!.copyWith(
                      fontFamily: "Lexend",
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                  TextSpan(
                    text: "Soundscape",
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge!.copyWith(
                      fontFamily: "Lexend",
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFFAD051),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 6.h),
            Text(
              "7 days free trial for new",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontFamily: "Lexend",
                fontWeight: FontWeight.w300,
                color: Color.fromRGBO(255, 255, 255, 0.6),
              ),
            ),
          ],
        ),
        trailing: GestureDetector(
          onTap: (){},
          child: Container(
            width: 84.w,
            height: 25.h,
            decoration: BoxDecoration(
              color: Color(0xFFFAD051),
              borderRadius: BorderRadius.circular(7.5.r),
            ),
            child: Center(
              child: Text(
                "Subscribe",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontFamily: "Lexend",
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF000000),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
