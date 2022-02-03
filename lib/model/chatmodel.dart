// To parse this JSON data, do
//
//     final chatmodel = chatmodelFromJson(jsonString);

import 'dart:convert';

Chatmodel chatmodelFromJson(String str) => Chatmodel.fromJson(json.decode(str));

String chatmodelToJson(Chatmodel data) => json.encode(data.toJson());

class Chatmodel {
  Chatmodel({
    required this.avatar,
    required this.name,
    required this.isGroup,
    required this.updatedAt,
    required this.message,
  });

  String avatar;
  String name;
  bool isGroup;
  String updatedAt;
  String message;

  factory Chatmodel.fromJson(Map<String, dynamic> json) => Chatmodel(
        avatar: json["avatar"],
        name: json["name"],
        isGroup: json["isGroup"],
        updatedAt: json["updatedAt"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "avatar": avatar,
        "name": name,
        "isGroup": isGroup,
        "updatedAt": updatedAt,
        "message": message,
      };
}
