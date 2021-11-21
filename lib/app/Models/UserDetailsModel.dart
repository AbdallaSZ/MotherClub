class UserDetailsModel
{

  String userId;
  String username;
  String nicename;
  String email;
  String url;
  String registered;
  String displayname;
  String firstname;
  String lastname;
  String nickname;
  String description;
  String baby_age;
  String pregnancy_week;
  String capabilities;



  UserDetailsModel({required this.userId,required this.username,
    required this.nicename, required this.email,
    required this.url, required this.registered, required this.displayname,
    required this.firstname,required this.lastname,required this.nickname,
  required this.description,required this.baby_age,required this.pregnancy_week,required this.capabilities});

  factory UserDetailsModel.fromJson(Map<String, dynamic> responseData) {
    return UserDetailsModel(userId: responseData['user']['id'],
        username: responseData['user']['username'], nicename: responseData['user']['username'], email: responseData['user']['username'],
        url: responseData['user']['username'], registered: responseData['user']['username'], displayname: responseData['user']['username'],
        firstname: responseData['user']['username'], lastname: responseData['user']['username'], nickname: responseData['user']['username'],
        description: responseData['user']['username'], baby_age: responseData['user']['username'],
        pregnancy_week: responseData['user']['username'], capabilities: responseData['user']['username']);
  }
}
