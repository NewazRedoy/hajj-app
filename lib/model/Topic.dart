import 'dart:convert';

class Topic {
  int id;
  String name;
  String name_ar;
  String color;
  String abbv;

  Topic({this.id, this.name, this.name_ar, this.color, this.abbv});

  factory Topic.fromRawJson(String str) => Topic.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Topic.fromJson(Map<String, dynamic> json) => new Topic(
        id: json["id"],
        name: json["name"],
        name_ar: json["name_ar"],
        color: json["color"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
