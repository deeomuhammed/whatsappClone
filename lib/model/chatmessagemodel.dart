// To parse this JSON data, do
//
//     final messagemodel = messagemodelFromJson(jsonString);

import 'dart:convert';

Messagemodel messagemodelFromJson(String str) =>
    Messagemodel.fromJson(json.decode(str));

String messagemodelToJson(Messagemodel data) => json.encode(data.toJson());

class Messagemodel {
  Messagemodel({
    required this.isSend,
    required this.isReaded,
    required this.message,
    required this.sendAt,
  });

  bool isSend;
  bool isReaded;
  String message;
  String sendAt;

  factory Messagemodel.fromJson(Map<String, dynamic> json) => Messagemodel(
        isSend: json["isSend"],
        isReaded: json["isReaded"],
        message: json["message"],
        sendAt: json["sendAt"],
      );

  Map<String, dynamic> toJson() => {
        "isSend": isSend,
        "isReaded": isReaded,
        "message": message,
        "sendAt": sendAt,
      };
}
