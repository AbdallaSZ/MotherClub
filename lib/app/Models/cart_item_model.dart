class CartItemModel {
  CartItemModel({
    required this.cartHash,
    required this.cartKey,
    required this.currency,
    required this.customer,
    required this.items,
    required this.itemCount,
    required this.itemsWeight,
    required this.coupons,
    required this.needsPayment,
    required this.needsShipping,
    required this.shipping,
    required this.fees,
    required this.taxes,
    required this.totals,
    required this.removedItems,
    required this.crossSells,
    required this.notices,
  });
  late final String cartHash;
  late final String cartKey;
  late final Currency currency;
  late final Customer customer;
  late final List<Items> items;
  late final int itemCount;
  late final int itemsWeight;
  late final List<dynamic> coupons;
  late final bool needsPayment;
  late final bool needsShipping;
  late final Shipping shipping;
  late final List<dynamic> fees;
  late final List<dynamic> taxes;
  late final Totals totals;
  late final List<dynamic> removedItems;
  late final List<dynamic> crossSells;
  late final List<dynamic> notices;

  CartItemModel.fromJson(Map<String, dynamic> json){
    cartHash = json['cart_hash'];
    cartKey = json['cart_key'];
    currency = Currency.fromJson(json['currency']);
    customer = Customer.fromJson(json['customer']);
    items = List.from(json['items']).map((e)=>Items.fromJson(e)).toList();
    itemCount = json['item_count'];
    itemsWeight = json['items_weight'];
    coupons = List.castFrom<dynamic, dynamic>(json['coupons']);
    needsPayment = json['needs_payment'];
    needsShipping = json['needs_shipping'];
    shipping = Shipping.fromJson(json['shipping']);
    fees = List.castFrom<dynamic, dynamic>(json['fees']);
    taxes = List.castFrom<dynamic, dynamic>(json['taxes']);
    totals = Totals.fromJson(json['totals']);
    removedItems = List.castFrom<dynamic, dynamic>(json['removed_items']);
    crossSells = List.castFrom<dynamic, dynamic>(json['cross_sells']);
    notices = List.castFrom<dynamic, dynamic>(json['notices']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['cart_hash'] = cartHash;
    _data['cart_key'] = cartKey;
    _data['currency'] = currency.toJson();
    _data['customer'] = customer.toJson();
    _data['items'] = items.map((e)=>e.toJson()).toList();
    _data['item_count'] = itemCount;
    _data['items_weight'] = itemsWeight;
    _data['coupons'] = coupons;
    _data['needs_payment'] = needsPayment;
    _data['needs_shipping'] = needsShipping;
    _data['shipping'] = shipping.toJson();
    _data['fees'] = fees;
    _data['taxes'] = taxes;
    _data['totals'] = totals.toJson();
    _data['removed_items'] = removedItems;
    _data['cross_sells'] = crossSells;
    _data['notices'] = notices;
    return _data;
  }
}

class Currency {
  Currency({
    required this.currencyCode,
    required this.currencySymbol,
    required this.currencyMinorUnit,
    required this.currencyDecimalSeparator,
    required this.currencyThousandSeparator,
    required this.currencyPrefix,
    required this.currencySuffix,
  });
  late final String currencyCode;
  late final String currencySymbol;
  late final int currencyMinorUnit;
  late final String currencyDecimalSeparator;
  late final String currencyThousandSeparator;
  late final String currencyPrefix;
  late final String currencySuffix;

  Currency.fromJson(Map<String, dynamic> json){
    currencyCode = json['currency_code'];
    currencySymbol = json['currency_symbol'];
    currencyMinorUnit = json['currency_minor_unit'];
    currencyDecimalSeparator = json['currency_decimal_separator'];
    currencyThousandSeparator = json['currency_thousand_separator'];
    currencyPrefix = json['currency_prefix'];
    currencySuffix = json['currency_suffix'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['currency_code'] = currencyCode;
    _data['currency_symbol'] = currencySymbol;
    _data['currency_minor_unit'] = currencyMinorUnit;
    _data['currency_decimal_separator'] = currencyDecimalSeparator;
    _data['currency_thousand_separator'] = currencyThousandSeparator;
    _data['currency_prefix'] = currencyPrefix;
    _data['currency_suffix'] = currencySuffix;
    return _data;
  }
}

class Customer {
  Customer({
    required this.billingAddress,
    required this.shippingAddress,
  });
  late final BillingAddress billingAddress;
  late final ShippingAddress shippingAddress;

  Customer.fromJson(Map<String, dynamic> json){
    billingAddress = BillingAddress.fromJson(json['billing_address']);
    shippingAddress = ShippingAddress.fromJson(json['shipping_address']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['billing_address'] = billingAddress.toJson();
    _data['shipping_address'] = shippingAddress.toJson();
    return _data;
  }
}

class BillingAddress {
  BillingAddress({
    required this.billingFirstName,
    required this.billingLastName,
    required this.billingCompany,
    required this.billingCountry,
    required this.billingAddress_1,
    required this.billingAddress_2,
    required this.billingCity,
    required this.billingState,
    required this.billingPostcode,
    required this.billingPhone,
    required this.billingEmail,
  });
  late final String billingFirstName;
  late final String billingLastName;
  late final String billingCompany;
  late final String billingCountry;
  late final String billingAddress_1;
  late final String billingAddress_2;
  late final String billingCity;
  late final String billingState;
  late final String billingPostcode;
  late final String billingPhone;
  late final String billingEmail;

  BillingAddress.fromJson(Map<String, dynamic> json){
    billingFirstName = json['billing_first_name'];
    billingLastName = json['billing_last_name'];
    billingCompany = json['billing_company'];
    billingCountry = json['billing_country'];
    billingAddress_1 = json['billing_address_1'];
    billingAddress_2 = json['billing_address_2'];
    billingCity = json['billing_city'];
    billingState = json['billing_state'];
    billingPostcode = json['billing_postcode'];
    billingPhone = json['billing_phone'];
    billingEmail = json['billing_email'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['billing_first_name'] = billingFirstName;
    _data['billing_last_name'] = billingLastName;
    _data['billing_company'] = billingCompany;
    _data['billing_country'] = billingCountry;
    _data['billing_address_1'] = billingAddress_1;
    _data['billing_address_2'] = billingAddress_2;
    _data['billing_city'] = billingCity;
    _data['billing_state'] = billingState;
    _data['billing_postcode'] = billingPostcode;
    _data['billing_phone'] = billingPhone;
    _data['billing_email'] = billingEmail;
    return _data;
  }
}

class ShippingAddress {
  ShippingAddress({
    required this.shippingFirstName,
    required this.shippingLastName,
    required this.shippingCompany,
    required this.shippingCountry,
    required this.shippingAddress_1,
    required this.shippingAddress_2,
    required this.shippingCity,
    required this.shippingState,
    required this.shippingPostcode,
  });
  late final String shippingFirstName;
  late final String shippingLastName;
  late final String shippingCompany;
  late final String shippingCountry;
  late final String shippingAddress_1;
  late final String shippingAddress_2;
  late final String shippingCity;
  late final String shippingState;
  late final String shippingPostcode;

  ShippingAddress.fromJson(Map<String, dynamic> json){
    shippingFirstName = json['shipping_first_name'];
    shippingLastName = json['shipping_last_name'];
    shippingCompany = json['shipping_company'];
    shippingCountry = json['shipping_country'];
    shippingAddress_1 = json['shipping_address_1'];
    shippingAddress_2 = json['shipping_address_2'];
    shippingCity = json['shipping_city'];
    shippingState = json['shipping_state'];
    shippingPostcode = json['shipping_postcode'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['shipping_first_name'] = shippingFirstName;
    _data['shipping_last_name'] = shippingLastName;
    _data['shipping_company'] = shippingCompany;
    _data['shipping_country'] = shippingCountry;
    _data['shipping_address_1'] = shippingAddress_1;
    _data['shipping_address_2'] = shippingAddress_2;
    _data['shipping_city'] = shippingCity;
    _data['shipping_state'] = shippingState;
    _data['shipping_postcode'] = shippingPostcode;
    return _data;
  }
}

class Items {
  Items({
    required this.itemKey,
    required this.id,
    required this.name,
    required this.title,
    required this.price,
    required this.quantity,
    required this.taxData,
    required this.totals,
    required this.slug,
    required this.meta,
    required this.backorders,
    required this.cartItemData,
    required this.featuredImage,
  });
  late final String itemKey;
  late final int id;
  late final String name;
  late final String title;
  late final String price;
  late final Quantity quantity;
  late final TaxData taxData;
  late final Totals totals;
  late final String slug;
  late final Meta meta;
  late final String backorders;
  late final CartItemData cartItemData;
  late final String featuredImage;

  Items.fromJson(Map<String, dynamic> json){
    itemKey = json['item_key'];
    id = json['id'];
    name = json['name'];
    title = json['title'];
    price = json['price'];
    quantity = Quantity.fromJson(json['quantity']);
    taxData = TaxData.fromJson(json['tax_data']);
    totals = Totals.fromJson(json['totals']);
    slug = json['slug'];
    meta = Meta.fromJson(json['meta']);
    backorders = json['backorders'];
    cartItemData = List.castFrom<dynamic, dynamic>(json['cart_item_data']) as CartItemData;
    featuredImage = json['featured_image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['item_key'] = itemKey;
    _data['id'] = id;
    _data['name'] = name;
    _data['title'] = title;
    _data['price'] = price;
    _data['quantity'] = quantity.toJson();
    _data['tax_data'] = taxData.toJson();
    _data['totals'] = totals.toJson();
    _data['slug'] = slug;
    _data['meta'] = meta.toJson();
    _data['backorders'] = backorders;
    _data['cart_item_data'] = cartItemData;
    _data['featured_image'] = featuredImage;
    return _data;
  }
}

class Quantity {
  Quantity({
    required this.value,
    required this.minPurchase,
    required this.maxPurchase,
  });
  late final int value;
  late final int minPurchase;
  late final int maxPurchase;

  Quantity.fromJson(Map<String, dynamic> json){
    value = json['value'];
    minPurchase = json['min_purchase'];
    maxPurchase = json['max_purchase'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['value'] = value;
    _data['min_purchase'] = minPurchase;
    _data['max_purchase'] = maxPurchase;
    return _data;
  }
}

class TaxData {
  TaxData({
    required this.subtotal,
    required this.total,
  });
  late final List<dynamic> subtotal;
  late final List<dynamic> total;

  TaxData.fromJson(Map<String, dynamic> json){
    subtotal = List.castFrom<dynamic, dynamic>(json['subtotal']);
    total = List.castFrom<dynamic, dynamic>(json['total']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['subtotal'] = subtotal;
    _data['total'] = total;
    return _data;
  }
}

class Totals {
  Totals({
    required this.subtotal,
    required this.subtotalTax,
    required this.total,
    required this.tax,
  });
  late final int subtotal;
  late final int subtotalTax;
  late final int total;
  late final int tax;

  Totals.fromJson(Map<String, dynamic> json){
    subtotal = json['subtotal'];
    subtotalTax = json['subtotal_tax'];
    total = json['total'];
    tax = json['tax'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['subtotal'] = subtotal;
    _data['subtotal_tax'] = subtotalTax;
    _data['total'] = total;
    _data['tax'] = tax;
    return _data;
  }
}

class Meta {
  Meta({
    required this.productType,
    required this.sku,
    required this.dimensions,
    required this.weight,
    required this.variation,
  });
  late final String productType;
  late final String sku;
  late final Dimensions dimensions;
  late final int weight;
  late final Variation variation;

  Meta.fromJson(Map<String, dynamic> json){
    productType = json['product_type'];
    sku = json['sku'];
    dimensions = Dimensions.fromJson(json['dimensions']);
    weight = json['weight'];
    variation = Variation.fromJson(json['variation']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['product_type'] = productType;
    _data['sku'] = sku;
    _data['dimensions'] = dimensions.toJson();
    _data['weight'] = weight;
    _data['variation'] = variation.toJson();
    return _data;
  }
}

class Dimensions {
  Dimensions({
    required this.length,
    required this.width,
    required this.height,
    required this.unit,
  });
  late final String length;
  late final String width;
  late final String height;
  late final String unit;

  Dimensions.fromJson(Map<String, dynamic> json){
    length = json['length'];
    width = json['width'];
    height = json['height'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['length'] = length;
    _data['width'] = width;
    _data['height'] = height;
    _data['unit'] = unit;
    return _data;
  }
}

class Variation {
  Variation({
    required this.Age,
  });
  late final String Age;

  Variation.fromJson(Map<String, dynamic> json){
    Age = json['Age'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Age'] = Age;
    return _data;
  }
}

class CartItemData {
  CartItemData({
    required this.tinvwlFormdata,
  });
  late final TinvwlFormdata tinvwlFormdata;

  CartItemData.fromJson(Map<String, dynamic> json){
    tinvwlFormdata = TinvwlFormdata.fromJson(json['tinvwl_formdata']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['tinvwl_formdata'] = tinvwlFormdata.toJson();
    return _data;
  }
}

class TinvwlFormdata {
  TinvwlFormdata({
    required this.id,
    required this.variation,
  });
  late final String id;
  late final Variation variation;

  TinvwlFormdata.fromJson(Map<String, dynamic> json){
    id = json['id'];
    variation = Variation.fromJson(json['variation']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['variation'] = variation.toJson();
    return _data;
  }
}

class Shipping {
  Shipping({
    required this.totalPackages,
    required this.showPackageDetails,
    required this.hasCalculatedShipping,
    required this.packages,
  });
  late final int totalPackages;
  late final bool showPackageDetails;
  late final bool hasCalculatedShipping;
  late final Packages packages;

  Shipping.fromJson(Map<String, dynamic> json){
    totalPackages = json['total_packages'];
    showPackageDetails = json['show_package_details'];
    hasCalculatedShipping = json['has_calculated_shipping'];
    packages = Packages.fromJson(json['packages']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['total_packages'] = totalPackages;
    _data['show_package_details'] = showPackageDetails;
    _data['has_calculated_shipping'] = hasCalculatedShipping;
    _data['packages'] = packages.toJson();
    return _data;
  }
}

class Packages {
  Packages({
  required this.defaultt,
});
late final Default defaultt;

Packages.fromJson(Map<String, dynamic> json){
defaultt = Default.fromJson(json['default']);
}

Map<String, dynamic> toJson() {
  final _data = <String, dynamic>{};
  _data['default'] = defaultt.toJson();
  return _data;
}
}

class Default {
  Default({
    required this.packageName,
    required this.rates,
    required this.packageDetails,
    required this.index,
    required this.chosenMethod,
    required this.formattedDestination,
  });
  late final String packageName;
  late final Rates rates;
  late final String packageDetails;
  late final int index;
  late final String chosenMethod;
  late final String formattedDestination;

  Default.fromJson(Map<String, dynamic> json){
    packageName = json['package_name'];
    rates = Rates.fromJson(json['rates']);
    packageDetails = json['package_details'];
    index = json['index'];
    chosenMethod = json['chosen_method'];
    formattedDestination = json['formatted_destination'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['package_name'] = packageName;
    _data['rates'] = rates.toJson();
    _data['package_details'] = packageDetails;
    _data['index'] = index;
    _data['chosen_method'] = chosenMethod;
    _data['formatted_destination'] = formattedDestination;
    return _data;
  }
}

class Rates {
  Rates({
    required this.freeShipping,
  });
  late final FreeShipping freeShipping;

  Rates.fromJson(Map<String, dynamic> json){
    freeShipping = FreeShipping.fromJson(json['free_shipping:1']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['free_shipping:1'] = freeShipping.toJson();
    return _data;
    }
}

class FreeShipping {
FreeShipping({
required this.key,
required this.methodId,
required this.instanceId,
required this.label,
required this.cost,
required this.html,
required this.taxes,
required this.chosenMethod,
});
late final String key;
late final String methodId;
late final int instanceId;
late final String label;
late final String cost;
late final String html;
late final List<dynamic> taxes;
late final bool chosenMethod;

FreeShipping.fromJson(Map<String, dynamic> json){
key = json['key'];
methodId = json['method_id'];
instanceId = json['instance_id'];
label = json['label'];
cost = json['cost'];
html = json['html'];
taxes = List.castFrom<dynamic, dynamic>(json['taxes']);
chosenMethod = json['chosen_method'];
}

Map<String, dynamic> toJson() {
final _data = <String, dynamic>{};
_data['key'] = key;
_data['method_id'] = methodId;
_data['instance_id'] = instanceId;
_data['label'] = label;
_data['cost'] = cost;
_data['html'] = html;
_data['taxes'] = taxes;
_data['chosen_method'] = chosenMethod;
return _data;
}
}