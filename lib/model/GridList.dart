import 'dart:convert';
class Guide {
String GuideID;
int CollectionID;
String name_en;

    Guide({
  this.GuideID,
      this.CollectionID,
      this.name_en,
});

factory Guide.fromRawJson(String str) => Guide.fromJson(json.decode(str));

String toRawJson() => json.encode(toJson());

factory Guide.fromJson(Map<String, dynamic> json) => new Guide(
  CollectionID: json["CollectionID"],
  GuideID: json["BookID"],
  name_en: json["name_en"],
);

Map<String, dynamic> toJson() => {
  "BookID": GuideID,
  "CollectionID": CollectionID,
  "name_en": name_en,
};
}