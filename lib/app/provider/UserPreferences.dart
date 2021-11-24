import 'package:motherclub/app/Models/UserModel.dart';
import 'package:motherclub/common/Utils/Utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';


class UserPreferences {
  late final SharedPreferences prefs;

  Future<bool> saveUser(UserModel user) async {

    prefs.setString("ID", user.userId);
    prefs.setString("user_login", user.user_login);
    prefs.setString("user_pass", user.user_pass);
    prefs.setString("user_nicename", user.user_nicename);
    prefs.setString("user_email", user.user_email);
    prefs.setString("user_url", user.user_url);
    prefs.setString("user_registered", user.user_registered);
    prefs.setString("display_name", user.display_name);
    setAttributeToUtils(user);
    return prefs.commit();
  }
initialize()async{
  prefs = await SharedPreferences.getInstance();
  print("Shared Preference ready");
}
  setNonce(String nonce)async{
    prefs.setString("Nonce", nonce);
    print("Nonce Saved");
  }

  getNonce(){
    var nonce = prefs.getString("Nonce");
    return nonce;
  }
  Future<UserModel> getUser() async {

    String userId = prefs.getString("ID")??'';
    String user_login = prefs.getString("user_login")??'';
    String user_pass = prefs.getString("user_pass")??'';
    String user_nicename = prefs.getString("user_nicename")??'';
    String user_email = prefs.getString("user_email")??'';
    String user_url = prefs.getString("user_url")??'';
    String user_registered = prefs.getString("user_registered")??'';
    String display_name = prefs.getString("display_name")??'';

    return UserModel(userId:userId, user_login: user_login, user_pass: user_pass, user_nicename: user_nicename, user_email: user_email, user_url: user_url, user_registered: user_registered, display_name: display_name);
  }

  void removeUser() async {

    prefs.remove("ID");
    prefs.remove("user_login");
    prefs.remove("user_pass");
    prefs.remove("user_nicename");
    prefs.remove("user_email");
    prefs.remove("user_url");
    prefs.remove("user_registered");
    prefs.remove("display_name");
  }

  Future<String> getToken() async {
    String token = prefs.getString("ID")??'';
    return token;
  }

  void setAttributeToUtils(UserModel value) {
    Utils.id=value.userId;
    Utils.name=value.display_name;
    Utils.email=value.user_email;
    Utils.ImageUrl=value.user_url;
  }
}