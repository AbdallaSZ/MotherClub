import 'dart:convert';

import 'package:motherclub/app/Models/cart_item_model.dart';
import 'package:motherclub/app/NetworkCalls/Api.dart';
import 'package:http/http.dart'as http;
final _networkService = NetworkService();
class CartRepository{
//   final _networkService = NetworkService();
//
//
//
//
//   Future<CartItemModel> createWishlist( CreateWishlistModel wishlist) async {
//     final response = await _networkService.getMyData('apiUrl');
//     if (response.statusCode == 200) {
//       debugPrint("asdaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa$response");
//       return 'Course add to favorite successfully';
//     } else {
//       // If that call was not successful, throw an error.
//       throw Exception('Failed to load post');
//     }
//   }
// Future<dynamic> getProductsDetailsAPI() async {
//   var response = await http.get(Uri.parse('https://mothersclub.me/wp-json/cocart/v2/cart?cart_key=matt_9009|1637747142|hLzbAoURNMWEFI7sKBTcwZCJJ4J1sS3OSLIxbvNnbEb|66c1bd0db16e5fe78b9729c03f1e1717e368b32f626f6a7e2d388cedf08a0bda'),
//
//
//     /*
//        headers:
//        {
//          "Authorization": RemoteConfig.config["AuthorizationToken"],
//        }
//        */
//   ).catchError(
//         (error) {
//       return false;
//     },
//   );
//   print('DATsssssssssssssssssssssA ${response.body}');
//   return json.decode(response.body);
// }

Future<dynamic> getCartItems() async {
  // final _networkService = NetworkService();
    final response = await http.get(
      Uri.parse('https://mothersclub.me/wp-json/cocart/v2/cart?cart_key=matt_9009|1637747142|hLzbAoURNMWEFI7sKBTcwZCJJ4J1sS3OSLIxbvNnbEb|66c1bd0db16e5fe78b9729c03f1e1717e368b32f626f6a7e2d388cedf08a0bda',),
    );
print('asasllllll${response.statusCode}');
    if (response.statusCode != 200 ) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      throw Exception('Failed to create album.');
    } else {
      print('lllllllllllslsls${response.body}');
      print('ssssssssssssssssss${jsonDecode(response.body)}');
      return CartItemModel.fromJson(jsonDecode(response.body));

    }
  }
Future<String> addCartItem() async {

  final response = await NetworkService.post(
    'wp-json/cocart/v2/cart/add-item',
      _networkService.convertToJson({
        'id':'4432',
        'quantity':'1' ,
        'variation[attribute_pa_age]':'0-3-months ',
      }),
  );
  print('stCode${response.statusCode}');
  if (response.statusCode != 200 ) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    throw Exception('Failed to create album.');
  } else {
    print('printBody${response.body}');
    print('printBodyDecoded${jsonDecode(response.body)}');
    return 'item added';

  }
}




  // final response = await _networkService.getWithBody(
  //   '',
  //   _networkService.convertToJson({}),
  //   headers: <String, String>{
  //     'Content-Type': 'application/json; charset=UTF-8',
  //   },
  // );
  //
  // if (response.statusCode == 201) {
  //   // If the server did return a 201 CREATED response,
  //   // then parse the JSON.
  //   return CartItemModel.fromJson(jsonDecode(response.body));
  // } else {
  //   // If the server did not return a 201 CREATED response,
  //   // then throw an exception.
  //   throw Exception('Failed to create album.');
  // }



// Stream<String> addCourseToFavorite(String studentId, String courseId) {
//   final userIdParam = '/$studentId';
//   final headers = _networkService.getHeaders(true);
//   final bodyJson = _createFavoriteJsonBody(courseId);
//   print('Course2Fav request: $bodyJson');
//
//   return _networkService.put(
//       ApiEndPoint.FAVORITES + userIdParam, bodyJson,
//       headers: headers)
//       .map((response) {
//     print('response body: ${_networkService.convertFromJson(response.body)}');
//
//     if (response.statusCode != 200 || null == response.statusCode) {
//       throw RequestException(response.body);
//     } else {
//       return 'Course add to favorite successfully';
//     }
//   });
}

