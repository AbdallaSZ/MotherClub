// To parse this JSON data, do
//
//     final productCategoryModel = productCategoryModelFromMap(jsonString);

import 'dart:convert';

class ProductCategoryModel {
  ProductCategoryModel({
    this.id,
    this.name,
    this.slug,
    this.parent,
    this.description,
    this.display,
    this.image,
    this.menuOrder,
    this.count,
    this.links,
  });

  final int ?id;
  final String? name;
  final String ?slug;
  final int ?parent;
  final String ?description;
  final String ?display;
  final dynamic image;
  final int ?menuOrder;
  final int ?count;
  final Links ?links;

  factory ProductCategoryModel.fromJson(String str) => ProductCategoryModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductCategoryModel.fromMap(Map<String, dynamic> json) => ProductCategoryModel(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    slug: json["slug"] == null ? null : json["slug"],
    parent: json["parent"] == null ? null : json["parent"],
    description: json["description"] == null ? null : json["description"],
    display: json["display"] == null ? null : json["display"],
    image: json["image"],
    menuOrder: json["menu_order"] == null ? null : json["menu_order"],
    count: json["count"] == null ? null : json["count"],
    links: json["_links"] == null ? null : Links.fromMap(json["_links"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "slug": slug == null ? null : slug,
    "parent": parent == null ? null : parent,
    "description": description == null ? null : description,
    "display": display == null ? null : display,
    "image": image,
    "menu_order": menuOrder == null ? null : menuOrder,
    "count": count == null ? null : count,
    "_links": links == null ? null : links!.toMap(),
  };
}

class Links {
  Links({
    this.self,
    this.collection,
  });

  final List<Collection>?self;
  final List<Collection>?collection;

  factory Links.fromJson(String str) => Links.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Links.fromMap(Map<String, dynamic> json) => Links(
    self: json["self"] == null ? null : List<Collection>.from(json["self"].map((x) => Collection.fromMap(x))),
    collection: json["collection"] == null ? null : List<Collection>.from(json["collection"].map((x) => Collection.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "self": self == null ? null : List<dynamic>.from(self!.map((x) => x.toMap())),
    "collection": collection == null ? null : List<dynamic>.from(collection!.map((x) => x.toMap())),
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
