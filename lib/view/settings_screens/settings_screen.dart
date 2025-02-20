import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000000),
      body: Center(
        child: IconButton(
          onPressed: (){
            settingModalSheet(context);
          },
          icon: Icon(Icons.menu,size: 50,),
        ),
      ),
    );
  }
}


void settingModalSheet(BuildContext context){
  showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10,),
      )
    ),
      context: context,
      isScrollControlled: true,
      backgroundColor: Color(0xFF0F0F13),
      builder: (contex) {
        return SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.9,
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                SizedBox(height: 8.h,),

                SizedBox(
                    width: 115,
                    child: Divider(thickness: 6)),
                SizedBox(height: 16.h,),
                AppBar(
                  backgroundColor: Color(0xFF0F0F13) ,
                  leading: Container(
                    padding: EdgeInsets.all(7.r),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(255, 255, 255, 0.02),
                      border: Border.all(color: Color.fromRGBO(255, 255, 255, 0.08))
                    ),
                    child: Icon(Icons.arrow_back_ios,color: Colors.white,size: 18,),
                  ),
                )
              ],
            ),
          ),
        );
      }
  );
}
