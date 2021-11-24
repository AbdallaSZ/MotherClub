
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:motherclub/app/Models/wishlistModel.dart';
import 'package:motherclub/app/NetworkCalls/Api.dart';
import 'package:motherclub/common/Utils/request_exception.dart';


class WishlistRepository{
  final _networkService = NetworkService();




  Future<String> createWishlist( CreateWishlistModel wishlist) async {
    final response = await _networkService.getMyData('apiUrl');
    if (response.statusCode == 200) {
      debugPrint("asdaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa$response");
      return 'Course add to favorite successfully';
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

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
  // }
}
