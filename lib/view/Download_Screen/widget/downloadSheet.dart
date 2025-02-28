import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sleep_soundscape/model/downloadModel.dart';

void DownloadSheet({
  required BuildContext context,
  dynamic Function()? ontap,
}) {
  showModalBottomSheet(

   
    context: context,

    backgroundColor: Color(0xFF212121),
    isScrollControlled: true,
    useSafeArea: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(26.r)),
    ),
    builder: (context) {

       List<Downloadmodel> done =[
      Downloadmodel(
        title:"Mindful waliking",
       description: "Heard by 77 people.",
        img: "assets/icons/img2.png", 
        
        ),

        Downloadmodel(
        title:"Mindful waliking",
       description: "Heard by 77 people.",
        img: "assets/icons/img1.png", 
       
        ),
        Downloadmodel(
        title:"Mindful waliking",
       description: "Heard by 77 people.",
        img: "assets/icons/img3.png", 
      
        ),
    ];
      return Container(
        width: double.infinity,
        height: 730,
        padding: EdgeInsets.all(10),

        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: Column(
              
              children: [
               Container(
                  height: 6.h,
                  width: 115.w,
                  decoration: BoxDecoration(
                     color: Color(0xFF000000).withOpacity(0.6),
                   
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                ),
                SizedBox(height: 15.h),
                Row(
                    
                
                  children:[ 
                    
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset("assets/icons/back.png",
                        height: 32.h,
                        width: 32.h,
                        ),
                      ),
                    ),
                 SizedBox(width:60.w ,),
                    Align(
                      alignment: Alignment.topRight,
                      child: RichText(
                      text: TextSpan(
                        text: "Downloads",
                        style: Theme.of(
                          context,
                        ).textTheme.headlineMedium?.copyWith(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                                          ),
                    ),
              ]),
              SizedBox(height: 32.h,),
              //  Image.asset("assets/icons/dnld.png",
              //  height: 178.h,
              //  width: 178.w,
              //  ),
             Expanded(
               child: ListView.builder(
              
                itemCount: done.length,
                itemBuilder:(context,index){
                return Column(
                  children:[ Container(
                 
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                       color: Color(0xff0000000).withOpacity(0.1),
                      border: Border.all(
                        color: Color(0xFFFFFFFF).withOpacity(0.6),
                      )
                    ),
                    child: Row(
                     children: [
                       Image.asset(done[index].img,
                       height: 64.h,
                       width: 64.w,
                       ),
                             SizedBox(width: 8.w,),
                             Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(done[index].title,
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFFFFFFFF)
                                ),
                                ),
                                SizedBox(height: 3.h,),
                                Text(done[index].description,
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w300,
                                  color: Color(0xFFFFFFFF).withOpacity(0.6)
                                
                                ))
                              ],
                             ),
                            SizedBox(width: 20,),
                          Flexible(
                            child: Image.asset("assets/icons/downlod.png",
                           
                            ),
                          ),
                     ],
                
                    ),
                  ),
                  SizedBox(height: 12,)
               ] );
               }),
             ),
        
               
              ],
            ),
          ),
        ),
      );
    },
  );
}
