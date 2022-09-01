import 'dart:convert';
import 'dart:convert' as convert;

LoginResponseModel loginResponseJson(String str) {
  print("${str} str argument in loginResponse here");
  print("${json.decode(str)} decoded string");
  var a = json.decode(str);
  print("${a.runtimeType} this is my type");
  Map data = convert.jsonDecode(str);

  print("hahahahaha 1");
  print("${data["success"]} success j");
  print("hahahahaha 2");
  print("${data["data"]} user data j");
  Map<String,dynamic> j = json.decode(str);
  print("$j printing j");
  return LoginResponseModel.fromJson(j);
}


class LoginResponseModel {
  LoginResponseModel({
    required this.message,
    required this.data,
  });
  late final String message;
  late final Data data;

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    message = json["success"];
    data = Data.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data["success"] = message;
    _data["data"] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.username,
    required this.email,
    required this.role,
    required this.id,
    required this.fullName,
    required this.phone,
    required this.token,
  });
  late final String username;
  late final String email;
  late final String role;
  late final String fullName;
  late final String phone;
  late final String id;
  late final String token;

  Data.fromJson(Map<String, dynamic> json) {
    username = json["userName"];
    email = json["email"];
    role = json["role"];
    fullName = json["fullName"];
    phone = json["phone"];
    id = json["id"];
    token = json["token"];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['userName'] = username;
    _data['email'] = email;
    _data['role'] = role;
    _data['phone'] = phone;
    _data['fullName'] = fullName;
    _data['id'] = id;
    _data['token'] = token;
    return _data;
  }
}