// To parse this JSON data, do
//
//     final cartItemModel = cartItemModelFromMap(jsonString);

import 'dart:convert';

class CartItemModel {
  CartItemModel({
    this.cartHash,
    this.cartKey,
    this.currency,
    this.customer,
    this.items,
    this.itemCount,
    this.itemsWeight,
    this.coupons,
    this.needsPayment,
    this.needsShipping,
    this.shipping,
    this.fees,
    this.taxes,
    this.totals,
    this.removedItems,
    this.crossSells,
    this.notices,
  });

  final String ?cartHash;
  final String ?cartKey;
  final Currency ?currency;
  final Customer ?customer;
  final List<Item> ?items;
  final int ?itemCount;
  final int ?itemsWeight;
  final List<dynamic> ?coupons;
  final bool ?needsPayment;
  final bool ?needsShipping;
  final Shipping ?shipping;
  final List<dynamic> ?fees;
  final List<dynamic> ?taxes;
  final CartItemModelTotals ?totals;
  final List<dynamic> ?removedItems;
  final List<dynamic> ?crossSells;
  final List<dynamic> ?notices;

  factory CartItemModel.fromJson(String str) => CartItemModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CartItemModel.fromMap(Map<String, dynamic> json) => CartItemModel(
    cartHash: json["cart_hash"] == null ? null : json["cart_hash"],
    cartKey: json["cart_key"] == null ? null : json["cart_key"],
    currency: json["currency"] == null ? null : Currency.fromMap(json["currency"]),
    customer: json["customer"] == null ? null : Customer.fromMap(json["customer"]),
    items: json["items"] == null ? null : List<Item>.from(json["items"].map((x) => Item.fromMap(x))),
    itemCount: json["item_count"] == null ? null : json["item_count"],
    itemsWeight: json["items_weight"] == null ? null : json["items_weight"],
    coupons: json["coupons"] == null ? null : List<dynamic>.from(json["coupons"].map((x) => x)),
    needsPayment: json["needs_payment"] == null ? null : json["needs_payment"],
    needsShipping: json["needs_shipping"] == null ? null : json["needs_shipping"],
    shipping: json["shipping"] == null ? null : Shipping.fromMap(json["shipping"]),
    fees: json["fees"] == null ? null : List<dynamic>.from(json["fees"].map((x) => x)),
    taxes: json["taxes"] == null ? null : List<dynamic>.from(json["taxes"].map((x) => x)),
    totals: json["totals"] == null ? null : CartItemModelTotals.fromMap(json["totals"]),
    removedItems: json["removed_items"] == null ? null : List<dynamic>.from(json["removed_items"].map((x) => x)),
    crossSells: json["cross_sells"] == null ? null : List<dynamic>.from(json["cross_sells"].map((x) => x)),
    notices: json["notices"] == null ? null : List<dynamic>.from(json["notices"].map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "cart_hash": cartHash == null ? null : cartHash,
    "cart_key": cartKey == null ? null : cartKey,
    "currency": currency == null ? null : currency!.toMap(),
    "customer": customer == null ? null : customer!.toMap(),
    "items": items == null ? null : List<dynamic>.from(items!.map((x) => x.toMap())),
    "item_count": itemCount == null ? null : itemCount,
    "items_weight": itemsWeight == null ? null : itemsWeight,
    "coupons": coupons == null ? null : List<dynamic>.from(coupons!.map((x) => x)),
    "needs_payment": needsPayment == null ? null : needsPayment,
    "needs_shipping": needsShipping == null ? null : needsShipping,
    "shipping": shipping == null ? null : shipping!.toMap(),
    "fees": fees == null ? null : List<dynamic>.from(fees!.map((x) => x)),
    "taxes": taxes == null ? null : List<dynamic>.from(taxes!.map((x) => x)),
    "totals": totals == null ? null : totals!.toMap(),
    "removed_items": removedItems == null ? null : List<dynamic>.from(removedItems!.map((x) => x)),
    "cross_sells": crossSells == null ? null : List<dynamic>.from(crossSells!.map((x) => x)),
    "notices": notices == null ? null : List<dynamic>.from(notices!.map((x) => x)),
  };
}

class Currency {
  Currency({
    this.currencyCode,
    this.currencySymbol,
    this.currencyMinorUnit,
    this.currencyDecimalSeparator,
    this.currencyThousandSeparator,
    this.currencyPrefix,
    this.currencySuffix,
  });

