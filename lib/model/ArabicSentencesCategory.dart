import 'dart:convert';

class SentencesCategory {
  int sentencecategory_id;
  String sentencetopic;

  SentencesCategory({this.sentencecategory_id, this.sentencetopic});

  factory SentencesCategory.fromRawJson(String str) =>
      SentencesCategory.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SentencesCategory.fromJson(Map<String, dynamic> json) =>
      new SentencesCategory(
        sentencecategory_id: json["sentencecategory_id"],
        sentencetopic: json["sentencetopic"],
      );

  Map<String, dynamic> toJson() => {
        "sentencecategory_id": sentencecategory_id,
        "sentencetopic": sentencetopic,
      };
}
