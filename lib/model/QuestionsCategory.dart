import 'dart:convert';

class QuestionCategory {
  int id;
  String name;

  QuestionCategory({this.id, this.name});

  factory QuestionCategory.fromRawJson(String str) => QuestionCategory.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory QuestionCategory.fromJson(Map<String, dynamic> json) => new QuestionCategory(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