  final String ?currencyCode;
  final String ?currencySymbol;
  final int ?currencyMinorUnit;
  final String ?currencyDecimalSeparator;
  final String ?currencyThousandSeparator;
  final String ?currencyPrefix;
  final String ?currencySuffix;

  factory Currency.fromJson(String str) => Currency.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Currency.fromMap(Map<String, dynamic> json) => Currency(
    currencyCode: json["currency_code"] == null ? null : json["currency_code"],
    currencySymbol: json["currency_symbol"] == null ? null : json["currency_symbol"],
    currencyMinorUnit: json["currency_minor_unit"] == null ? null : json["currency_minor_unit"],
    currencyDecimalSeparator: json["currency_decimal_separator"] == null ? null : json["currency_decimal_separator"],
    currencyThousandSeparator: json["currency_thousand_separator"] == null ? null : json["currency_thousand_separator"],
    currencyPrefix: json["currency_prefix"] == null ? null : json["currency_prefix"],
    currencySuffix: json["currency_suffix"] == null ? null : json["currency_suffix"],
  );

  Map<String, dynamic> toMap() => {
    "currency_code": currencyCode == null ? null : currencyCode,
    "currency_symbol": currencySymbol == null ? null : currencySymbol,
    "currency_minor_unit": currencyMinorUnit == null ? null : currencyMinorUnit,
    "currency_decimal_separator": currencyDecimalSeparator == null ? null : currencyDecimalSeparator,
    "currency_thousand_separator": currencyThousandSeparator == null ? null : currencyThousandSeparator,
    "currency_prefix": currencyPrefix == null ? null : currencyPrefix,
    "currency_suffix": currencySuffix == null ? null : currencySuffix,
  };
}

class Customer {
  Customer({
    this.billingAddress,
    this.shippingAddress,
  });

  final BillingAddress? billingAddress;
  final ShippingAddress ?shippingAddress;

  factory Customer.fromJson(String str) => Customer.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Customer.fromMap(Map<String, dynamic> json) => Customer(
    billingAddress: json["billing_address"] == null ? null : BillingAddress.fromMap(json["billing_address"]),
    shippingAddress: json["shipping_address"] == null ? null : ShippingAddress.fromMap(json["shipping_address"]),
  );

  Map<String, dynamic> toMap() => {
    "billing_address": billingAddress == null ? null : billingAddress!.toMap(),
    "shipping_address": shippingAddress == null ? null : shippingAddress!.toMap(),
  };
}

class BillingAddress {
  BillingAddress({
    this.billingFirstName,
    this.billingLastName,
    this.billingCountry,
    this.billingAddress1,
    this.billingAddress2,
    this.billingCity,
    this.billingState,
    this.billingPostcode,
    this.billingPhone,
    this.billingEmail,
  });

  final String ?billingFirstName;
  final String ?billingLastName;
  final String ?billingCountry;
  final String ?billingAddress1;
  final String ?billingAddress2;
  final String ?billingCity;
  final String ?billingState;
  final String ?billingPostcode;
  final String ?billingPhone;
  final String ?billingEmail;

  factory BillingAddress.fromJson(String str) => BillingAddress.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BillingAddress.fromMap(Map<String, dynamic> json) => BillingAddress(
    billingFirstName: json["billing_first_name"] == null ? null : json["billing_first_name"],
    billingLastName: json["billing_last_name"] == null ? null : json["billing_last_name"],
    billingCountry: json["billing_country"] == null ? null : json["billing_country"],
    billingAddress1: json["billing_address_1"] == null ? null : json["billing_address_1"],
    billingAddress2: json["billing_address_2"] == null ? null : json["billing_address_2"],
    billingCity: json["billing_city"] == null ? null : json["billing_city"],
    billingState: json["billing_state"] == null ? null : json["billing_state"],
    billingPostcode: json["billing_postcode"] == null ? null : json["billing_postcode"],
    billingPhone: json["billing_phone"] == null ? null : json["billing_phone"],
    billingEmail: json["billing_email"] == null ? null : json["billing_email"],
  );

