import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sleep_soundscape/Utils/route_name.dart';
import 'package:sleep_soundscape/global_widget/custom_button.dart';
import 'package:sleep_soundscape/view/settings_screens/widgets/settings_item_tile.dart';

import 'bottom_sheet_header.dart';

void EditProfileBottomSheet(BuildContext context){

  // File? _image;
  // final ImagePicker _picker = ImagePicker();
  //
  // Future<void> _pickImage() async {
  //   final XFile? pickedFile =
  //   await _picker.pickImage(source: ImageSource.gallery);
  //
  //   if (pickedFile != null) {
  //     setState(() {
  //       _image = File(pickedFile.path);
  //     });
  //   }
  // }


  showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.w),
            topRight: Radius.circular(10.w),
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
                SizedBox(height: 6.h,),

                Container(
                  width: 115.w,
                  height: 6.h,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 0.10),
                      borderRadius: BorderRadius.circular(100.r)
                  ),
                ),
                SizedBox(height: 12.h,),
                BottomSheetHeader(imagePath:  "assets/icons/cancel.png",title:  "Account",),
                SizedBox(height: 32.h,),
                Stack(
                  children: [
                    Container(
                      width: 84.w,
                      height: 84.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage("assets/images/lady.png",),
                          fit: BoxFit.cover,
                          onError: (_, __) {
                            AssetImage("assets/icons/profile.png");
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: Image.asset("assets/icons/camera.png",width: 24.w,height: 24.h,fit: BoxFit.contain,),
                    )
                  ],
                ),
                SizedBox(height: 12.h,),
                Text("Choose your image",style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                  fontFamily: "Lexend"
                ),),
                SizedBox(height: 32.h,),
                infoTile(context:  context,title: "Name", value: "Salman"),
                SizedBox(height: 12.h,),
                infoTile(context:  context,title: "Gender", value: "Male"),
                SizedBox(height: 12.h,),
                infoTile(context:  context,title: "Birthday", value: "10 Sep 2023"),




              ],
            ),
          ),
        );
      }
  );
}

Container infoTile({required BuildContext context, required String title, required String value}) {
  return Container(
                width: double.infinity,
                height: 56.h,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 0.04),
                  borderRadius: BorderRadius.circular(14.r),
                  border: Border.all(color: Color.fromRGBO(255, 255, 255, 0.08),)
                ),
                child: Row(
                  children: [
                    Text(title,style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.white,
                        fontFamily: "Lexend"
                    ),),
                    Spacer(),
                    Text(value,style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.white,
                        fontFamily: "Lexend"
                    ),),

                  ]
                  ,
                ),
              );
}

