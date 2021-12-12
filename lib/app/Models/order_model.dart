// To parse this JSON data, do
//
//     final orderModel = orderModelFromMap(jsonString);

import 'dart:convert';

class OrderModel {
  OrderModel({
    this.id,
    this.parentId,
    this.status,
    this.currency,
    this.version,
    this.pricesIncludeTax,
    this.dateCreated,
    this.dateModified,
    this.discountTotal,
    this.discountTax,
    this.shippingTotal,
    this.shippingTax,
    this.cartTax,
    this.total,
    this.totalTax,
    this.customerId,
    this.orderKey,
    this.billing,
    this.shipping,
    this.paymentMethod,
    this.paymentMethodTitle,
    this.transactionId,
    this.customerIpAddress,
    this.customerUserAgent,
    this.createdVia,
    this.customerNote,
    this.dateCompleted,
    this.datePaid,
    this.cartHash,
    this.number,
    this.metaData,
    this.lineItems,
    this.taxLines,
    this.shippingLines,
    this.feeLines,
    this.couponLines,
    this.refunds,
    this.dateCreatedGmt,
    this.dateModifiedGmt,
    this.dateCompletedGmt,
    this.datePaidGmt,
    this.currencySymbol,
    this.links,
  });

  final int ?id;
  final int ?parentId;
  final String ?status;
  final String ?currency;
  final String ?version;
  final bool ?pricesIncludeTax;
  final DateTime ?dateCreated;
  final DateTime ?dateModified;
  final String ?discountTotal;
  final String ?discountTax;
  final String ?shippingTotal;
  final String ?shippingTax;
  final String ?cartTax;
  final String ?total;
  final String ?totalTax;
  final int ?customerId;
  final String ?orderKey;
  final Ing ?billing;
  final Ing ?shipping;
  final String ?paymentMethod;
  final String ?paymentMethodTitle;
  final String ?transactionId;
  final String ?customerIpAddress;
  final String ?customerUserAgent;
  final String ?createdVia;
  final String ?customerNote;
  final dynamic dateCompleted;
  final DateTime ?datePaid;
  final String ?cartHash;
  final String ?number;
  final List<OrderModelMetaDatum> ?metaData;
  final List<LineItem> ?lineItems;
  final List<dynamic> ?taxLines;
  final List<ShippingLine> ?shippingLines;
  final List<dynamic> ?feeLines;
  final List<dynamic> ?couponLines;
  final List<dynamic> ?refunds;
  final DateTime ?dateCreatedGmt;
  final DateTime ?dateModifiedGmt;
  final dynamic dateCompletedGmt;
  final DateTime ?datePaidGmt;
  final String ?currencySymbol;
  final Links ?links;