  Map<String, dynamic> toMap() => {
    "billing_first_name": billingFirstName == null ? null : billingFirstName,
    "billing_last_name": billingLastName == null ? null : billingLastName,
    "billing_country": billingCountry == null ? null : billingCountry,
    "billing_address_1": billingAddress1 == null ? null : billingAddress1,
    "billing_address_2": billingAddress2 == null ? null : billingAddress2,
    "billing_city": billingCity == null ? null : billingCity,
    "billing_state": billingState == null ? null : billingState,
    "billing_postcode": billingPostcode == null ? null : billingPostcode,
    "billing_phone": billingPhone == null ? null : billingPhone,
    "billing_email": billingEmail == null ? null : billingEmail,
  };
}

class ShippingAddress {
  ShippingAddress({
    this.shippingFirstName,
    this.shippingLastName,
    this.shippingCountry,
    this.shippingAddress1,
    this.shippingAddress2,
    this.shippingCity,
    this.shippingState,
    this.shippingPostcode,
  });

  final String ?shippingFirstName;
  final String ?shippingLastName;
  final String ?shippingCountry;
  final String ?shippingAddress1;
  final String ?shippingAddress2;
  final String ?shippingCity;
  final String ?shippingState;
  final String ?shippingPostcode;

  factory ShippingAddress.fromJson(String str) => ShippingAddress.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ShippingAddress.fromMap(Map<String, dynamic> json) => ShippingAddress(
    shippingFirstName: json["shipping_first_name"] == null ? null : json["shipping_first_name"],
    shippingLastName: json["shipping_last_name"] == null ? null : json["shipping_last_name"],
    shippingCountry: json["shipping_country"] == null ? null : json["shipping_country"],
    shippingAddress1: json["shipping_address_1"] == null ? null : json["shipping_address_1"],
    shippingAddress2: json["shipping_address_2"] == null ? null : json["shipping_address_2"],
    shippingCity: json["shipping_city"] == null ? null : json["shipping_city"],
    shippingState: json["shipping_state"] == null ? null : json["shipping_state"],
    shippingPostcode: json["shipping_postcode"] == null ? null : json["shipping_postcode"],
  );

