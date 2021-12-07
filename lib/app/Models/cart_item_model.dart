// To parse this JSON data, do
//
//     final cartItemModel = cartItemModelFromMap(jsonString);

import 'dart:convert';

class CartItemModel {
  CartItemModel({
    this.itemKey,
    this.id,
    this.name,
    this.title,
    this.price,
    this.quantity,
    this.taxData,
    this.totals,
    this.slug,
    this.meta,
    this.backorders,
    this.cartItemData,
    this.featuredImage,
  });

  final String ?itemKey;
  final int? id;
  final String? name;
  final String ?title;
  final String ?price;
  final Quantity ?quantity;
  final TaxData ?taxData;
  final Totals? totals;
  final String ?slug;
  final Meta ?meta;
  final String ?backorders;
  final CartItemData ?cartItemData;
  final String ?featuredImage;

  factory CartItemModel.fromJson(String str) => CartItemModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CartItemModel.fromMap(Map<String, dynamic> json) => CartItemModel(
    itemKey: json["item_key"] == null ? null : json["item_key"],
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    title: json["title"] == null ? null : json["title"],
    price: json["price"] == null ? null : json["price"],
    quantity: json["quantity"] == null ? null : Quantity.fromMap(json["quantity"]),
    taxData: json["tax_data"] == null ? null : TaxData.fromMap(json["tax_data"]),
    totals: json["totals"] == null ? null : Totals.fromMap(json["totals"]),
    slug: json["slug"] == null ? null : json["slug"],
    meta: json["meta"] == null ? null : Meta.fromMap(json["meta"]),
    backorders: json["backorders"] == null ? null : json["backorders"],
    cartItemData: json["cart_item_data"] == null ? null : CartItemData.fromMap(json["cart_item_data"]),
    featuredImage: json["featured_image"] == null ? null : json["featured_image"],
  );

  Map<String, dynamic> toMap() => {
    "item_key": itemKey == null ? null : itemKey,
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "title": title == null ? null : title,
    "price": price == null ? null : price,
    "quantity": quantity == null ? null : quantity!.toMap(),
    "tax_data": taxData == null ? null : taxData!.toMap(),
    "totals": totals == null ? null : totals!.toMap(),
    "slug": slug == null ? null : slug,
    "meta": meta == null ? null : meta!.toMap(),
    "backorders": backorders == null ? null : backorders,
    "cart_item_data": cartItemData == null ? null : cartItemData!.toMap(),
    "featured_image": featuredImage == null ? null : featuredImage,
  };
}

class CartItemData {
  CartItemData({
    this.tinvwlFormdata,
  });

  final TinvwlFormdata ?tinvwlFormdata;

  factory CartItemData.fromJson(String str) => CartItemData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CartItemData.fromMap(Map<String, dynamic> json) => CartItemData(
    tinvwlFormdata: json["tinvwl_formdata"] == null ? null : TinvwlFormdata.fromMap(json["tinvwl_formdata"]),
  );

  Map<String, dynamic> toMap() => {
    "tinvwl_formdata": tinvwlFormdata == null ? null : tinvwlFormdata!.toMap(),
  };
}

class TinvwlFormdata {
  TinvwlFormdata({
    this.id,
    this.variation,
  });

  final String ?id;
  final TinvwlFormdataVariation ?variation;

