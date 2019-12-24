import 'dart:convert';

class DuaDetail {
  int Subtopic_id;
  int duaSubcategory_id;
  String arabic;
  String bengali;
  String english;

  DuaDetail(
      {this.Subtopic_id,
      this.duaSubcategory_id,
      this.arabic,
      this.bengali,
      this.english});

  factory DuaDetail.fromRawJson(String str) =>
      DuaDetail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DuaDetail.fromJson(Map<String, dynamic> json) => new DuaDetail(
        Subtopic_id: json["Subtopic_id"],
        duaSubcategory_id: json["duaSubcategory_id"],
        bengali: json["bengali"],
        arabic: json["arabic"],
        english: json["english"],
      );

  Map<String, dynamic> toJson() => {
        "Subtopic_id": Subtopic_id,
        "duaSubcategory_id": duaSubcategory_id,
        "arabic": arabic,
        "bengali": bengali,
        "english": english,
      };
}
