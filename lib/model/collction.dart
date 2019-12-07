import 'dart:convert';

class Collection {
  int id;
  String name;
  String name_ar;
  String color;
  String abbv;

  Collection({this.id, this.name, this.name_ar, this.color, this.abbv});

  factory Collection.fromRawJson(String str) =>
      Collection.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Collection.fromJson(Map<String, dynamic> json) => new Collection(
    id: json["id"],
    name: json["name"],
    name_ar: json["name_ar"],
    color: json["color"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
