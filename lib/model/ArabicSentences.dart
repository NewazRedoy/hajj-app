import 'dart:convert';
class ArabicSentences {
  int topic_id;
  String bengali;
  String arabic;
  String pronunciation;
  ArabicSentences({this.topic_id,this.arabic,this.bengali,this.pronunciation});

  factory ArabicSentences.fromRawJson(String str) =>
      ArabicSentences.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ArabicSentences.fromJson(Map<String, dynamic> json) => new ArabicSentences(
    topic_id: json["topic_id"],
    bengali: json["bengali"],
    arabic: json["arabic"],
    pronunciation: json["pronunciation"],
  );

  Map<String, dynamic> toJson() => {
    "topic_id": topic_id,
    "bengali": bengali,
    "arabic": arabic,
    "pronunciation": pronunciation,

  };
}