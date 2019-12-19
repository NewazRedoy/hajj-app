import 'dart:convert';

class DuaSubTopicCategory {
  int duaSubcategory_id;
  String duaSubtopic;

  DuaSubTopicCategory({this.duaSubcategory_id, this.duaSubtopic});

  factory DuaSubTopicCategory.fromRawJson(String str) =>
      DuaSubTopicCategory.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DuaSubTopicCategory.fromJson(Map<String, dynamic> json) =>
      new DuaSubTopicCategory(
        duaSubcategory_id: json["duaSubcategory_id"],
        duaSubtopic: json["duaSubtopic"],
      );

  Map<String, dynamic> toJson() => {
    "duaSubcategory_id": duaSubcategory_id,
    "questiontpic": duaSubtopic,
  };


}
