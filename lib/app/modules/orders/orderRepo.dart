import 'package:motherclub/app/NetworkCalls/Api.dart';
import 'package:motherclub/app/modules/orders/OrderRequestModel.dart';
import 'package:motherclub/common/Utils/Utils.dart';

class OrderRepo {
  static createRepo (OrderRequestModel model)async{
   var response =  await NetworkService.createOrder("wp-json/wc/v3/orders?consumer_key=ck_80cfe861da67b50ce8080a4589b2660cf6a133db&consumer_secret=cs_d00ecca9defdd4d4cf94b89c865da22188ef783e&customer_id=${Utils.id}",
        model.toJson());
  return response;
  }
}