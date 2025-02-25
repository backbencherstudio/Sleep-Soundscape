import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../model_view/reminder_screen_provider.dart';

class AddReminderHeader extends StatelessWidget{

  String headerText;
  Function onSave;

   AddReminderHeader({super.key, required this.headerText, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap:()=> Navigator.pop(context),
          child: Container(
            width: 32.w,
            height: 32.h,
            padding: EdgeInsets.all(7.r),
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).colorScheme.onSecondary.withOpacity(0.08),),
              shape: BoxShape.circle,

            ),
            child: Icon(Icons.arrow_back_ios_new,color: Theme.of(context).colorScheme.onSecondary,size: 18.r,),
          ),
        ),
        Text(
          headerText,
          style:Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w600
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(padding: EdgeInsets.all(0)),
          onPressed: (){ onSave();},
          child: Text(
            "Save",
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontSize: 12.sp),
          ),
        ),
      ],
    );
  }
}