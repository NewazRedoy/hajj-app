import 'dart:convert';

class User {
  int id;
  String email;
  String firstName;
  String lastName;
  String username;
  String avatarUrl;

  User({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.username,
    this.avatarUrl,
//    this.metaData,
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => new User(
        id: json["id"] == null ? null : json["id"],
        email: json["email"] == null ? null : json["email"],
        firstName: json["first_name"] == null ? null : json["first_name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        username: json["username"] == null ? null : json["username"],
        avatarUrl: json["avatar_url"] == null ? null : json["avatar_url"],
//    metaData: json["meta_data"] == null ? null : new List<MetaDatum>.from(json["meta_data"].map((x) => MetaDatum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "email": email == null ? null : email,
        "first_name": firstName == null ? null : firstName,
        "last_name": lastName == null ? null : lastName,
        "username": username == null ? null : username,
        "avatar_url": avatarUrl == null ? null : avatarUrl,
//    "meta_data": metaData == null ? null : new List<dynamic>.from(metaData.map((x) => x.toMap())),
      };
}

class Address {
  String firstName;
  String lastName;
  String company;
  String address1;
  String address2;
  String city;
  String postcode;
  String country;
  String state;
  String email;
  String phone;

  Address({
    this.firstName,
    this.lastName,
    this.company,
    this.address1,
    this.address2,
    this.city,
    this.postcode,
    this.country,
    this.state,
    this.email,
    this.phone,
  });

  factory Address.fromJson(String str) => Address.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Address.fromMap(Map<String, dynamic> json) => new Address(
        firstName: json["first_name"] == null ? "" : json["first_name"],
        lastName: json["last_name"] == null ? "" : json["last_name"],
        company: json["company"] == null ? "" : json["company"],
        address1: json["address_1"] == null ? "" : json["address_1"],
        address2: json["address_2"] == null ? "" : json["address_2"],
        city: json["city"] == null ? "" : json["city"],
        postcode: json["postcode"] == null ? "" : json["postcode"],
        country: json["country"] == null ? "" : json["country"],
        state: json["state"] == null ? "" : json["state"],
        email: json["email"] == null ? "" : json["email"],
        phone: json["phone"] == null ? "" : json["phone"],
      );

  Map<String, dynamic> toMap() => {
        "first_name": firstName == null ? "" : firstName,
        "last_name": lastName == null ? "" : lastName,
        "company": company == null ? "" : company,
        "address_1": address1 == null ? "" : address1,
        "address_2": address2 == null ? "" : address2,
        "city": city == null ? "" : city,
        "postcode": postcode == null ? "" : postcode,
        "country": country == null ? "" : country,
        "state": state == null ? "" : state,
        "email": email == null ? "" : email,
        "phone": phone == null ? "" : phone,
      };
}

class MetaDatum {
  int id;
  String key;
  dynamic value;

  MetaDatum({
    this.id,
    this.key,
    this.value,
  });

  factory MetaDatum.fromJson(String str) => MetaDatum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MetaDatum.fromMap(Map<String, dynamic> json) => new MetaDatum(
        id: json["id"] == null ? null : json["id"],
        key: json["key"] == null ? null : json["key"],
        value: json["value"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "key": key == null ? null : key,
        "value": value,
      };
}

class ValueClass {
  String ip;
  String side;
  String normal;
  String advanced;

  ValueClass({
    this.ip,
    this.side,
    this.normal,
    this.advanced,
  });

  factory ValueClass.fromJson(String str) =>
      ValueClass.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ValueClass.fromMap(Map<String, dynamic> json) => new ValueClass(
        ip: json["ip"] == null ? null : json["ip"],
        side: json["side"] == null ? null : json["side"],
        normal: json["normal"] == null ? null : json["normal"],
        advanced: json["advanced"] == null ? null : json["advanced"],
      );

  Map<String, dynamic> toMap() => {
        "ip": ip == null ? null : ip,
        "side": side == null ? null : side,
        "normal": normal == null ? null : normal,
        "advanced": advanced == null ? null : advanced,
      };
}
