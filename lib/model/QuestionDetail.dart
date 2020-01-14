import 'dart:convert';

class QuestionDetail {
  int category_id;
  int id;
  String questiontopic;
  String answer;

  QuestionDetail({this.category_id, this.id, this.questiontopic, this.answer});

  factory QuestionDetail.fromRawJson(String str) => QuestionDetail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory QuestionDetail.fromJson(Map<String, dynamic> json) => new QuestionDetail(
        category_id: json[" category_id"],
        id: json["id"],
        questiontopic: json["questiontpic_id"],
        answer: json["answer_id"],
      );

  Map<String, dynamic> toJson() => {
        "category_id": category_id,
        "id": id,
        "questiontpic": questiontopic,
        "answer": answer,
      };
}
