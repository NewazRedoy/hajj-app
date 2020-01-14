import 'dart:convert';

class DuaDetail {
  int id;
  int category_id;
  String arabic;
  String bangla;
  String transliteration;

  DuaDetail({this.id, this.category_id, this.arabic, this.bangla, this.transliteration});

  factory DuaDetail.fromRawJson(String str) => DuaDetail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DuaDetail.fromJson(Map<String, dynamic> json) => new DuaDetail(
        id: json["id"],
        category_id: json["category_id"],
        bangla: json["bangla"],
        arabic: json["arabic"],
        transliteration: json["transliteration"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": category_id,
        "arabic": arabic,
        "bangla": bangla,
        "transliteration": transliteration,
      };
}
