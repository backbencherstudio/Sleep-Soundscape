import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sleep_soundscape/global_widget/custom_button.dart';
import 'package:sleep_soundscape/model_view/login_auth_provider.dart';
import 'package:sleep_soundscape/model_view/theme_provider.dart';
import '../../../model_view/edit_profile_screen_provider.dart';
import 'bottom_sheet_header.dart';

void EditProfileBottomSheet(BuildContext context) {
  final editProfileProvider = Provider.of<EditProfileProvider>(context, listen: false);
  final loginData = context.read<LoginAuthProvider>().loginData;

  showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10.w),
        topRight: Radius.circular(10.w),
      ),
    ),
    context: context,
    isScrollControlled: true,
    builder: (contex) {
      final darkTheme = context.watch<ThemeProvider>().isDarkMode;

      return SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.9,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(height: 6.h),
              Container(
                width: 115.w,
                height: 6.h,
                decoration: BoxDecoration(
                  color: darkTheme
                      ? Color.fromRGBO(255, 255, 255, 0.10)
                      : Color.fromRGBO(0, 0, 0, 0.10),
                  borderRadius: BorderRadius.circular(100.r),
                ),
              ),
              SizedBox(height: 12.h),
              BottomSheetHeader(
                imagePath: "assets/icons/cancel.png",
                title: "Account",
              ),
              SizedBox(height: 32.h),
              Stack(
                children: [
                  GestureDetector(
                    onTap: () async {
                      final pickedFile = await ImagePicker().pickImage(
                        source: ImageSource.gallery,
                      );
                      if (pickedFile != null) {
                        editProfileProvider.setImage(File(pickedFile.path));
                      }
                    },
                    child: CircleAvatar(
                      radius: 40.r,
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      backgroundImage: editProfileProvider.selectedImage != null
                          ? FileImage(editProfileProvider.selectedImage!)
                          : null,
                      child: editProfileProvider.selectedImage == null
                          ? Icon(
                        Icons.person_outline,
                        size: 32.r,
                        color: Colors.white,
                      )
                          : null,
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: Container(
                      width: 24.w,
                      height: 24.h,
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.camera_alt_outlined,
                        size: 16.r,
                        color: Colors.black45,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Text(
                "Choose your image",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontFamily: "Lexend",
                ),
              ),
              SizedBox(height: 32.h),
              // Name TextField for editing name
              TextField(
                controller: TextEditingController(text: loginData?.user?.name),
                onChanged: (newName) {
                  editProfileProvider.setName(newName);
                },
                decoration: InputDecoration(
                  labelText: "Enter your name",
                  hintText: loginData?.user?.name ?? 'N/A',
                ),
              ),
              SizedBox(height: 32.h),
              CustomButton(
                text: "Save",
                onPressed: () async {
                  bool success = await editProfileProvider.editProfile(
                    name: editProfileProvider.name!,
                    image: editProfileProvider.selectedImage!,
                  );
                  if (success) {
                    Navigator.pop(context); // Close the bottom sheet
                    // Optionally show success message
                  } else {
                    // Show error message
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(editProfileProvider.errorMessage ?? "Error")),
                    );
                  }
                },
              )

            ],
          ),
        ),
      );
    },
  );
}
