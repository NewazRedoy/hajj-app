import 'dart:convert';

class ArabicSentence {
  int id;
  int category_id;
  String bangla;
  String arabic;
  String pronunciation;

  ArabicSentence({this.id, this.category_id, this.arabic, this.bangla, this.pronunciation});

  factory ArabicSentence.fromRawJson(String str) => ArabicSentence.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ArabicSentence.fromJson(Map<String, dynamic> json) => new ArabicSentence(
        id: json["id"],
        category_id: json["category_id"],
        bangla: json["bangla"],
        arabic: json["arabic"],
        pronunciation: json["pronunciation"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": category_id,
        "beangla": bangla,
        "arabic": arabic,
        "pronunciation": pronunciation,
      };
}
