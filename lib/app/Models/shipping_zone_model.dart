// To parse this JSON data, do
//
//     final shippingZoneModel = shippingZoneModelFromMap(jsonString);

import 'dart:convert';

class ShippingZoneModel {
  ShippingZoneModel({
    this.id,
    this.name,
    this.order,
    this.links,
  });

  final int ?id;
  final String ?name;
  final int ?order;
  final Links? links;

  factory ShippingZoneModel.fromJson(String str) => ShippingZoneModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ShippingZoneModel.fromMap(Map<String, dynamic> json) => ShippingZoneModel(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    order: json["order"] == null ? null : json["order"],
    links: json["_links"] == null ? null : Links.fromMap(json["_links"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "order": order == null ? null : order,
    "_links": links == null ? null : links!.toMap(),
  };
}

class Links {
  Links({
    this.self,
    this.collection,
    this.describedby,
  });

  final List<Collection>? self;
  final List<Collection>? collection;
  final List<Collection>? describedby;

  factory Links.fromJson(String str) => Links.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Links.fromMap(Map<String, dynamic> json) => Links(
    self: json["self"] == null ? null : List<Collection>.from(json["self"].map((x) => Collection.fromMap(x))),
    collection: json["collection"] == null ? null : List<Collection>.from(json["collection"].map((x) => Collection.fromMap(x))),
    describedby: json["describedby"] == null ? null : List<Collection>.from(json["describedby"].map((x) => Collection.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "self": self == null ? null : List<dynamic>.from(self!.map((x) => x.toMap())),
    "collection": collection == null ? null : List<dynamic>.from(collection!.map((x) => x.toMap())),
    "describedby": describedby == null ? null : List<dynamic>.from(describedby!.map((x) => x.toMap())),
  };
}

class Collection {
  Collection({
    this.href,
  });

  final String? href;

  factory Collection.fromJson(String str) => Collection.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Collection.fromMap(Map<String, dynamic> json) => Collection(
    href: json["href"] == null ? null : json["href"],
  );

  Map<String, dynamic> toMap() => {
    "href": href == null ? null : href,
  };
}
