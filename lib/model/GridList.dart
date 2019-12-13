import 'dart:convert';

class Guide {
  String GuideID;
  int topic_id;
  String name_en;

  Guide({
    this.GuideID,
    this.topic_id,
    this.name_en,
  });

  factory Guide.fromRawJson(String str) => Guide.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Guide.fromJson(Map<String, dynamic> json) => new Guide(
        topic_id: json["topic_id"],
        GuideID: json["subtopic_id"],
        name_en: json["name_en"],
      );

  Map<String, dynamic> toJson() => {
        "subtopic_id": GuideID,
        "topic_id": topic_id,
        "name_en": name_en,
      };
}
