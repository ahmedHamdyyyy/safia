class LogModel {
  final String email;
  final String password;

  LogModel({required this.email, required this.password});

  factory LogModel.fromJson(Map<String, dynamic> json) {
    return LogModel(email: json['email'], password: json['password']);
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
