

import 'package:flutter/widgets.dart';

class Downloadmodel {
String title;
String description;
String img;
IconData icons;
Downloadmodel(

  {
    required this.title,
    required this.description,
    required this.img,
    required this.icons
  }
);

factory Downloadmodel.fromJson(Map<String, dynamic> json){
  return Downloadmodel(
    title: json["title"],
    description: json["description"],
    img: json["img"],
    icons: json["icons"],
 );
}



}

