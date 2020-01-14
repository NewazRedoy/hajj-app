import 'dart:convert';

class DuaCategory {
  int id;
  String name;

  DuaCategory({this.id, this.name});

  factory DuaCategory.fromRawJson(String str) => DuaCategory.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DuaCategory.fromJson(Map<String, dynamic> json) => new DuaCategory(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
