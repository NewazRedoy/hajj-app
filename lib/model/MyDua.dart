import 'dart:convert';

class MyDua {
  String title;
  String text;
  int color;
  String key;

  MyDua({this.key, this.title, this.text, this.color});

  factory MyDua.fromRawJson(String str) => MyDua.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MyDua.fromJson(Map<String, dynamic> json) => new MyDua(
        text: json["text"],
        title: json["title"],
      );

  factory MyDua.fromLinkedHashMap(String key, Map<dynamic, dynamic> value) => new MyDua(
        key: key,
        text: value["text"],
        title: value["title"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "text": text,
      };
}
