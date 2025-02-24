  import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void soundBottomSheet(BuildContext context) {

  final List<String> categories = ["Oceans", "Nature", "Rain", "Map", "Fire"];
  int selectedIndex = 0; // Track the selected category
  List<bool> isPressedList = List.generate(6, (index) => false); // Track state for each item

  showModalBottomSheet(
  isScrollControlled: true,
      context: context,
      backgroundColor: Color(0xff0F0F13),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (BuildContext context) {

        return Container(
          height: MediaQuery.of(context).size.height * 0.9, // 70% of screen height

          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.9),
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
          ),
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.grey, width: 1),
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(7.r),
                    child: Icon(Icons.arrow_back_ios, color: Colors.white, size: 10.sp),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(
                    color: Color.fromRGBO(255, 255, 255, 0.08),
                    width: 1,
                  ),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(255, 255, 255, 0.08),
                        width: 1.0,
                      ), // Border color and width
                      borderRadius: BorderRadius.circular(
                        16.0,
                      ), // Rounded corners
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(255, 255, 255, 0.08),
                        width: 1.0,
                      ), // When focused
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    filled: true,
                    fillColor: Color(0xff19191C),
                    prefixIcon: Icon(Icons.search, color: Colors.white),
                    hintText: "search",
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              SizedBox(
                height: 40.h, // Fixed height for smoother UI
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    bool isSelected = selectedIndex == index;
                    return GestureDetector(
                      onTap: () {
                        // setState(() {
                        //   selectedIndex = index; // Update selected category
                        // });
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Container(

                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 12.h,
                          ),
                          decoration: BoxDecoration(

                            borderRadius: BorderRadius.circular(14.r),
                            border: Border.all(
                              color:
                                  Colors.grey,
                              width: 0.8,
                            ),
                            color:
                                isSelected
                                    ? Color(0xffFAD051)
                                    : Color(0xff19191C),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            categories[index],
                            style: TextStyle(
                              color: isSelected ? Colors.black : Colors.white,
                              fontSize: 14.sp,
                              fontWeight:
                                  isSelected
                                      ? FontWeight.w400
                                      : FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 24.h),

              Expanded(
                child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[900], // Background color
                          borderRadius: BorderRadius.circular(10), // Rounded corners
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 5,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: ListTile(
                          leading: Image.asset('assets/images/white_sound.png', width: 40, height: 40),
                          title: Text(
                            "Sound ${index + 1}",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500,fontSize: 14.sp),
                          ),
                          subtitle: Text(
                            "Subtitle ${index + 1}",
                            style: TextStyle(color: Colors.white70,fontSize: 12.sp,fontWeight: FontWeight.w300),
                          ),
                          trailing: isPressedList[index]
                              ? Icon(
                            Icons.pause_circle_filled, // Change to pause icon when pressed
                            color: Colors.redAccent,
                            size: 30,
                          )
                              : Icon(
                            Icons.play_circle_fill, // Default play icon
                            color: Colors.white,
                            size: 30,
                          ),

                        ),
                      ),
                    );
                  },
                ),
              ),

            ],
          ),
        );
      },
    );
  }