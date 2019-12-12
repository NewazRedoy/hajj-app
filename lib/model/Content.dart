import 'dart:convert';

class Content {
  dynamic bookId;
  int collectionId;
  int hadithId;
  String gradeAr;
  String gradeArDiacless;
  String gradeEn;
  String narratorAr;
  String narratorArDiacless;
  String narratorArend;
  String narratorArendDiacless;
  String narratorEn;
  String referenceEn;
  String relatedEn;
  String textAr;
  String textArDiacless;
  String textEn;

  Content({
    this.bookId,
    this.collectionId,
    this.hadithId,
    this.gradeAr,
    this.gradeArDiacless,
    this.gradeEn,
    this.narratorAr,
    this.narratorArDiacless,
    this.narratorArend,
    this.narratorArendDiacless,
    this.narratorEn,
    this.referenceEn,
    this.relatedEn,
    this.textAr,
    this.textArDiacless,
    this.textEn,
  });

  factory Content.fromJson(String str) => Content.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Content.fromMap(Map<String, dynamic> json) => new Content(
    bookId: json["SubtopicID"],
    collectionId: json["TopicID"],
        hadithId: json["HadithID"],
        gradeAr: json["grade_ar"],
        gradeArDiacless: json["grade_ar_diacless"],
        gradeEn: json["grade_en"],
        narratorAr: json["narrator_ar"],
        narratorArDiacless: json["narrator_ar_diacless"],
        narratorArend: json["narrator_arend"],
        narratorArendDiacless: json["narrator_arend_diacless"],
        narratorEn: json["narrator_en"],
        referenceEn: json["reference_en"],
        relatedEn: json["related_en"],
        textAr: json["text_ar"],
        textArDiacless: json["text_ar_diacless"],
        textEn: json["text_en"],
      );

  Map<String, dynamic> toMap() => {
    "SubtopicID": bookId,
    "TopicID": collectionId,
        "HadithID": hadithId,
        "grade_ar": gradeAr,
        "grade_ar_diacless": gradeArDiacless,
        "grade_en": gradeEn,
        "narrator_ar": narratorAr,
        "narrator_ar_diacless": narratorArDiacless,
        "narrator_arend": narratorArend,
        "narrator_arend_diacless": narratorArendDiacless,
        "narrator_en": narratorEn,
        "reference_en": referenceEn,
        "related_en": relatedEn,
        "text_ar": textAr,
        "text_ar_diacless": textArDiacless,
        "text_en": textEn,
      };
}
