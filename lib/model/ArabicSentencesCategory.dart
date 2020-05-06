import 'dart:convert';

class SentencesCategory {
  int id;
  String name;

  SentencesCategory({this.id, this.name});

  factory SentencesCategory.fromRawJson(String str) => SentencesCategory.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SentencesCategory.fromJson(Map<String, dynamic> json) => new SentencesCategory(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
