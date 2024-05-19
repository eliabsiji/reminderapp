// To parse this JSON data, do
//
//     final userLoginError = userLoginErrorFromJson(jsonString);

import 'dart:convert';

UserLoginError userLoginErrorFromJson(String str) =>
    UserLoginError.fromJson(json.decode(str));

String userLoginErrorToJson(UserLoginError data) => json.encode(data.toJson());

class UserLoginError {
  bool? status;
  String? message;

  UserLoginError({
    this.status,
    this.message,
  });

  UserLoginError copyWith({
    bool? status,
    String? message,
  }) =>
      UserLoginError(
        status: status ?? this.status,
        message: message ?? this.message,
      );

  factory UserLoginError.fromJson(Map<String, dynamic> json) => UserLoginError(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
