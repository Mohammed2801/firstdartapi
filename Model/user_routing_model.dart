class LoginInputModel {
  String? username;
  String? password;

  LoginInputModel({this.username, this.password});

  LoginInputModel.fromJson(Map<String, dynamic> json) {
    username = json['Username'];
    password = json['Password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Username'] = username;
    data['Password'] = password;
    return data;
  }
}
