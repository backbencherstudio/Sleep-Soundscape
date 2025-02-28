import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sleep_soundscape/model_view/reminder_screen_provider.dart';

// class ReminderDropDownButton extends StatelessWidget{
//   const ReminderDropDownButton({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return CustomDropdown(
//      // controller: homeScreenProvider.dropdownController,
//
//       decoration: CustomDropdownDecoration(
//         hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
//           color: Colors.white.withOpacity(0.6),
//           fontWeight: FontWeight.w400,
//         ),
//         listItemStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
//           color: Colors.white.withOpacity(0.6),
//           fontWeight: FontWeight.w400,
//         ),
//         closedFillColor: Colors.white.withOpacity(0.04),
//         closedBorder: Border.all(color: Colors.white.withOpacity(0.08),),
//         closedSuffixIcon: Icon(Icons.keyboard_arrow_down,color: Colors.white,),
//         expandedFillColor: Colors.white.withOpacity(0.04),
//         expandedBorder: Border.all(color: Colors.white.withOpacity(0.08),),
//        // expandedSuffixIcon: Icon(Icons.keyboard_arrow_up,color: Colors.white,),
//
//       ),
//
//       maxlines: 2,
//       overlayHeight: 300.h,
//       hintText: 'Select Reminder Type',
//       items: ['Focus', 'Sleep', 'Breath', 'Meditation', 'Nap', 'General'],
//       // Directly use the list
//       // initialItem: homeScreenProvider.batteryList[0],
//       onChanged: (value) {
//         debugPrint("\n value : $value");
//       },
//     );
//   }
// }


class ReminderDropDownButton extends StatefulWidget{
  List<String>? uniqueItemList;
  String? hintText;
  bool? isMultipleChoice;
  List<bool> multipleChoiceValue = List<bool>.filled(7, false);
  void Function(int, bool)? onMultipleChoice;
  void Function(String)? onSingleChoice;
   ReminderDropDownButton({
     super.key, required this.uniqueItemList,
     required this.hintText,
     this.isMultipleChoice = false,
     this.onMultipleChoice,
     this.onSingleChoice,
   });


  @override
  State<ReminderDropDownButton> createState() => _ReminderDropDownButtonState();
}

class _ReminderDropDownButtonState extends State<ReminderDropDownButton> {
  bool isExpanded = false;
  bool isSelected = false;
  String selectedText = "";

  void selectSingleItem (int index){
    setState(() {
      selectedText = widget.uniqueItemList![index];
      isSelected = true;
      isExpanded = false;
    });

  }

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        GestureDetector(
          onTap:(){
            setState(() {
              isExpanded = !isExpanded;
            });
            debugPrint("\nCustom dropdown button added!\n");
          },
          child: Container(
            width: 345.w,
            padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 18.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.r),
              color: Theme.of(context).colorScheme.secondary,
              border: Border.all(color: Theme.of(context).colorScheme.secondary,),
            ),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text( isSelected ? selectedText : widget.hintText ?? "Choose",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                 // color: Colors.white.withOpacity(0.6),
                  color: Theme.of(context).colorScheme.onSecondary,
                  fontWeight: FontWeight.w400,
                ),),

                Icon(Icons.keyboard_arrow_down,color: Theme.of(context).colorScheme.onSecondary,)
              ],
            )
          ),
        ),


        SizedBox(height: 8.h,),
        AnimatedContainer(
          width: 345,
          height: isExpanded ? 300 : 0,
          curve: Curves.linear,
          duration: Duration(milliseconds: 200),
          padding: EdgeInsets.only(left: 16.w, right : 16.w, top: 18.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.r),
            color: Theme.of(context).colorScheme.secondary,
            border:  Border.all(color: Theme.of(context).colorScheme.secondary,),
          ),
          child: ListView.builder(
            itemCount: widget.uniqueItemList?.length ?? 0,
              physics: ClampingScrollPhysics(),
            // shrinkWrap: true,
             // padding: EdgeInsets.all(8.r),
              itemBuilder: (_, index){
              final String item = widget.uniqueItemList?[index] ?? "N/A";
              return SizedBox(
                height: 55.h,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 15.h,
                  children: [
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Align(
                            alignment : Alignment.centerLeft,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.only(
                                  left: 0,
                                  right: 5,
                                  top: 0
                                )
                              ),
                              onPressed: (){
                                if(widget.isMultipleChoice == false){
                                  selectSingleItem(index);
                                  widget.onSingleChoice!(item);
                                }
                              },

                              child : Text(item,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400),),),
                          ),
                        ),

                        if(widget.isMultipleChoice == true)
                        Consumer<ReminderScreenProvider>(
                          builder: (_, reminderScreenProvider, child) {
                            return Checkbox(
                              checkColor: Theme.of(context).colorScheme.onPrimary,
                                activeColor: Theme.of(context).colorScheme.onSecondary,
                                value: reminderScreenProvider.repetitionDay[index],
                                onChanged: (value){
                                  // setState(() {
                                  //   widget.multipleChoiceValue[index] = value ?? false;
                                  // });
                                  // widget.onMultipleChoice!(widget.multipleChoiceValue);

                                  reminderScreenProvider.onSelectRepeat(index, value ?? false);

                                }
                            );
                          }
                        )
                      ],
                    ),
                  ),
                    if(index!=(widget.uniqueItemList!.length - 1))
                    Divider(color: Colors.white.withOpacity(0.08),)
                  ],
                ),
              );
              },
          ),
        )
      ],
    );
  }
}