  factory OrderModel.fromJson(String str) => OrderModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderModel.fromMap(Map<String, dynamic> json) => OrderModel(
    id: json["id"] == null ? null : json["id"],
    parentId: json["parent_id"] == null ? null : json["parent_id"],
    status: json["status"] == null ? null : json["status"],
    currency: json["currency"] == null ? null : json["currency"],
    version: json["version"] == null ? null : json["version"],
    pricesIncludeTax: json["prices_include_tax"] == null ? null : json["prices_include_tax"],
    dateCreated: json["date_created"] == null ? null : DateTime.parse(json["date_created"]),
    dateModified: json["date_modified"] == null ? null : DateTime.parse(json["date_modified"]),
    discountTotal: json["discount_total"] == null ? null : json["discount_total"],
    discountTax: json["discount_tax"] == null ? null : json["discount_tax"],
    shippingTotal: json["shipping_total"] == null ? null : json["shipping_total"],
    shippingTax: json["shipping_tax"] == null ? null : json["shipping_tax"],
    cartTax: json["cart_tax"] == null ? null : json["cart_tax"],
    total: json["total"] == null ? null : json["total"],
    totalTax: json["total_tax"] == null ? null : json["total_tax"],
    customerId: json["customer_id"] == null ? null : json["customer_id"],
    orderKey: json["order_key"] == null ? null : json["order_key"],
    billing: json["billing"] == null ? null : Ing.fromMap(json["billing"]),
    shipping: json["shipping"] == null ? null : Ing.fromMap(json["shipping"]),
    paymentMethod: json["payment_method"] == null ? null : json["payment_method"],
    paymentMethodTitle: json["payment_method_title"] == null ? null : json["payment_method_title"],
    transactionId: json["transaction_id"] == null ? null : json["transaction_id"],
    customerIpAddress: json["customer_ip_address"] == null ? null : json["customer_ip_address"],
    customerUserAgent: json["customer_user_agent"] == null ? null : json["customer_user_agent"],
    createdVia: json["created_via"] == null ? null : json["created_via"],
    customerNote: json["customer_note"] == null ? null : json["customer_note"],
    dateCompleted: json["date_completed"],
    datePaid: json["date_paid"] == null ? null : DateTime.parse(json["date_paid"]),
    cartHash: json["cart_hash"] == null ? null : json["cart_hash"],
    number: json["number"] == null ? null : json["number"],
    metaData: json["meta_data"] == null ? null : List<OrderModelMetaDatum>.from(json["meta_data"].map((x) => OrderModelMetaDatum.fromMap(x))),
    lineItems: json["line_items"] == null ? null : List<LineItem>.from(json["line_items"].map((x) => LineItem.fromMap(x))),
    taxLines: json["tax_lines"] == null ? null : List<dynamic>.from(json["tax_lines"].map((x) => x)),
    shippingLines: json["shipping_lines"] == null ? null : List<ShippingLine>.from(json["shipping_lines"].map((x) => ShippingLine.fromMap(x))),
    feeLines: json["fee_lines"] == null ? null : List<dynamic>.from(json["fee_lines"].map((x) => x)),
    couponLines: json["coupon_lines"] == null ? null : List<dynamic>.from(json["coupon_lines"].map((x) => x)),
    refunds: json["refunds"] == null ? null : List<dynamic>.from(json["refunds"].map((x) => x)),
    dateCreatedGmt: json["date_created_gmt"] == null ? null : DateTime.parse(json["date_created_gmt"]),
    dateModifiedGmt: json["date_modified_gmt"] == null ? null : DateTime.parse(json["date_modified_gmt"]),
    dateCompletedGmt: json["date_completed_gmt"],
    datePaidGmt: json["date_paid_gmt"] == null ? null : DateTime.parse(json["date_paid_gmt"]),
    currencySymbol: json["currency_symbol"] == null ? null : json["currency_symbol"],
    links: json["_links"] == null ? null : Links.fromMap(json["_links"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "parent_id": parentId == null ? null : parentId,
    "status": status == null ? null : status,
    "currency": currency == null ? null : currency,
    "version": version == null ? null : version,
    "prices_include_tax": pricesIncludeTax == null ? null : pricesIncludeTax,
    "date_created": dateCreated == null ? null : dateCreated!.toIso8601String(),
    "date_modified": dateModified == null ? null : dateModified!.toIso8601String(),
    "discount_total": discountTotal == null ? null : discountTotal,
    "discount_tax": discountTax == null ? null : discountTax,
    "shipping_total": shippingTotal == null ? null : shippingTotal,
    "shipping_tax": shippingTax == null ? null : shippingTax,
    "cart_tax": cartTax == null ? null : cartTax,
    "total": total == null ? null : total,
    "total_tax": totalTax == null ? null : totalTax,
    "customer_id": customerId == null ? null : customerId,
    "order_key": orderKey == null ? null : orderKey,
    "billing": billing == null ? null : billing!.toMap(),
    "shipping": shipping == null ? null : shipping!.toMap(),
    "payment_method": paymentMethod == null ? null : paymentMethod,
    "payment_method_title": paymentMethodTitle == null ? null : paymentMethodTitle,
    "transaction_id": transactionId == null ? null : transactionId,
    "customer_ip_address": customerIpAddress == null ? null : customerIpAddress,
    "customer_user_agent": customerUserAgent == null ? null : customerUserAgent,
    "created_via": createdVia == null ? null : createdVia,
    "customer_note": customerNote == null ? null : customerNote,
    "date_completed": dateCompleted,
    "date_paid": datePaid == null ? null : datePaid!.toIso8601String(),
    "cart_hash": cartHash == null ? null : cartHash,
    "number": number == null ? null : number,
    "meta_data": metaData == null ? null : List<dynamic>.from(metaData!.map((x) => x.toMap())),
    "line_items": lineItems == null ? null : List<dynamic>.from(lineItems!.map((x) => x.toMap())),
    "tax_lines": taxLines == null ? null : List<dynamic>.from(taxLines!.map((x) => x)),
    "shipping_lines": shippingLines == null ? null : List<dynamic>.from(shippingLines!.map((x) => x.toMap())),
    "fee_lines": feeLines == null ? null : List<dynamic>.from(feeLines!.map((x) => x)),
    "coupon_lines": couponLines == null ? null : List<dynamic>.from(couponLines!.map((x) => x)),
    "refunds": refunds == null ? null : List<dynamic>.from(refunds!.map((x) => x)),
    "date_created_gmt": dateCreatedGmt == null ? null : dateCreatedGmt!.toIso8601String(),
    "date_modified_gmt": dateModifiedGmt == null ? null : dateModifiedGmt!.toIso8601String(),
    "date_completed_gmt": dateCompletedGmt,
    "date_paid_gmt": datePaidGmt == null ? null : datePaidGmt!.toIso8601String(),
    "currency_symbol": currencySymbol == null ? null : currencySymbol,
    "_links": links == null ? null : links!.toMap(),
  };
}

class Ing {
  Ing({
    this.firstName,
    this.lastName,
    this.company,
    this.address1,
    this.address2,
    this.city,
    this.state,
    this.postcode,
    this.country,
    this.email,
    this.phone,
  });

  final String ?firstName;
  final String ?lastName;
  final String ?company;
  final String ?address1;
  final String ?address2;
  final String ?city;
  final String ?state;
  final String ?postcode;
  final String ?country;
  final String ?email;
  final String ?phone;

  factory Ing.fromJson(String str) => Ing.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Ing.fromMap(Map<String, dynamic> json) => Ing(
    firstName: json["first_name"] == null ? null : json["first_name"],
    lastName: json["last_name"] == null ? null : json["last_name"],
    company: json["company"] == null ? null : json["company"],
    address1: json["address_1"] == null ? null : json["address_1"],
    address2: json["address_2"] == null ? null : json["address_2"],
    city: json["city"] == null ? null : json["city"],
    state: json["state"] == null ? null : json["state"],
    postcode: json["postcode"] == null ? null : json["postcode"],
    country: json["country"] == null ? null : json["country"],
    email: json["email"] == null ? null : json["email"],
    phone: json["phone"] == null ? null : json["phone"],
  );

  Map<String, dynamic> toMap() => {
    "first_name": firstName == null ? null : firstName,
    "last_name": lastName == null ? null : lastName,
    "company": company == null ? null : company,
    "address_1": address1 == null ? null : address1,
    "address_2": address2 == null ? null : address2,
    "city": city == null ? null : city,
    "state": state == null ? null : state,
    "postcode": postcode == null ? null : postcode,
    "country": country == null ? null : country,
    "email": email == null ? null : email,
    "phone": phone == null ? null : phone,
  };
}

class LineItem {
  LineItem({
    this.id,
    this.name,
    this.productId,
    this.variationId,
    this.quantity,
    this.taxClass,
    this.subtotal,
    this.subtotalTax,
    this.total,
    this.totalTax,
    this.taxes,
    this.metaData,
    this.sku,
    this.price,
    this.parentName,
  });

  final int ?id;
  final String ?name;
  final int ?productId;
  final int ?variationId;
  final int ?quantity;
  final String ?taxClass;
  final String ?subtotal;
  final String ?subtotalTax;
  final String ?total;
  final String ?totalTax;
  final List<dynamic> ?taxes;
  final List<LineItemMetaDatum> ?metaData;
  final String ?sku;
  final int ?price;
  final String ?parentName;

  factory LineItem.fromJson(String str) => LineItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LineItem.fromMap(Map<String, dynamic> json) => LineItem(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    productId: json["product_id"] == null ? null : json["product_id"],
    variationId: json["variation_id"] == null ? null : json["variation_id"],
    quantity: json["quantity"] == null ? null : json["quantity"],
    taxClass: json["tax_class"] == null ? null : json["tax_class"],
    subtotal: json["subtotal"] == null ? null : json["subtotal"],
    subtotalTax: json["subtotal_tax"] == null ? null : json["subtotal_tax"],
    total: json["total"] == null ? null : json["total"],
    totalTax: json["total_tax"] == null ? null : json["total_tax"],
    taxes: json["taxes"] == null ? null : List<dynamic>.from(json["taxes"].map((x) => x)),
    metaData: json["meta_data"] == null ? null : List<LineItemMetaDatum>.from(json["meta_data"].map((x) => LineItemMetaDatum.fromMap(x))),
    sku: json["sku"] == null ? null : json["sku"],
    price: json["price"] == null ? null : json["price"],
    parentName: json["parent_name"] == null ? null : json["parent_name"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "product_id": productId == null ? null : productId,
    "variation_id": variationId == null ? null : variationId,
    "quantity": quantity == null ? null : quantity,
    "tax_class": taxClass == null ? null : taxClass,
    "subtotal": subtotal == null ? null : subtotal,
    "subtotal_tax": subtotalTax == null ? null : subtotalTax,
    "total": total == null ? null : total,
    "total_tax": totalTax == null ? null : totalTax,
    "taxes": taxes == null ? null : List<dynamic>.from(taxes!.map((x) => x)),
    "meta_data": metaData == null ? null : List<dynamic>.from(metaData!.map((x) => x.toMap())),
    "sku": sku == null ? null : sku,
    "price": price == null ? null : price,
    "parent_name": parentName == null ? null : parentName,
  };
}

class LineItemMetaDatum {
  LineItemMetaDatum({
    this.id,
    this.key,
    this.value,
    this.displayKey,
    this.displayValue,
  });

  final int ?id;
  final String ?key;
  final String ?value;
  final String ?displayKey;
  final String ?displayValue;

  factory LineItemMetaDatum.fromJson(String str) => LineItemMetaDatum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LineItemMetaDatum.fromMap(Map<String, dynamic> json) => LineItemMetaDatum(
    id: json["id"] == null ? null : json["id"],
    key: json["key"] == null ? null : json["key"],
    value: json["value"] == null ? null : json["value"],
    displayKey: json["display_key"] == null ? null : json["display_key"],
    displayValue: json["display_value"] == null ? null : json["display_value"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "key": key == null ? null : key,
    "value": value == null ? null : value,
    "display_key": displayKey == null ? null : displayKey,
    "display_value": displayValue == null ? null : displayValue,
  };
}

class Links {
  Links({
    this.self,
    this.collection,
    this.customer,
  });

  final List<Collection> ?self;
  final List<Collection> ?collection;
  final List<Collection> ?customer;

  factory Links.fromJson(String str) => Links.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Links.fromMap(Map<String, dynamic> json) => Links(
    self: json["self"] == null ? null : List<Collection>.from(json["self"].map((x) => Collection.fromMap(x))),
    collection: json["collection"] == null ? null : List<Collection>.from(json["collection"].map((x) => Collection.fromMap(x))),
    customer: json["customer"] == null ? null : List<Collection>.from(json["customer"].map((x) => Collection.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "self": self == null ? null : List<dynamic>.from(self!.map((x) => x.toMap())),
    "collection": collection == null ? null : List<dynamic>.from(collection!.map((x) => x.toMap())),
    "customer": customer == null ? null : List<dynamic>.from(customer!.map((x) => x.toMap())),
  };
}

class Collection {
  Collection({
    this.href,
  });

  final String ?href;

  factory Collection.fromJson(String str) => Collection.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Collection.fromMap(Map<String, dynamic> json) => Collection(
    href: json["href"] == null ? null : json["href"],
  );

  Map<String, dynamic> toMap() => {
    "href": href == null ? null : href,
  };
}

class OrderModelMetaDatum {
  OrderModelMetaDatum({
    this.id,
    this.key,
    this.value,
  });

  final int ?id;
  final String ?key;
  final String ?value;

  factory OrderModelMetaDatum.fromJson(String str) => OrderModelMetaDatum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderModelMetaDatum.fromMap(Map<String, dynamic> json) => OrderModelMetaDatum(
    id: json["id"] == null ? null : json["id"],
    key: json["key"] == null ? null : json["key"],
    value: json["value"] == null ? null : json["value"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "key": key == null ? null : key,
    "value": value == null ? null : value,
  };
}

class ShippingLine {
  ShippingLine({
    this.id,
    this.methodTitle,
    this.methodId,
    this.instanceId,
    this.total,
    this.totalTax,
    this.taxes,
    this.metaData,
  });

  final int ?id;
  final String ?methodTitle;
  final String ?methodId;
  final String ?instanceId;
  final String ?total;
  final String ?totalTax;
  final List<dynamic> ?taxes;
  final List<LineItemMetaDatum> ?metaData;

  factory ShippingLine.fromJson(String str) => ShippingLine.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ShippingLine.fromMap(Map<String, dynamic> json) => ShippingLine(
    id: json["id"] == null ? null : json["id"],
    methodTitle: json["method_title"] == null ? null : json["method_title"],
    methodId: json["method_id"] == null ? null : json["method_id"],
    instanceId: json["instance_id"] == null ? null : json["instance_id"],
    total: json["total"] == null ? null : json["total"],
    totalTax: json["total_tax"] == null ? null : json["total_tax"],
    taxes: json["taxes"] == null ? null : List<dynamic>.from(json["taxes"].map((x) => x)),
    metaData: json["meta_data"] == null ? null : List<LineItemMetaDatum>.from(json["meta_data"].map((x) => LineItemMetaDatum.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "method_title": methodTitle == null ? null : methodTitle,
    "method_id": methodId == null ? null : methodId,
    "instance_id": instanceId == null ? null : instanceId,
    "total": total == null ? null : total,
    "total_tax": totalTax == null ? null : totalTax,
    "taxes": taxes == null ? null : List<dynamic>.from(taxes!.map((x) => x)),
    "meta_data": metaData == null ? null : List<dynamic>.from(metaData!.map((x) => x.toMap())),
  };
}
