import 'dart:convert';

class Subtopic {
  String SubtopicID;
  int TopicID;
  String name_en;

  Subtopic({
    this.TopicID,
    this.SubtopicID,
    this.name_en,
  });

  factory Subtopic.fromRawJson(String str) =>
      Subtopic.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Subtopic.fromJson(Map<String, dynamic> json) => new Subtopic(
    TopicID: json["TopicID"],
    SubtopicID: json["SubtopicID"],
        name_en: json["name_en"],
      );

  Map<String, dynamic> toJson() => {
    "SubtopicID": SubtopicID,
    "TopicID": TopicID,
        "name_en": name_en,
      };
}
