
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:motherclub/app/Models/UserModel.dart';
import 'package:motherclub/app/Models/UserModel.dart';
import 'package:motherclub/app/provider/UserPreferences.dart';
import 'package:motherclub/common/Constant/URL.dart';
import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:motherclub/common/Utils/Utils.dart';


enum Status {
  NotLoggedIn,
  NotRegistered,
  LoggedIn,
  Registered,
  Authenticating,
  Registering,
  LoggedOut
}

class AuthProvider with ChangeNotifier {

  Status _loggedInStatus = Status.NotLoggedIn;
  Status _registeredInStatus = Status.NotRegistered;

  Status get loggedInStatus => _loggedInStatus;
  Status get registeredInStatus => _registeredInStatus;


  Future<Map<String, dynamic>> login(String email, String password) async {
    var result;

    final Map<String, dynamic> loginData = {
        'username': email,
        'password':password
    };

    _loggedInStatus = Status.Authenticating;
    notifyListeners();

    Response response = await post(Uri.parse('https://mothersclub.me/wp-json/custom-plugin/login'),
      body: json.encode(loginData),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      var userData = responseData['data'];

      UserModel authUser = UserModel.fromJson(userData);

      Utils.userPreferences.saveUser(authUser);

      _loggedInStatus = Status.LoggedIn;
      notifyListeners();

      result = {'status': true, 'message': 'Successful', 'user': authUser};
    } else {
    //  final Map<String, dynamic> responseData = json.decode(response.body);

      _loggedInStatus = Status.NotLoggedIn;
      notifyListeners();

      result = {
        'status': false,
        'message': 'kmnknknk'
      };


    }
    return result;
  }

  Future<Map<String, dynamic>> register(String username, String email, String password,String first_name,String Baby_age,String last_name,String Weeks_user) async {
    var result;
    final Map<String, dynamic> registrationData = {
        'username': username,
        'email': email,
        'password': password,
        'first_name':first_name,
      'last_name':last_name,
      'Baby_age':Baby_age,
      'Weeks_user':Weeks_user,

    };


    _registeredInStatus = Status.Registering;
    notifyListeners();

    Response response = await post(Uri.parse('https://mothersclub.me/api?username&email&password'),
      body: json.encode(registrationData),
     // headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);


      var userData = responseData['data'];



      _registeredInStatus = Status.Registered;
      notifyListeners();

      result = {'status': true, 'message': 'Successful'};
    } else {
      _registeredInStatus = Status.NotRegistered;
    notifyListeners();
    result = {
    'status': false,
    'message': json.decode(response.body)['error']
    };
    }
    return result;
  }
  static Future<Response> onValue(Response response) async {
    var result;
    final Map<String, dynamic> responseData = json.decode(response.body);

    if (response.statusCode == 200) {

      var userData = responseData['data'];

      UserModel authUser = UserModel.fromJson(userData);

      Utils.userPreferences.saveUser(authUser);
      result = {
        'status': true,
        'message': 'Successfully registered',
        'data': authUser
      };
    } else {

      result = {
        'status': false,
        'message': 'Registration failed',
        'data': responseData
      };
    }

    return result;
  }

  static onError(error) {
    print("the error is $error.detail");
    return {'status': false, 'message': 'Unsuccessful Request', 'data': error};
  }

}
