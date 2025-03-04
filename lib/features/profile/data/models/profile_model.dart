class ProfileModel {
  String? name;
  String? email;
  String? phoneNumber;

  ProfileModel({this.name, this.email, this.phoneNumber});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    return data;
  }
}
