import 'dart:convert';

class Content {
  int topic_id;
  int subtopic_id;
  int content_id;
  String text;
  String textAr;
  String reference;
  String video_url;
  String image;

  Content({
    this.subtopic_id,
    this.topic_id,
    this.content_id,
    this.video_url,
    this.reference,
    this.image,
    this.textAr,
    this.text,
  });

  factory Content.fromJson(String str) => Content.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Content.fromMap(Map<String, dynamic> json) => new Content(
        subtopic_id: json["subtopic_id"],
        topic_id: json["topic_id"],
        content_id: json["content_id"],
        video_url: json["video_url"],
        reference: json["reference"],
        image: json["image"],
        textAr: json["text_ar"],
        text: json["text"],
      );

  Map<String, dynamic> toMap() => {
        "subtopic_id": subtopic_id,
        "topic_id": topic_id,
        "content_id": content_id,
        "video_url": video_url,
        "reference": reference,
        "image": image,
        "text_ar": textAr,
        "text": text,
      };
}
