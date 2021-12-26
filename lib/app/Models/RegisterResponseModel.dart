class RegisterResponseModel {
  String? status;
  String? cookie;
  String? cookieAdmin;
  String? cookieName;
  int? userId;
  String? username;
  String? avatarUrlThumb;

  RegisterResponseModel(
      {this.status,
        this.cookie,
        this.cookieAdmin,
        this.cookieName,
        this.userId,
        this.username,
        this.avatarUrlThumb});

  RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    cookie = json['cookie'];
    cookieAdmin = json['cookie_admin'];
    cookieName = json['cookie_name'];
    userId = json['user_id'];
    username = json['username'];
    avatarUrlThumb = json['avatar_url_thumb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['cookie'] = this.cookie;
    data['cookie_admin'] = this.cookieAdmin;
    data['cookie_name'] = this.cookieName;
    data['user_id'] = this.userId;
    data['username'] = this.username;
    data['avatar_url_thumb'] = this.avatarUrlThumb;
    return data;
  }
}