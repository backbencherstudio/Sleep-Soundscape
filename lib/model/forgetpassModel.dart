class Forgetpassmodel {
  final String email;
  final String? message;

  Forgetpassmodel({required this.email, this.message});
  factory Forgetpassmodel.fromJson(Map<String, dynamic> json) {
    return Forgetpassmodel(email: json["email"], message: json["message"]);
  }
}
