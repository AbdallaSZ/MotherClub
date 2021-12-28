import 'package:flutter/cupertino.dart';
import 'package:motherclub/app/Models/UserModel.dart';

class UserProvider with ChangeNotifier {
  UserModel _user = new UserModel(userId: '', user_login: '', user_pass: '',
      user_nicename: '', user_email: '', user_url: '', user_registered: '', display_name: '');

  UserModel get user => _user;

  void setUser(UserModel user) {
    _user = user;
    notifyListeners();
  }
}