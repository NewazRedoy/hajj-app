import 'dart:convert';

class QuestionCategory {
  int category_id;
  String questiontopic;

  QuestionCategory({this.category_id, this.questiontopic});

  factory QuestionCategory.fromRawJson(String str) =>
      QuestionCategory.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory QuestionCategory.fromJson(Map<String, dynamic> json) =>
      new QuestionCategory(
        category_id: json["question_id"],
        questiontopic: json["questiontpic_id"],
      );

  Map<String, dynamic> toJson() => {
        "question_id": category_id,
        "questiontpic": questiontopic,
      };
}
