import 'dart:convert';

class Subtopic {
  int subtopic_id;
  int topic_id;
  String name;

  Subtopic({
    this.topic_id,
    this.subtopic_id,
    this.name,
  });

  factory Subtopic.fromRawJson(String str) => Subtopic.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Subtopic.fromJson(Map<String, dynamic> json) => new Subtopic(
        topic_id: json["topic_id"],
        subtopic_id: json["subtopic_id"] is String ? int.parse(json["subtopic_id"]) : json["subtopic_id"],
        name: json["name_en"],
      );

  Map<String, dynamic> toJson() => {
        "subtopic_id": subtopic_id,
        "topic_id": topic_id,
        "name_en": name,
      };
}
