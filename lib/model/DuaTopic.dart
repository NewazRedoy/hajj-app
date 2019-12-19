import 'dart:convert';

class DuaTopic {
  int duatopic_id;
  String duatopic;

  DuaTopic({this.duatopic_id, this.duatopic});

  factory DuaTopic.fromRawJson(String str) =>
      DuaTopic.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DuaTopic.fromJson(Map<String, dynamic> json) =>
      new DuaTopic(
        duatopic_id: json["duatopic_id"],
        duatopic: json["duatopic"],
      );

  Map<String, dynamic> toJson() => {
    "duatopic_id": duatopic_id,
    "duatopic": duatopic,
  };


}
