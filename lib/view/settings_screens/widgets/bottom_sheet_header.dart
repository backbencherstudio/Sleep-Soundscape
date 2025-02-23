import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomSheetHeader extends StatelessWidget {
  const BottomSheetHeader({
    super.key, required this.imagePath, required this.title,
  });

  final String imagePath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF0F0F13) ,
      leadingWidth: 32.w,
      leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child:  ImageIcon(AssetImage(imagePath),size: 32.r,color: Colors.white,)),   //Image.asset("assets/icons/back.png",width: 32.w,height: 32.h,fit: BoxFit.contain,)),
      centerTitle: true,
      title: Text(title,),
      titleTextStyle: TextStyle(
          fontFamily: "Lexend",
          fontSize: 20.sp,
          fontWeight: FontWeight.w500
      ),
    );
  }
}