  Map<String, dynamic> toMap() => {
    "shipping_first_name": shippingFirstName == null ? null : shippingFirstName,
    "shipping_last_name": shippingLastName == null ? null : shippingLastName,
    "shipping_country": shippingCountry == null ? null : shippingCountry,
    "shipping_address_1": shippingAddress1 == null ? null : shippingAddress1,
    "shipping_address_2": shippingAddress2 == null ? null : shippingAddress2,
    "shipping_city": shippingCity == null ? null : shippingCity,
    "shipping_state": shippingState == null ? null : shippingState,
    "shipping_postcode": shippingPostcode == null ? null : shippingPostcode,
  };
}

class Item {
  Item({
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
  final int ?id;
  final String ?name;
  final String ?title;
  final String ?price;
  final Quantity ?quantity;
  final TaxData ?taxData;
  final ItemTotals ?totals;
  final String? slug;
  final Meta ?meta;
  final String ?backorders;
  final CartItemData? cartItemData;
  final String ?featuredImage;

  factory Item.fromJson(String str) => Item.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Item.fromMap(Map<String, dynamic> json) => Item(
    itemKey: json["item_key"] == null ? null : json["item_key"],
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    title: json["title"] == null ? null : json["title"],
    price: json["price"] == null ? null : json["price"],
    quantity: json["quantity"] == null ? null : Quantity.fromMap(json["quantity"]),
    taxData: json["tax_data"] == null ? null : TaxData.fromMap(json["tax_data"]),
    totals: json["totals"] == null ? null : ItemTotals.fromMap(json["totals"]),
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

  final String ?attributePaAge;

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
  final MetaVariation ?variation;

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

class ItemTotals {
  ItemTotals({
    this.subtotal,
    this.subtotalTax,
    this.total,
    this.tax,
  });

  final int ?subtotal;
  final int ?subtotalTax;
  final int ?total;
  final int ?tax;

  factory ItemTotals.fromJson(String str) => ItemTotals.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ItemTotals.fromMap(Map<String, dynamic> json) => ItemTotals(
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

class Shipping {
  Shipping({
    this.totalPackages,
    this.showPackageDetails,
    this.hasCalculatedShipping,
    this.packages,
  });

  final int ?totalPackages;
  final bool? showPackageDetails;
  final bool? hasCalculatedShipping;
  final Packages ?packages;

  factory Shipping.fromJson(String str) => Shipping.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Shipping.fromMap(Map<String, dynamic> json) => Shipping(
    totalPackages: json["total_packages"] == null ? null : json["total_packages"],
    showPackageDetails: json["show_package_details"] == null ? null : json["show_package_details"],
    hasCalculatedShipping: json["has_calculated_shipping"] == null ? null : json["has_calculated_shipping"],
    packages: json["packages"] == null ? null : Packages.fromMap(json["packages"]),
  );

  Map<String, dynamic> toMap() => {
    "total_packages": totalPackages == null ? null : totalPackages,
    "show_package_details": showPackageDetails == null ? null : showPackageDetails,
    "has_calculated_shipping": hasCalculatedShipping == null ? null : hasCalculatedShipping,
    "packages": packages == null ? null : packages!.toMap(),
  };
}

class Packages {
  Packages({
    this.packagesDefault,
  });

  final Default ?packagesDefault;

  factory Packages.fromJson(String str) => Packages.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Packages.fromMap(Map<String, dynamic> json) => Packages(
    packagesDefault: json["default"] == null ? null : Default.fromMap(json["default"]),
  );

  Map<String, dynamic> toMap() => {
    "default": packagesDefault == null ? null : packagesDefault!.toMap(),
  };
}

class Default {
  Default({
    this.packageName,
    this.rates,
    this.packageDetails,
    this.index,
    this.chosenMethod,
    this.formattedDestination,
  });

  final String ?packageName;
  final Rates ?rates;
  final String ?packageDetails;
  final int ?index;
  final String ?chosenMethod;
  final String ?formattedDestination;

  factory Default.fromJson(String str) => Default.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Default.fromMap(Map<String, dynamic> json) => Default(
    packageName: json["package_name"] == null ? null : json["package_name"],
    rates: json["rates"] == null ? null : Rates.fromMap(json["rates"]),
    packageDetails: json["package_details"] == null ? null : json["package_details"],
    index: json["index"] == null ? null : json["index"],
    chosenMethod: json["chosen_method"] == null ? null : json["chosen_method"],
    formattedDestination: json["formatted_destination"] == null ? null : json["formatted_destination"],
  );

  Map<String, dynamic> toMap() => {
    "package_name": packageName == null ? null : packageName,
    "rates": rates == null ? null : rates!.toMap(),
    "package_details": packageDetails == null ? null : packageDetails,
    "index": index == null ? null : index,
    "chosen_method": chosenMethod == null ? null : chosenMethod,
    "formatted_destination": formattedDestination == null ? null : formattedDestination,
  };
}

class Rates {
  Rates({
    this.freeShipping1,
    this.flatRate4,
  });

  final FlatRate4 ?freeShipping1;
  final FlatRate4 ?flatRate4;

  factory Rates.fromJson(String str) => Rates.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Rates.fromMap(Map<String, dynamic> json) => Rates(
    freeShipping1: json["free_shipping:1"] == null ? null : FlatRate4.fromMap(json["free_shipping:1"]),
    flatRate4: json["flat_rate:4"] == null ? null : FlatRate4.fromMap(json["flat_rate:4"]),
  );

  Map<String, dynamic> toMap() => {
    "free_shipping:1": freeShipping1 == null ? null : freeShipping1!.toMap(),
    "flat_rate:4": flatRate4 == null ? null : flatRate4!.toMap(),
  };
}

class FlatRate4 {
  FlatRate4({
    this.key,
    this.methodId,
    this.instanceId,
    this.label,
    this.cost,
    this.html,
    this.taxes,
    this.chosenMethod,
  });

  final String ?key;
  final String ?methodId;
  final int ?instanceId;
  final String ?label;
  final String ?cost;
  final String ?html;
  final List<dynamic> ?taxes;
  final bool ?chosenMethod;

  factory FlatRate4.fromJson(String str) => FlatRate4.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FlatRate4.fromMap(Map<String, dynamic> json) => FlatRate4(
    key: json["key"] == null ? null : json["key"],
    methodId: json["method_id"] == null ? null : json["method_id"],
    instanceId: json["instance_id"] == null ? null : json["instance_id"],
    label: json["label"] == null ? null : json["label"],
    cost: json["cost"] == null ? null : json["cost"],
    html: json["html"] == null ? null : json["html"],
    taxes: json["taxes"] == null ? null : List<dynamic>.from(json["taxes"].map((x) => x)),
    chosenMethod: json["chosen_method"] == null ? null : json["chosen_method"],
  );

  Map<String, dynamic> toMap() => {
    "key": key == null ? null : key,
    "method_id": methodId == null ? null : methodId,
    "instance_id": instanceId == null ? null : instanceId,
    "label": label == null ? null : label,
    "cost": cost == null ? null : cost,
    "html": html == null ? null : html,
    "taxes": taxes == null ? null : List<dynamic>.from(taxes!.map((x) => x)),
    "chosen_method": chosenMethod == null ? null : chosenMethod,
  };
}

class CartItemModelTotals {
  CartItemModelTotals({
    this.subtotal,
    this.subtotalTax,
    this.feeTotal,
    this.feeTax,
    this.discountTotal,
    this.discountTax,
    this.shippingTotal,
    this.shippingTax,
    this.total,
    this.totalTax,
  });

  final String ?subtotal;
  final String ?subtotalTax;
  final String ?feeTotal;
  final String ?feeTax;
  final String ?discountTotal;
  final String ?discountTax;
  final String ?shippingTotal;
  final String ?shippingTax;
  final String ?total;
  final String ?totalTax;

  factory CartItemModelTotals.fromJson(String str) => CartItemModelTotals.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CartItemModelTotals.fromMap(Map<String, dynamic> json) => CartItemModelTotals(
    subtotal: json["subtotal"] == null ? null : json["subtotal"],
    subtotalTax: json["subtotal_tax"] == null ? null : json["subtotal_tax"],
    feeTotal: json["fee_total"] == null ? null : json["fee_total"],
    feeTax: json["fee_tax"] == null ? null : json["fee_tax"],
    discountTotal: json["discount_total"] == null ? null : json["discount_total"],
    discountTax: json["discount_tax"] == null ? null : json["discount_tax"],
    shippingTotal: json["shipping_total"] == null ? null : json["shipping_total"],
    shippingTax: json["shipping_tax"] == null ? null : json["shipping_tax"],
    total: json["total"] == null ? null : json["total"],
    totalTax: json["total_tax"] == null ? null : json["total_tax"],
  );

  Map<String, dynamic> toMap() => {
    "subtotal": subtotal == null ? null : subtotal,
    "subtotal_tax": subtotalTax == null ? null : subtotalTax,
    "fee_total": feeTotal == null ? null : feeTotal,
    "fee_tax": feeTax == null ? null : feeTax,
    "discount_total": discountTotal == null ? null : discountTotal,
    "discount_tax": discountTax == null ? null : discountTax,
    "shipping_total": shippingTotal == null ? null : shippingTotal,
    "shipping_tax": shippingTax == null ? null : shippingTax,
    "total": total == null ? null : total,
    "total_tax": totalTax == null ? null : totalTax,
  };
}
