import 'dart:convert';
class Book {
  String BookID;
  int CollectionID;
  String name_en;

  Book({
    this.CollectionID,
    this.BookID,
    this.name_en,
  });

  factory Book.fromRawJson(String str) => Book.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Book.fromJson(Map<String, dynamic> json) => new Book(
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
