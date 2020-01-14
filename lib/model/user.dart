import 'dart:convert';

class User {
  String id;
  String email;
  String firstName;
  String avatarUrl;

  User({
    this.id,
    this.email,
    this.firstName,
    this.avatarUrl,
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => new User(
        id: json["id"] == null ? null : json["id"],
        email: json["email"] == null ? null : json["email"],
        firstName: json["first_name"] == null ? null : json["first_name"],
        avatarUrl: json["avatar_url"] == null ? null : json["avatar_url"],
//    metaData: json["meta_data"] == null ? null : new List<MetaDatum>.from(json["meta_data"].map((x) => MetaDatum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "email": email == null ? null : email,
        "first_name": firstName == null ? null : firstName,
        "avatar_url": avatarUrl == null ? null : avatarUrl,
//    "meta_data": metaData == null ? null : new List<dynamic>.from(metaData.map((x) => x.toMap())),
      };
}

