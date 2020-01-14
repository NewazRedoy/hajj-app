import 'dart:convert';

class SearchItem {
  int subtopic_id;
  int topic_id;
  String name_en;

  SearchItem({
    this.topic_id,
    this.subtopic_id,
    this.name_en,
  });

  factory SearchItem.fromRawJson(String str) => SearchItem.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SearchItem.fromJson(Map<String, dynamic> json) => new SearchItem(
        topic_id: json["topic_id"],
        subtopic_id: json["subtopic_id"] is String ? int.parse(json["subtopic_id"]) : json["subtopic_id"],
        name_en: json["name_en"],
      );

  Map<String, dynamic> toJson() => {
        "subtopic_id": subtopic_id,
        "topic_id": topic_id,
        "name_en": name_en,
      };
}
