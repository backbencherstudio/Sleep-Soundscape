



class Downloadmodel {
String title;
String description;
String img;

Downloadmodel(

  {
    required this.title,
    required this.description,
    required this.img,
  }
);

factory Downloadmodel.fromJson(Map<String, dynamic> json){
  return Downloadmodel(
    title: json["title"],
    description: json["description"],
    img: json["img"],
 );
}



}

