
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:http/http.dart'as http;

class NetworkService {
  static final String BASE_URL = "https://mothersclub.me/";
  static Dio dio = new Dio();

  static Future<dynamic> getMyData(String apiUrl, {dynamic headers})async {

     var response = await http.get(Uri.parse(BASE_URL+apiUrl), headers: headers);
     var decodedResponse = decodeTheResponse(response);
     return decodedResponse;
  }

  static Future<http.Response> getWithBody(String apiBaseUrl, dynamic data,
      {dynamic headers = const {"Content-Type": "application/json"}}) async {
    final url = Uri.parse(BASE_URL+apiBaseUrl);
    final request = http.Request("GET", url);
    request.headers.addAll(headers);
    request.body = data;
    final streamedResponse = await request.send();
    return http.Response.fromStream(streamedResponse);
  }

  static Future<dynamic> post(String apiBaseUrl, dynamic data,
      {dynamic headers = const {"Content-Type": "application/json"}})async {
   var dataEncoded = jsonEncode(data);
   print("================= "+dataEncoded.toString());
   dio.options.headers['content-Type'] = 'application/json';
   var response = await dio.post(BASE_URL+apiBaseUrl, data:FormData.fromMap(data));
    //var decoded = decodeTheResponse(response.data);
    return response.data;
  }
 static decodeTheResponse (http.Response response){
    return jsonDecode(response.body);
  }

   Future<http.Response> patch(String apiBaseUrl, dynamic data,
      {dynamic headers = const {"Content-Type": "application/json"}}) {
    return http.patch(
      Uri.parse(BASE_URL+apiBaseUrl),
      body: data,
      headers: headers,
    );
  }

  static Future<http.Response> put(String apiBaseUrl, dynamic data,
      {dynamic headers = const {"Content-Type": "application/json"}}) {
    return http.put(
      Uri.parse(BASE_URL+apiBaseUrl),
      body: data,
      headers: headers,
    );
  }

  static Future<http.Response> delete(String apiBaseUrl,
      {dynamic headers = const {"Content-Type": "application/json"}}) {
    return http.delete(
      Uri.parse(BASE_URL+apiBaseUrl),
      headers: headers,
    );
  }

   Future<http.Response> deleteWithBody(String apiBaseUrl, dynamic data,
      {dynamic headers = const {"Content-Type": "application/json"}}) async {
    final url = Uri.parse(BASE_URL+apiBaseUrl);
    final request = http.Request("DELETE", url);
    request.headers.addAll(headers);
    request.body = convertToJson(data);
    return http.Response.fromStream(await request.send());
  }

  static convertFromJson(String response) => json.decode(response);
  String convertToJson(data) => json.encode(data);

  String? getErrorMessage(dynamic exception) {
    String? errorMessage;
    if (exception is SocketException) {
      errorMessage = exception.message;
    } else if (exception is TimeoutException) {
      errorMessage = exception.toString();
    } else if (exception is HttpException) {
      errorMessage = exception.message;
    }

    return errorMessage!;
  }

  Future<HttpClientResponse> downloadFile(String _apiBaseUrl,
      {dynamic headers = const {"Content-Type": "application/json"}}) async {
    final httpClient = HttpClient();
    final request = await httpClient.getUrl(Uri.parse(_apiBaseUrl));
    final response = await request.close();
    return response;
  }


}
