import 'dart:convert';

class ArabicSentence {
  int topic_id;
  int sentencecategory_id;
  String bengali;
  String arabic;
  String pronunciation;

  ArabicSentence(
      {this.topic_id,
      this.sentencecategory_id,
      this.arabic,
      this.bengali,
      this.pronunciation});

  factory ArabicSentence.fromRawJson(String str) =>
      ArabicSentence.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ArabicSentence.fromJson(Map<String, dynamic> json) =>
      new ArabicSentence(
        topic_id: json["topic_id"],
        sentencecategory_id: json["sentencecategory_id"],
        bengali: json["bengali"],
        arabic: json["arabic"],
        pronunciation: json["pronunciation"],
      );

  Map<String, dynamic> toJson() => {
        "topic_id": topic_id,
        "sentencecategory_id": sentencecategory_id,
        "bengali": bengali,
        "arabic": arabic,
        "pronunciation": pronunciation,
      };
}
