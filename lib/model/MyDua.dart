import 'dart:convert';

class MyDua {
  String title;
  String text;
  String english;

  MyDua({
      this.title,
      this.text,
      this.english});

  factory MyDua.fromRawJson(String str) =>
      MyDua.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MyDua.fromJson(Map<String, dynamic> json) => new MyDua(
        text: json["text"],
        title: json["title"],
        english: json["english"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "text": text,
        "english": english,
      };
}
