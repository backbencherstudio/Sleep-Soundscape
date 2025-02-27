class AppUrls {
  AppUrls();

  //https://energy-backend.ddns.net
  static const String baseUrl = 'http://192.168.40.10:1000';
  //'https://dependent-boxes-eh-mandate.trycloudflare.com';
  static String sound(String category) => '$baseUrl/sounds/filterSounds?category=$category';
  //static String readNotification(id) => '$baseUrl/notification/mark-read/${id}';
   static String forgotPassword  = '$baseUrl/users/forgot-password';
  static String loginUrl = '$baseUrl/api/users/logIn';
  static String signUp = '$baseUrl//api/users/signup';


}
