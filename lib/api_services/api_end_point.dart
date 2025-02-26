class AppUrls {
  AppUrls._();
  //https://energy-backend.ddns.net
  static const String baseUrl = 'http://192.168.40.25:3000/api';
  //'https://dependent-boxes-eh-mandate.trycloudflare.com';
  static  String sound(category) => '$baseUrl/sounds/filterSounds?category=fire&${category}=abcd2';
  //static String readNotification(id) => '$baseUrl/notification/mark-read/${id}';

static String loginUrl = '$baseUrl/users/logIn';


}