  factory TinvwlFormdata.fromJson(String str) => TinvwlFormdata.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TinvwlFormdata.fromMap(Map<String, dynamic> json) => TinvwlFormdata(
    id: json["id"] == null ? null : json["id"],
    variation: json["variation"] == null ? null : TinvwlFormdataVariation.fromMap(json["variation"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "variation": variation == null ? null : variation!.toMap(),
  };
}

class TinvwlFormdataVariation {
  TinvwlFormdataVariation({
    this.attributePaAge,
  });

  final String? attributePaAge;

  factory TinvwlFormdataVariation.fromJson(String str) => TinvwlFormdataVariation.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TinvwlFormdataVariation.fromMap(Map<String, dynamic> json) => TinvwlFormdataVariation(
    attributePaAge: json["attribute_pa_age"] == null ? null : json["attribute_pa_age"],
  );

  Map<String, dynamic> toMap() => {
    "attribute_pa_age": attributePaAge == null ? null : attributePaAge,
  };
}

class Meta {
  Meta({
    this.productType,
    this.sku,
    this.dimensions,
    this.weight,
    this.variation,
  });

  final String ?productType;
  final String ?sku;
  final Dimensions ?dimensions;
  final int ?weight;
  final MetaVariation? variation;

  factory Meta.fromJson(String str) => Meta.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Meta.fromMap(Map<String, dynamic> json) => Meta(
    productType: json["product_type"] == null ? null : json["product_type"],
    sku: json["sku"] == null ? null : json["sku"],
    dimensions: json["dimensions"] == null ? null : Dimensions.fromMap(json["dimensions"]),
    weight: json["weight"] == null ? null : json["weight"],
    variation: json["variation"] == null ? null : MetaVariation.fromMap(json["variation"]),
  );

  Map<String, dynamic> toMap() => {
    "product_type": productType == null ? null : productType,
    "sku": sku == null ? null : sku,
    "dimensions": dimensions == null ? null : dimensions!.toMap(),
    "weight": weight == null ? null : weight,
    "variation": variation == null ? null : variation!.toMap(),
  };
}

class Dimensions {
  Dimensions({
    this.length,
    this.width,
    this.height,
    this.unit,
  });

  final String ?length;
  final String ?width;
  final String ?height;
  final String ?unit;

  factory Dimensions.fromJson(String str) => Dimensions.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Dimensions.fromMap(Map<String, dynamic> json) => Dimensions(
    length: json["length"] == null ? null : json["length"],
    width: json["width"] == null ? null : json["width"],
    height: json["height"] == null ? null : json["height"],
    unit: json["unit"] == null ? null : json["unit"],
  );

  Map<String, dynamic> toMap() => {
    "length": length == null ? null : length,
    "width": width == null ? null : width,
    "height": height == null ? null : height,
    "unit": unit == null ? null : unit,
  };
}

class MetaVariation {
  MetaVariation({
    this.age,
  });

  final String ?age;

  factory MetaVariation.fromJson(String str) => MetaVariation.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MetaVariation.fromMap(Map<String, dynamic> json) => MetaVariation(
    age: json["Age"] == null ? null : json["Age"],
  );

  Map<String, dynamic> toMap() => {
    "Age": age == null ? null : age,
  };
}

class Quantity {
  Quantity({
    this.value,
    this.minPurchase,
    this.maxPurchase,
  });

  final int ?value;
  final int ?minPurchase;
  final int ?maxPurchase;

  factory Quantity.fromJson(String str) => Quantity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Quantity.fromMap(Map<String, dynamic> json) => Quantity(
    value: json["value"] == null ? null : json["value"],
    minPurchase: json["min_purchase"] == null ? null : json["min_purchase"],
    maxPurchase: json["max_purchase"] == null ? null : json["max_purchase"],
  );

  Map<String, dynamic> toMap() => {
    "value": value == null ? null : value,
    "min_purchase": minPurchase == null ? null : minPurchase,
    "max_purchase": maxPurchase == null ? null : maxPurchase,
  };
}

class TaxData {
  TaxData({
    this.subtotal,
    this.total,
  });

  final List<dynamic> ?subtotal;
  final List<dynamic> ?total;

  factory TaxData.fromJson(String str) => TaxData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TaxData.fromMap(Map<String, dynamic> json) => TaxData(
    subtotal: json["subtotal"] == null ? null : List<dynamic>.from(json["subtotal"].map((x) => x)),
    total: json["total"] == null ? null : List<dynamic>.from(json["total"].map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "subtotal": subtotal == null ? null : List<dynamic>.from(subtotal!.map((x) => x)),
    "total": total == null ? null : List<dynamic>.from(total!.map((x) => x)),
  };
}

class Totals {
  Totals({
    this.subtotal,
    this.subtotalTax,
    this.total,
    this.tax,
  });

  final int ?subtotal;
  final int ?subtotalTax;
  final int ?total;
  final int ?tax;

  factory Totals.fromJson(String str) => Totals.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Totals.fromMap(Map<String, dynamic> json) => Totals(
    subtotal: json["subtotal"] == null ? null : json["subtotal"],
    subtotalTax: json["subtotal_tax"] == null ? null : json["subtotal_tax"],
    total: json["total"] == null ? null : json["total"],
    tax: json["tax"] == null ? null : json["tax"],
  );

  Map<String, dynamic> toMap() => {
    "subtotal": subtotal == null ? null : subtotal,
    "subtotal_tax": subtotalTax == null ? null : subtotalTax,
    "total": total == null ? null : total,
    "tax": tax == null ? null : tax,
  };
}
