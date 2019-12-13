import 'dart:convert';

class Topic {
  int topic_id;
  String name;
  String desc_en;
  String color;
  String abbv;

  Topic({this.topic_id, this.name, this.desc_en, this.color, this.abbv});

  factory Topic.fromRawJson(String str) => Topic.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Topic.fromJson(Map<String, dynamic> json) => new Topic(
        topic_id: json["topic_id"],
        name: json["name"],
        desc_en: json["desc_en"],
        color: json["color"],
      );

  Map<String, dynamic> toJson() => {
        "topic_id": topic_id,
        "name": name,
      };
}
