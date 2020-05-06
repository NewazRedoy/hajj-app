import 'dart:convert';

import 'package:hajjapp/repository/RepositoryInterface.dart';

class SearchItem {
  PageViewType viewtype;
  String description;
  Object item;

  SearchItem(this.name, this.description, this.viewtype, this.item);

  String name;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        "viewtype": viewtype,
        "description": description,
        "name": name,
      };
}
