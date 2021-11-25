//import 'dart:convert' as convert;
//import 'dart:convert';
import 'dart:convert';
import 'dart:io';

//import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:motherclub/app/Models/ProductModel.dart';
import 'package:motherclub/app/Models/cart_item_model.dart';
import 'package:motherclub/app/NetworkCalls/Api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Networkcall {
  Future<dynamic> getProductsAPICall(context) async {
    var response = await http
        .get(
      Uri.parse(
          'https://mothersclub.me/wp-json/wc/v3/products?consumer_key=ck_80cfe861da67b50ce8080a4589b2660cf6a133db&consumer_secret=cs_d00ecca9defdd4d4cf94b89c865da22188ef783e'),
      /*headers: {
         "Authorization": RemoteConfig.config["AuthorizationToken"],
       }*/
    )
        .catchError(
      (error) {
        return false;
      },
    );
    return json.decode(response.body);
  }

  Future<dynamic> getForumAPICall(context) async {
    var response = await http
        .get(
      Uri.parse(
          'https://mothersclub.me/wp-json/wp/v2/forum?per_page=100&page=1&status=publish'),

      /*headers: {
         "Authorization": RemoteConfig.config["AuthorizationToken"],
       }*/
    )
        .catchError(
      (error) {
        return false;
      },
    );
    print(response.body);
    return json.decode(response.body);
  }

  Future<dynamic> getprofileAPICall(context) async {
    var response = await http
        .get(
      Uri.parse(
          'https://mothersclub.me/api/user/get_currentuserinfo/?cookie=nitin_9009|1636021311|r6o6ajAqtUVGCocy9vbkh2YDCaOr5HJe5v2paB5slu2|67b19463e33bf9df05f78569fdbda7bc30333c2ed83a56a29636c21e0b01a95b'),

      /*headers: {
         "Authorization": RemoteConfig.config["AuthorizationToken"],
       }*/
    )
        .catchError(
      (error) {
        return false;
      },
    );
    print(response.body);
    return json.decode(response.body);
  }

  //todo API Call For moths

  Future<dynamic> getmonthAPICall() async {
    var response = await http
        .get(
      Uri.parse(
          'https://mothersclub.me/wp-json/wp/v2/months?orderby=id&per_page=12'),

      /*headers: {
         "Authorization": RemoteConfig.config["AuthorizationToken"],
       }*/
    )
        .catchError(
      (error) {
        return false;
      },
    );
    print(response.body);
    return json.decode(response.body);
  }

  //todo API Call For weeks

  Future<dynamic> getWeeksAPICall(context) async {
    var response = await http
        .get(
      Uri.parse(
          'https://mothersclub.me/wp-json/wp/v2/weeks?orderby=id&per_page=50'),
      /*
       headers: {
         "Authorization": RemoteConfig.config["AuthorizationToken"],
       }
       */
    )
        .catchError(
      (error) {
        return false;
      },
    );
    print("DADAD  77  ${response.body}");
    return json.decode(response.body);
  }

  //todo API Call For weeksdetails

  Future<dynamic> getWeeksDetailAPICall() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var weekslug = preferences.getString('slug').toString();
    var response = await http
        .get(
      Uri.parse('https://mothersclub.me/pregnancy_week_details?slug=$weekslug'),
      /*
       headers: {
         "Authorization": RemoteConfig.config["AuthorizationToken"],
       }
       */
    )
        .catchError(
      (error) {
        return false;
      },
    );
    print("DADAD  78  ${response.body}");
    return json.decode(response.body);
  }

  //todo API Call For App Categories

  Future<dynamic> geAppCategoiresAPI(context) async {
    var response = await http
        .get(
      Uri.parse('https://mothersclub.me/front-page'),

      /*
       headers:
       {
         "Authorization": RemoteConfig.config["AuthorizationToken"],
       }
       */
    )
        .catchError(
      (error) {
        return false;
      },
    );
    print('DATA ${response.body}');
    return json.decode(response.body);
  }

//todo API Call For ProductsDetails

  Future<dynamic> getProductsDetailsAPI(context) async {
    var response = await http
        .get(
      Uri.parse(
          'https://mothersclub.me/wp-json/wc/v3/products/2957?consumer_key=ck_80cfe861da67b50ce8080a4589b2660cf6a133db&consumer_secret=cs_d00ecca9defdd4d4cf94b89c865da22188ef783e'),

      /*
       headers:
       {
         "Authorization": RemoteConfig.config["AuthorizationToken"],
       }
       */
    )
        .catchError(
      (error) {
        return false;
      },
    );
    print('DATA ${response.body}');
    return json.decode(response.body);
  }

  Future<dynamic> getCartItems() async {
    // final _networkService = NetworkService();
    final response = await http.get(
      Uri.parse(
        'https://mothersclub.me/wp-json/cocart/v2/cart?cart_key=matt_9009|1637747142|hLzbAoURNMWEFI7sKBTcwZCJJ4J1sS3OSLIxbvNnbEb|66c1bd0db16e5fe78b9729c03f1e1717e368b32f626f6a7e2d388cedf08a0bda',
      ),
    );

    if (response.statusCode != 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      throw Exception('Failed to create album.');
    } else {

      print('ssssssssssssssssss${jsonDecode(response.body)}');
      return jsonDecode(response.body);
    }
  }

  Future<String> addCartItem(String id ,int quantity ,String variation) async {
    final _networkService = NetworkService();
    final response = await http.post(
      Uri.parse('https://mothersclub.me/wp-json/cocart/v2/cart/add-item'),
      body: {
        'id': '$id',
        'quantity': '$quantity',
        'variation[attribute_pa_age]': '$variation-months',
      },
    );
    print('stCode${response.statusCode}');
    if (response.statusCode != 200 ) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      throw Exception('Failed to add item. ${response.body}');
    } else {
      print('printBody${response.body}');
      print('printBodyDecoded${jsonDecode(response.body)}');
      return 'item added';
    }
  }
}
