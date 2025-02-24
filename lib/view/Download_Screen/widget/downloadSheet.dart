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
        icons: Icons.download),

         Downloadmodel(
        title:"Calm Light",
       description: "Heard by 233 people.",
        img: "assets/icons/img1.png", 
       icons: Icons.download),

         Downloadmodel(
        title:"Peace",
       description: "Heard by 150 people.",
        img: "assets/icons/img3.png", 
        icons: Icons.download
        
        ),
    ];
      return Container(
        width: double.infinity,
        height: 730,
        padding: EdgeInsets.all(20),

        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: Column(
                
                children: [
                 Container(
                    height: 6.h,
                    width: 115.w,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 44, 47, 49),
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
                 SizedBox(
                  height: 20.h,
                 ),
                 Expanded(
                   child: SizedBox(
                    height:700.h ,
                   
                    child:   ListView.builder(
                                   
                                   itemCount: done.length,
                                   itemBuilder:(context,index){
                                   return ListTile(
                    title: Text(done[index].title,),
                    subtitle: Text(done[index].description),
                    leading: Image.asset(done[index].img),
                    trailing: Icon(done[index].icons),
                                   );
                                  }),
                   ),
                 )

                //  Image.asset("assets/icons/dnld.png",
                //  height: 178.h,
                //  width: 178.w,
                //  ),
              //    SizedBox(height: 20.h),
             

                 
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
