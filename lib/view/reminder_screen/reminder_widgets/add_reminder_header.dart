import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../model_view/reminder_screen_provider.dart';

class AddReminderHeader extends StatelessWidget{
  const AddReminderHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap:
              () => context.read<ReminderScreenProvider>().setPageID(1),
          child: Container(
            width: 32.w,
            height: 32.h,
            padding: EdgeInsets.all(7.r),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white.withOpacity(0.08)),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
              size: 18.r,
            ),
          ),
        ),
        Text(
          "Add Reminder",
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(padding: EdgeInsets.all(0)),
          onPressed: () {},
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