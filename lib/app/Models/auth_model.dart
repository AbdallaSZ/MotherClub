// To parse this JSON data, do
//
//     final userDetailsModel = userDetailsModelFromMap(jsonString);

import 'dart:convert';

class AuthModel {
  AuthModel({
    this.status,
    this.cookie,
    this.cookieAdmin,
    this.cookieName,
    this.user,
  });

  final String ?status;
  final String ?cookie;
  final String ?cookieAdmin;
  final String ?cookieName;
  final User ?user;

  factory AuthModel.fromJson(String str) => AuthModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuthModel.fromMap(Map<String, dynamic> json) => AuthModel(
    status: json["status"] == null ? null : json["status"],
    cookie: json["cookie"] == null ? null : json["cookie"],
    cookieAdmin: json["cookie_admin"] == null ? null : json["cookie_admin"],
    cookieName: json["cookie_name"] == null ? null : json["cookie_name"],
    user: json["user"] == null ? null : User.fromMap(json["user"]),
  );

  Map<String, dynamic> toMap() => {
    "status": status == null ? null : status,
    "cookie": cookie == null ? null : cookie,
    "cookie_admin": cookieAdmin == null ? null : cookieAdmin,
    "cookie_name": cookieName == null ? null : cookieName,
    "user": user == null ? null : user!.toMap(),
  };
}

class User {
  User({
    this.id,
    this.username,
    this.nicename,
    this.email,
    this.url,
    this.registered,
    this.displayname,
    this.firstname,
    this.lastname,
    this.nickname,
    this.description,
    this.capabilities,
    this.avatar,
  });

  final int ?id;
  final String ?username;
  final String ?nicename;
  final String ?email;
  final String ?url;
  final DateTime ?registered;
  final String ?displayname;
  final String ?firstname;
  final String ?lastname;
  final String ?nickname;
  final String ?description;
  final String ?capabilities;
  final dynamic avatar;

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
    id: json["id"] == null ? null : json["id"],
    username: json["username"] == null ? null : json["username"],
    nicename: json["nicename"] == null ? null : json["nicename"],
    email: json["email"] == null ? null : json["email"],
    url: json["url"] == null ? null : json["url"],
    registered: json["registered"] == null ? null : DateTime.parse(json["registered"]),
    displayname: json["displayname"] == null ? null : json["displayname"],
    firstname: json["firstname"] == null ? null : json["firstname"],
    lastname: json["lastname"] == null ? null : json["lastname"],
    nickname: json["nickname"] == null ? null : json["nickname"],
    description: json["description"] == null ? null : json["description"],
    capabilities: json["capabilities"] == null ? null : json["capabilities"],
    avatar: json["avatar"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "username": username == null ? null : username,
    "nicename": nicename == null ? null : nicename,
    "email": email == null ? null : email,
    "url": url == null ? null : url,
    "registered": registered == null ? null : registered!.toIso8601String(),
    "displayname": displayname == null ? null : displayname,
    "firstname": firstname == null ? null : firstname,
    "lastname": lastname == null ? null : lastname,
    "nickname": nickname == null ? null : nickname,
    "description": description == null ? null : description,
    "capabilities": capabilities == null ? null : capabilities,
    "avatar": avatar,
  };
}
