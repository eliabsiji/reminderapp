// To parse this JSON data, do
//
//     final userLoginErrorModel = userLoginErrorModelFromJson(jsonString);

import 'dart:convert';

UserLoginErrorModel userLoginErrorModelFromJson(String str) =>
    UserLoginErrorModel.fromJson(json.decode(str));

String userLoginErrorModelToJson(UserLoginErrorModel data) =>
    json.encode(data.toJson());

class UserLoginErrorModel {
  bool? status;
  String? message;

  UserLoginErrorModel({
    this.status,
    this.message,
  });

  factory UserLoginErrorModel.fromJson(Map<String, dynamic> json) =>
      UserLoginErrorModel(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
