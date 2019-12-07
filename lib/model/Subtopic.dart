import 'dart:convert';

class Subtopic {
  String BookID;
  int CollectionID;
  String name_en;

  Subtopic({
    this.CollectionID,
    this.BookID,
    this.name_en,
  });

  factory Subtopic.fromRawJson(String str) =>
      Subtopic.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Subtopic.fromJson(Map<String, dynamic> json) => new Subtopic(
        CollectionID: json["CollectionID"],
        BookID: json["BookID"],
        name_en: json["name_en"],
      );

  Map<String, dynamic> toJson() => {
        "BookID": BookID,
        "CollectionID": CollectionID,
        "name_en": name_en,
      };
}
