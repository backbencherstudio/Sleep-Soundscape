class AppUrls {
  AppUrls();
  //https://energy-backend.ddns.net
  static const String baseUrl = 'https://192.168.40.25:3000/api';
  //'https://dependent-boxes-eh-mandate.trycloudflare.com';
  static String sound(String category) => '$baseUrl/sounds/filterSounds?category=$category';
  //static String readNotification(id) => '$baseUrl/notification/mark-read/${id}';

static String loginUrl = '$baseUrl/users/logIn';


}
