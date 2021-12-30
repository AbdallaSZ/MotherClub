class SignInModel {
  String? accessToken;
  int? expiresIn;
  String? tokenType;
  String?  idToken;

  SignInModel(
      {this.accessToken, this.expiresIn, this.tokenType, this.idToken});

  SignInModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    expiresIn = json['expires_in'];
    tokenType = json['token_type'];
    idToken = json['id_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['expires_in'] = this.expiresIn;
    data['token_type'] = this.tokenType;
    data['id_token'] = this.idToken;
    return data;
  }
}
