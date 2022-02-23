// To parse this JSON data, do
//
//     final shippingCostModel = shippingCostModelFromMap(jsonString);

import 'dart:convert';

class ShippingCostModel {
  ShippingCostModel({
    this.id,
    this.instanceId,
    this.title,
    this.order,
    this.enabled,
    this.methodId,
    this.methodTitle,
    this.methodDescription,
    this.settings,
    this.links,
  });

  final int ?id;
  final int ?instanceId;
  final String ?title;
  final int ?order;
  final bool? enabled;
  final String ?methodId;
  final String? methodTitle;
  final String? methodDescription;
  final Settings ?settings;
  final Links ?links;

  factory ShippingCostModel.fromJson(String str) => ShippingCostModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ShippingCostModel.fromMap(Map<String, dynamic> json) => ShippingCostModel(
    id: json["id"] == null ? null : json["id"],
    instanceId: json["instance_id"] == null ? null : json["instance_id"],
    title: json["title"] == null ? null : json["title"],
    order: json["order"] == null ? null : json["order"],
    enabled: json["enabled"] == null ? null : json["enabled"],
    methodId: json["method_id"] == null ? null : json["method_id"],
    methodTitle: json["method_title"] == null ? null : json["method_title"],
    methodDescription: json["method_description"] == null ? null : json["method_description"],
    settings: json["settings"] == null ? null : Settings.fromMap(json["settings"]),
    links: json["_links"] == null ? null : Links.fromMap(json["_links"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "instance_id": instanceId == null ? null : instanceId,
    "title": title == null ? null : title,
    "order": order == null ? null : order,
    "enabled": enabled == null ? null : enabled,
    "method_id": methodId == null ? null : methodId,
    "method_title": methodTitle == null ? null : methodTitle,
    "method_description": methodDescription == null ? null : methodDescription,
    "settings": settings == null ? null : settings?.toMap(),
    "_links": links == null ? null : links?.toMap(),
  };
}

class Links {
  Links({
    this.self,
    this.collection,
    this.describes,
  });

  final List<Collection> ?self;
  final List<Collection> ?collection;
  final List<Collection> ?describes;

  factory Links.fromJson(String str) => Links.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Links.fromMap(Map<String, dynamic> json) => Links(
    self: json["self"] == null ? null : List<Collection>.from(json["self"].map((x) => Collection.fromMap(x))),
    collection: json["collection"] == null ? null : List<Collection>.from(json["collection"].map((x) => Collection.fromMap(x))),
    describes: json["describes"] == null ? null : List<Collection>.from(json["describes"].map((x) => Collection.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "self": self == null ? null : List<dynamic>.from(self!.map((x) => x.toMap())),
    "collection": collection == null ? null : List<dynamic>.from(collection!.map((x) => x.toMap())),
    "describes": describes == null ? null : List<dynamic>.from(describes!.map((x) => x.toMap())),
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

class Settings {
  Settings({
    this.title,
    this.requires,
    this.minAmount,
    this.ignoreDiscounts,
    this.taxStatus,
    this.cost,
  });

  final Cost ?title;
  final Cost ?requires;
  final Cost ?minAmount;
  final Cost ?ignoreDiscounts;
  final Cost ?taxStatus;
  final Cost ?cost;

  factory Settings.fromJson(String str) => Settings.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Settings.fromMap(Map<String, dynamic> json) => Settings(
    title: json["title"] == null ? null : Cost.fromMap(json["title"]),
    requires: json["requires"] == null ? null : Cost.fromMap(json["requires"]),
    minAmount: json["min_amount"] == null ? null : Cost.fromMap(json["min_amount"]),
    ignoreDiscounts: json["ignore_discounts"] == null ? null : Cost.fromMap(json["ignore_discounts"]),
    taxStatus: json["tax_status"] == null ? null : Cost.fromMap(json["tax_status"]),
    cost: json["cost"] == null ? null : Cost.fromMap(json["cost"]),
  );

  Map<String, dynamic> toMap() => {
    "title": title == null ? null : title?.toMap(),
    "requires": requires == null ? null : requires?.toMap(),
    "min_amount": minAmount == null ? null : minAmount?.toMap(),
    "ignore_discounts": ignoreDiscounts == null ? null : ignoreDiscounts?.toMap(),
    "tax_status": taxStatus == null ? null : taxStatus?.toMap(),
    "cost": cost == null ? null : cost?.toMap(),
  };
}

class Cost {
  Cost({
    this.id,
    this.label,
    this.description,
    this.type,
    this.value,
    this.costDefault,
    this.tip,
    this.placeholder,
    this.options,
  });

  final String ?id;
  final String ?label;
  final String ?description;
  final String ?type;
  final String ?value;
  final String ?costDefault;
  final String ?tip;
  final String ?placeholder;
  final Options? options;

  factory Cost.fromJson(String str) => Cost.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Cost.fromMap(Map<String, dynamic> json) => Cost(
    id: json["id"] == null ? null : json["id"],
    label: json["label"] == null ? null : json["label"],
    description: json["description"] == null ? null : json["description"],
    type: json["type"] == null ? null : json["type"],
    value: json["value"] == null ? null : json["value"],
    costDefault: json["default"] == null ? null : json["default"],
    tip: json["tip"] == null ? null : json["tip"],
    placeholder: json["placeholder"] == null ? null : json["placeholder"],
    options: json["options"] == null ? null : Options.fromMap(json["options"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "label": label == null ? null : label,
    "description": description == null ? null : description,
    "type": type == null ? null : type,
    "value": value == null ? null : value,
    "default": costDefault == null ? null : costDefault,
    "tip": tip == null ? null : tip,
    "placeholder": placeholder == null ? null : placeholder,
    "options": options == null ? null : options?.toMap(),
  };
}

class Options {
  Options({
    this.empty,
    this.coupon,
    this.minAmount,
    this.either,
    this.both,
    this.taxable,
    this.none,
  });

  final String ?empty;
  final String ?coupon;
  final String ?minAmount;
  final String ?either;
  final String ?both;
  final String ?taxable;
  final String ?none;

  factory Options.fromJson(String str) => Options.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Options.fromMap(Map<String, dynamic> json) => Options(
    empty: json[""] == null ? null : json[""],
    coupon: json["coupon"] == null ? null : json["coupon"],
    minAmount: json["min_amount"] == null ? null : json["min_amount"],
    either: json["either"] == null ? null : json["either"],
    both: json["both"] == null ? null : json["both"],
    taxable: json["taxable"] == null ? null : json["taxable"],
    none: json["none"] == null ? null : json["none"],
  );

  Map<String, dynamic> toMap() => {
    "": empty == null ? null : empty,
    "coupon": coupon == null ? null : coupon,
    "min_amount": minAmount == null ? null : minAmount,
    "either": either == null ? null : either,
    "both": both == null ? null : both,
    "taxable": taxable == null ? null : taxable,
    "none": none == null ? null : none,
  };
}
