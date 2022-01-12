import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:motherclub/app/NetworkCalls/Api.dart';
import 'package:motherclub/app/modules/account/SignInModel.dart';
import 'package:motherclub/common/Utils/Utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Networkcall {
  Future<dynamic> getProductsAPICall(int page , int perPage , bool onSale , String min , String max) async {
    var response = await http
        .get(
          Uri.parse(
              'https://mothersclub.me/wp-json/wc/v3/products?consumer_key=ck_80cfe861da67b50ce8080a4589b2660cf6a133db&consumer_secret=cs_d00ecca9defdd4d4cf94b89c865da22188ef783e&page=$page&per_page=$perPage&on_sale=$onSale&min_price=$min&max_price=$max'),
        )
        .catchError(
          (error) {},
        );
    return json.decode(response.body);
  }  Future<dynamic> searchProducts(String keyword) async {
    var response = await http
        .get(
          Uri.parse(
              'https://mothersclub.me/wp-json/wc/v3/products?consumer_key=ck_80cfe861da67b50ce8080a4589b2660cf6a133db&consumer_secret=cs_d00ecca9defdd4d4cf94b89c865da22188ef783e&search=$keyword'),
          /*headers: {
         "Authorization": RemoteConfig.config["AuthorizationToken"],
       }*/
        )
        .catchError(
          (error) {},
        );
    return json.decode(response.body);
  }

  Future<dynamic> getProductsDetails(String productId) async {
    var response = await http
        .get(
          Uri.parse(
              'https://mothersclub.me/wp-json/wc/v3/products/$productId?consumer_key=ck_80cfe861da67b50ce8080a4589b2660cf6a133db&consumer_secret=cs_d00ecca9defdd4d4cf94b89c865da22188ef783e'),
        )
        .catchError(
          (error) {},
        );
    return json.decode(response.body);
  }

  Future<dynamic> getForumAPICall() async {
    var response = await http
        .get(
      Uri.parse(
        'https://mothersclub.me/wp-json/wp/v2/forum',
      ),
    )
        .catchError(
      (error) {
        return false;
      },
    );

    return json.decode(response.body);
  }

  Future<dynamic> getCommentsAPICall(String postId) async {
    var response = await http
        .get(
      Uri.parse(
        'https://mothersclub.me/wp-json/wp/v2/reply?_bbp_forum_id=$postId',
      ),
    )
        .catchError(
      (error) {
        return false;
      },
    );

    return json.decode(response.body);
  }

  Future<dynamic> getBabyAPICall(String slug) async {
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // var monthSlug = preferences.getString('monthSlug') == null
    //     ? '2-month'
    //     : preferences.getString('monthSlug');
    var response = await http
        .get(Uri.parse('https://mothersclub.me/months/details?slug=$slug'))
        .catchError(
      (error) {
        return error;
      },
    );
    return json.decode(response.body);
  }

  Future<dynamic> getProfileAPICall() async {
    var response = await http
        .get(
      Uri.parse(
          'https://mothersclub.me/api/user/get_currentuserinfo/?cookie=nitin_9009|1636021311|r6o6ajAqtUVGCocy9vbkh2YDCaOr5HJe5v2paB5slu2|67b19463e33bf9df05f78569fdbda7bc30333c2ed83a56a29636c21e0b01a95b'),
    )
        .catchError(
      (error) {
        return false;
      },
    );
    return json.decode(response.body);
  }

  Future<dynamic> getAuthData(String userName, String password) async {
    var response = await http
        .get(
      Uri.parse(
          'https://mothersclub.me/api/user/generate_auth_cookie/?username=$userName&password=$password'),
    )
        .catchError(
      (error) {
        return error;
      },
    );
    return json.decode(response.body);
  }

  Future<dynamic> getUser() async {
    var response = await http
        .get(
      Uri.parse(
          'https://mothersclub.me/api/user/get_user_meta/?cookie=${Utils.cookie}'),
    )
        .catchError(
      (error) {
        return error;
      },
    );
    return json.decode(response.body);
  }

  //todo API Call For moths

  Future<dynamic> getMonthAPICall() async {
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
    return json.decode(response.body);
  }

  Future<dynamic> getWeeksAPICall() async {
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
    return json.decode(response.body);
  }
   googleLogin(String email) async {
    var response = await NetworkService.dio
        .post(

          'https://mothersclub.me/wp-json/custom-plugin/social_login', data: {
            "username" : email,
            "social_login" : true,
    }
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
    return response.data;
  }

  //todo API Call For weeksdetails

  Future<dynamic> getWeeksDetailAPICall(String slug ,int page) async {
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // var weekSlug = preferences.getString('slug').toString();
    var response = await http
        .get(

      Uri.parse('https://mothersclub.me/wp-json/custom-plugin/pregnancy_week_details?slug=$slug&page=$page'),
      headers: {
        // 'Content-Type': 'application/json',
        // 'Host': '<calculated when request is sent>',
        //  'User-Agent': 'PostmanRuntime/7.28.4',
        //  'Accept': '*/*',
        // 'Accept-Encoding': 'gzip, deflate, br',
        //  'Connection': 'keep-alive',

      }
    )
        .catchError(
      (error) {
        print('error');
      },
    );
    return json.decode(response.body);
  }

  //todo API Call For App Categories

  Future<dynamic> geAppCategoriesAPI(context) async {
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
    return json.decode(response.body);
  }

  Future<dynamic> getCartItems() async {
    final response = await http.get(
      Uri.parse(
        'https://mothersclub.me/wp-json/cocart/v2/cart?cart_key=\'${Utils.id}\'',
      ),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to create CartItem.');
    } else {
      return response.body;
    }
  }

  Future<String> addCartItem(String id, int quantity, String variation) async {
    final response = await http.post(
      Uri.parse(
          'https://mothersclub.me//wp-json/cocart/v2/cart/add-item?cart_key=\'${Utils.id}\''),
      body: {
        'id': '$id',
        'quantity': '$quantity',
        'variation[attribute_pa_age]': '$variation',
      },
    );
    if (response.statusCode != 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      var res = json.decode(response.body);
      return res['message'];
      throw Exception(response.body);
    } else {
      return 'item added';
    }
  }

  Future<String> deleteFromCartItem(
    String itemId,
  ) async {
    final response = await http.delete(
      Uri.parse(
          'https://mothersclub.me/wp-json/cocart/v2/cart/item/$itemId?cart_key=\'${Utils.id}\''),
    );
    if (response.statusCode != 200) {
      var res = json.decode(response.body);
      return res['message'];
    } else {
      return 'item deleted';
    }
  }

  Future<String> clearCartItem() async {
    final response = await http.post(
      Uri.parse(
          'https://mothersclub.me/wp-json/cocart/v2/cart/clear?cart_key=\'${Utils.id}\''),
    );
    if (response.statusCode != 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      var res = json.decode(response.body);
      return res['message'];
      throw Exception(response.body);
    } else {
      return 'item deleted';
    }
  }

  Future<dynamic> getWishlistByUserId(String userId) async {
    final response = await http.get(
      Uri.parse(
        'https://mothersclub.me/wp-json/wc/v3/wishlist/get_by_user/$userId?consumer_key=ck_80cfe861da67b50ce8080a4589b2660cf6a133db&consumer_secret=cs_d00ecca9defdd4d4cf94b89c865da22188ef783e',
      ),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to Fetch wishlist.');
    } else {
      return jsonDecode(response.body);
    }
  }

  Future<dynamic> createWishlist(
      String title, String userId, String status) async {
    final response = await http.post(
      Uri.parse(
          'https://mothersclub.me/wp-json/wc/v3/wishlist/create?consumer_key=ck_80cfe861da67b50ce8080a4589b2660cf6a133db&consumer_secret=cs_d00ecca9defdd4d4cf94b89c865da22188ef783e'),
      body: {
        'title': '$title',
        'user_id': '$userId',
        'status': '$status',
      },
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to Wishlist. ${response.body}');
    } else {
      return jsonDecode(response.body);
    }
  }

  Future<dynamic> addProductToWishlist(
      String productId, String sharedKey) async {
    final response = await http.post(
      Uri.parse(
          'https://mothersclub.me/wp-json/wc/v3/wishlist/$sharedKey/add_product?consumer_key=ck_80cfe861da67b50ce8080a4589b2660cf6a133db&consumer_secret=cs_d00ecca9defdd4d4cf94b89c865da22188ef783e'),
      body: {
        'product_id': '$productId',
      },
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to Wishlist. ${response.body}');
    } else {
      return jsonDecode(response.body);
    }
  }

  Future<void> updateWishlistName(String name, String sharedKey) async {
    final response = await http.post(
      Uri.parse(
          'https://mothersclub.me/wp-json/wc/v3/wishlist/update/$sharedKey?consumer_key=ck_80cfe861da67b50ce8080a4589b2660cf6a133db&consumer_secret=cs_d00ecca9defdd4d4cf94b89c865da22188ef783e'),
      body: {
        'title': name,
      },
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update Wishlist name.');
    }
  }

  Future<void> delAllWishlist(String sharedKey) async {
    final response = await http.get(
      Uri.parse(
          'https://mothersclub.me/wp-json/wc/v3/wishlist/delete/$sharedKey?consumer_key=ck_80cfe861da67b50ce8080a4589b2660cf6a133db&consumer_secret=cs_d00ecca9defdd4d4cf94b89c865da22188ef783e'),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to Wishlist. ${response.body}');
    } else {}
  }

  Future<void> delProductFromWishlist(String productId) async {
    final response = await http.get(
      Uri.parse(
          'https://mothersclub.me/wp-json/wc/v3/wishlist/remove_product/$productId?consumer_key=ck_80cfe861da67b50ce8080a4589b2660cf6a133db&consumer_secret=cs_d00ecca9defdd4d4cf94b89c865da22188ef783e'),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to Wishlist. ${response.body}');
    }
  }

  Future<dynamic> getProductsFromWishlist(String sharedKey) async {
    // final _networkService = NetworkService();
    final response = await http.get(
      Uri.parse(
        'https://mothersclub.me/wp-json/wc/v3/wishlist/$sharedKey/get_products?consumer_key=ck_80cfe861da67b50ce8080a4589b2660cf6a133db&consumer_secret=cs_d00ecca9defdd4d4cf94b89c865da22188ef783e',
      ),
    );
    if (response.statusCode != 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      var result = jsonDecode(response.body);
      return result['message'];
    } else {
      return jsonDecode(response.body);
    }
  }

  Future<dynamic> getArticles() async {
    final response = await http.get(
      Uri.parse(
        'https://mothersclub.me/wp-json/custom-plugin/pregnancy-we-choose-you',
      ),
    );
    return jsonDecode(response.body);
  }

  Future<dynamic> getOrders() async {
    ///to do .. add user id filtering &customer=${Utils.id} at the end of the link
    final response = await http.get(
      Uri.parse(
        'https://mothersclub.me/wp-json/wc/v3/orders?consumer_key=ck_80cfe861da67b50ce8080a4589b2660cf6a133db&consumer_secret=cs_d00ecca9defdd4d4cf94b89c865da22188ef783e&customer=${Utils.id}',
      ),
    );
    return jsonDecode(response.body);
  }

  Future<dynamic> deleteOrder(String orderId) async {
    final response = await http.delete(
      Uri.parse(
        'https://mothersclub.me/wp-json/wc/v3/orders/$orderId?consumer_key=ck_80cfe861da67b50ce8080a4589b2660cf6a133db&consumer_secret=cs_d00ecca9defdd4d4cf94b89c865da22188ef783e',
      ),
    );
    return jsonDecode(response.body);
  }

  Future<dynamic> sendFeedback(
      String userName, String userEmail, String feedbackMessage) async {
    final response = await http.post(
      Uri.parse(
        'https://mothersclub.me/wp-json/custom-plugin/feedback',
      ),
      body: {
        'user_id': '${Utils.id}',
        'user_name': '$userName',
        'user_email': '$userEmail',
        'feedback_message': '$feedbackMessage',
      },
    );
    if (response.statusCode != 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      var result = jsonDecode(response.body);
      return result['message'];
    } else {
      return jsonDecode(response.body);
    }
  }
}
