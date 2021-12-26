import 'package:motherclub/app/Models/ProductDetailsModel.dart';
import 'package:motherclub/app/NetworkCalls/Api.dart';

class ProductDetailsRepo {
  static getProductDetails(String id )async{
   String apiUrl = "wp-json/wc/v3/products/$id?consumer_key=ck_80cfe861da67b50ce8080a4589b2660cf6a133db&consumer_secret=cs_d00ecca9defdd4d4cf94b89c865da22188ef783e";
    var myData = await NetworkService.getMyData(apiUrl);
    if(myData is String ){
      return myData;
    }else{
     return ProductDetailsModel.fromJson(myData);
    }
  }
}