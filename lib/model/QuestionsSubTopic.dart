import 'dart:convert';

class QuestionSubtopic {
  int category_id;
  int question_id;
  String questiontopic;
  String answer;

  QuestionSubtopic({this.category_id, this.question_id, this.questiontopic, this.answer});

  factory QuestionSubtopic.fromRawJson(String str) =>
      QuestionSubtopic.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory QuestionSubtopic.fromJson(Map<String, dynamic> json) =>
      new QuestionSubtopic(
        category_id: json[" category_id"],
        question_id: json["question_id"],
        questiontopic: json["questiontpic_id"],
        answer: json["answer_id"],
      );

  Map<String, dynamic> toJson() => {
    "question_id": category_id,
        "question_id": question_id,
        "questiontpic": questiontopic,
        "answer": answer,
      };
}
