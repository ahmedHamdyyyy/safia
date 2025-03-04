class RegisterModelinp {
  final String email;
  final String? password;
  final String? name;
  final String? phone;
  final String? confPass;
  final String? token;

  RegisterModelinp(
      {required this.email,
      this.name,
      this.phone,
       this.password,
      this.confPass,
      this.token});

  factory RegisterModelinp.fromJson(Map<String, dynamic> json) {
    return RegisterModelinp(
      email: json['email'],
      name: json['name'],
      phone: json['phoneNumber'],
      password: json['password'],
      confPass: json['confirmPassword'],
      token: json['token'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'firstName': name,
      'phoneNumber': phone,
      'confirmPassword': confPass,
      'token': token
    };
  }
}

//
class RegisterModel {
  String? message;
  String? email;
  String? emailConfirmationToken;
  String? token;
  String? resetPasswordToken;
  //add userId
  String? userId;

  RegisterModel(
      {this.message,
      this.email,
      this.emailConfirmationToken,
      this.token,
      this.userId});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    email = json['email'];
    emailConfirmationToken = json['emailConfirmationToken'];
    token = json['token'];
    userId = json['userId'];
    resetPasswordToken = json['resetPasswordToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['email'] = email;
    data['emailConfirmationToken'] = emailConfirmationToken;
    data['token'] = token;
    data['userId'] = userId;
    data['resetPasswordToken'] = resetPasswordToken;
    return data;
  }
}
