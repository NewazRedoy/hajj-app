import 'dart:convert';

class AllDuaCategory {
  int allDuacategory_id;
  String allDuatopic;

  AllDuaCategory({this.allDuacategory_id, this.allDuatopic});

  factory AllDuaCategory.fromRawJson(String str) =>
      AllDuaCategory.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AllDuaCategory.fromJson(Map<String, dynamic> json) =>
      new AllDuaCategory(
        allDuacategory_id: json["allDuacategory_id"],
        allDuatopic: json["allDuatopic"],
      );

  Map<String, dynamic> toJson() => {
        "allDuacategory_id": allDuacategory_id,
        "allDuatopic": allDuatopic,
      };
}
