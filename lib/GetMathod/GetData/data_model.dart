// To parse this JSON data, do
//
//     final getapi = getapiFromJson(jsonString);

import 'dart:convert';

List<Getapi> getapiFromJson(String str) => List<Getapi>.from(json.decode(str).map((x) => Getapi.fromJson(x)));

String getapiToJson(List<Getapi> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Getapi {
  int userId;
  int id;
  String title;
  String body;

  Getapi({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  Getapi copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) =>
      Getapi(
        userId: userId ?? this.userId,
        id: id ?? this.id,
        title: title ?? this.title,
        body: body ?? this.body,
      );

  factory Getapi.fromJson(Map<String, dynamic> json) => Getapi(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}
