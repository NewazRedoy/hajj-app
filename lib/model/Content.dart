import 'dart:convert';

class Content {
  int id;
  int topic_id;
  int subtopic_id;
  int content_id;
  String text;
  String title;
  String reference;
  String video_url;
  String image;

  Content({
    this.id,
    this.subtopic_id,
    this.topic_id,
    this.content_id,
    this.video_url,
    this.reference,
    this.image,
    this.title,
    this.text,
  });

  factory Content.fromJson(String str) => Content.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Content.fromMap(Map<String, dynamic> json) => new Content(
        id: json["rowid"],
        subtopic_id: json["subtopic_id"],
        topic_id: json["topic_id"],
        content_id: json["content_id"],
        video_url: json["video_url"],
        reference: json["reference"],
        image: json["image"],
        title: json["title"],
        text: json["text"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "subtopic_id": subtopic_id,
        "topic_id": topic_id,
        "content_id": content_id,
        "video_url": video_url,
        "reference": reference,
        "image": image,
        "title": title,
        "text": text,
      };

}
