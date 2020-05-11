import 'dart:convert';

class Dua {
  int id;
  int category_id;
  String arabic;
  String bangla;
  String transliteration;

  Dua({this.id, this.category_id, this.arabic, this.bangla, this.transliteration});

  factory Dua.fromRawJson(String str) => Dua.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Dua.fromJson(Map<String, dynamic> json) => new Dua(
        id: json["dua_id"],
        category_id: json["category_id"],
        bangla: json["bangla"],
        arabic: json["arabic"],
        transliteration: json["transliteration"],
      );

  Map<String, dynamic> toJson() => {
        "dua_id": id,
        "category_id": category_id,
        "arabic": arabic,
        "bangla": bangla,
        "transliteration": transliteration,
      };
}
