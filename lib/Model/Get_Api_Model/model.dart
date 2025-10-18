

import 'dart:convert';

List<DataModel> dataModelFromJson(String str) => List<DataModel>.from(json.decode(str).map((x) => DataModel.fromJson(x)));

String dataModelToJson(List<DataModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataModel {
  int userId;
  int id;
  String title;
  String body;

  DataModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  DataModel copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) =>
      DataModel(
        userId: userId ?? this.userId,
        id: id ?? this.id,
        title: title ?? this.title,
        body: body ?? this.body,
      );

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
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
