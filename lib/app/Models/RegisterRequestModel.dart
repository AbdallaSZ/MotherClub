class RegisterRequestModel {
  String? customFieldsFirstName;
  String? customFieldsLastName;
  String? username;
  String? customFieldsBabyAge;
  String? customFieldsWeeksUser;
  String? userPass;
  String? nonce;
  String? email;
  String? image;


  RegisterRequestModel(
      {this.customFieldsFirstName,
        this.customFieldsLastName,
        this.username,
        this.customFieldsBabyAge,
        this.customFieldsWeeksUser,
        this.userPass,
        this.email,
        this.nonce,
        this.image});

  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    customFieldsFirstName = json['custom_fields[first_name]'];
    customFieldsLastName = json['custom_fields[last_name]'];
    username = json['username'];
    customFieldsBabyAge = json['custom_fields[Baby_age]'];
    customFieldsWeeksUser = json['custom_fields[Weeks_user]'];
    userPass = json['user_pass'];
    nonce = json['nonce'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['custom_fields[first_name]'] = this.customFieldsFirstName;
    data['custom_fields[last_name]'] = this.customFieldsLastName;
    data['username'] = this.username;
    data['custom_fields[Baby_age]'] = this.customFieldsBabyAge;
    data['custom_fields[Weeks_user]'] = this.customFieldsWeeksUser;
    data['user_pass'] = this.userPass;
    data['nonce'] = this.nonce;
    data['image'] = this.image;
    data['email'] = this.email;
    return data;
  }
}