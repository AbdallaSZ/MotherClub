import 'package:flutter_paytabs_bridge/BaseBillingShippingInfo.dart';

class OrderRequestModel {
  String? paymentMethod;
  String? paymentMethodTitle;
  bool? setPaid;
  BillingDetails? billing;
  ShippingDetails? shipping;
  List<LineItems>? lineItems;
  List<ShippingLines>? shippingLines;





  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['payment_method'] = this.paymentMethod;
    data['payment_method_title'] = this.paymentMethodTitle;
    data['set_paid'] = this.setPaid;
    if (this.billing != null) {
      data['billing'] = billingToJson(this.billing!);
    }
    if (this.shipping != null) {
      data['shipping'] = shippingtoJson(this.shipping!);
    }
    if (this.lineItems != null) {
      data['line_items'] = this.lineItems!.map((v) => v.toJson()).toList();
    }
    if (this.shippingLines != null) {
      data['shipping_lines'] =
          this.shippingLines!.map((v) => v.toJson()).toList();
    }
    return data;
  }
  billingToJson(BillingDetails details){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = details.name;
    data['last_name'] = details.name;
    data['address_1'] = details.addressLine;
    data['address_2'] = "";
    data['city'] = details.city;
    data['state'] = details.state;
    data['postcode'] = details.zipCode;
    data['country'] = details.country;
    data['email'] = details.email;
    data['phone'] = details.phone;
    return data;
  }
  Map<String, dynamic> shippingtoJson(ShippingDetails details) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = details.name;
    data['last_name'] = details.name;
    data['address_1'] = details.addressLine;
    data['address_2'] = "";
    data['city'] = details.city;
    data['state'] = details.state;
    data['postcode'] = details.zipCode;
    data['country'] = details.country;
    return data;
  }

  OrderRequestModel(this.paymentMethod, this.paymentMethodTitle, this.setPaid,
      this.billing, this.shipping, this.lineItems, this.shippingLines);
}




class LineItems {
  int? productId;
  int? quantity;
  int? variationId;

  LineItems(this.productId, this.quantity,{ this.variationId});

  LineItems.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    quantity = json['quantity'];
    variationId = json['variation_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['quantity'] = this.quantity;
    data['variation_id'] = this.variationId;
    return data;
  }
}

class ShippingLines {
  String? methodId;
  String? methodTitle;
  String? total;

  ShippingLines({this.methodId, this.methodTitle, this.total});

  ShippingLines.fromJson(Map<String, dynamic> json) {
    methodId = json['method_id'];
    methodTitle = json['method_title'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['method_id'] = this.methodId;
    data['method_title'] = this.methodTitle;
    data['total'] = this.total;
    return data;
  }
}