import 'dart:convert';

class Guide {
  String GuideID;
  int TopicID;
  String name_en;

  Guide({
    this.GuideID,
    this.TopicID,
    this.name_en,
  });

  factory Guide.fromRawJson(String str) => Guide.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Guide.fromJson(Map<String, dynamic> json) => new Guide(
    TopicID: json["TopicID"],
    GuideID: json["SubtopicID"],
        name_en: json["name_en"],
      );

  Map<String, dynamic> toJson() => {
    "SubtopicID": GuideID,
    "TopicID": TopicID,
        "name_en": name_en,
      };
}
