class UserModel
  {

    String userId;
  String user_login;
  String user_pass;
  String user_nicename;
  String user_email;
  String user_url;
  String user_registered;
  String display_name;

  UserModel({required this.userId,required this.user_login, required this.user_pass, required this.user_nicename,
    required this.user_email, required this.user_url, required this.user_registered,required this.display_name});

  factory UserModel.fromJson(Map<String, dynamic> responseData) {
  return UserModel(
  userId: responseData['ID'],
    user_login: responseData['user_login'],
    user_pass: responseData['user_pass'],
    user_nicename: responseData['user_nicename'],
    user_email: responseData['user_email'],
    user_url: responseData['user_url'],
    user_registered: responseData['user_registered'],
    display_name: responseData['display_name'],
  );
  }
  }
