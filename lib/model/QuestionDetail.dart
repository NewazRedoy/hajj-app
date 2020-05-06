import 'dart:convert';

class QuestionDetail {
  int category_id;
  int id;
  String question;
  String answer;

  QuestionDetail({this.category_id, this.id, this.question, this.answer});

  factory QuestionDetail.fromRawJson(String str) => QuestionDetail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory QuestionDetail.fromJson(Map<String, dynamic> json) => new QuestionDetail(
        category_id: json["category_id"],
        id: json["id"],
        question: json["question"],
        answer: json["answer"],
      );

  Map<String, dynamic> toJson() => {
        "category_id": category_id,
        "id": id,
        "question": question,
        "answer": answer,
      };
}
