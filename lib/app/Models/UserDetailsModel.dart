// To parse this JSON data, do
//
//     final userDetailsModel = userDetailsModelFromMap(jsonString);

import 'dart:convert';

class UserDetailsModel {
  UserDetailsModel({
    this.status,
    this.nickname,
    this.firstName,
    this.lastName,
    this.richEditing,
    this.syntaxHighlighting,
    this.commentShortcuts,
    this.adminColor,
    this.showAdminBarFront,
    this.qjvCapabilities,
    this.yoastWpseoProfileUpdated,
    this.lastUpdate,
    this.babyAge,
    this.weeksUser,
    this.acceptMailseter,
    this.termsPrivacy,
    this.sessionTokens,
    this.wpUserAvatar,
    this.wcLastActive,
    this.tinvwlNotifications,
    this.woocommercePersistentCart1,
    this.payingCustomer,
    this.orderCount,
    this.lastOrder,
  });

  final String ?status;
  final String ?nickname;
  final String ?firstName;
  final String ?lastName;
  final String ?richEditing;
  final String ?syntaxHighlighting;
  final String ?commentShortcuts;
  final String ?adminColor;
  final String ?showAdminBarFront;
  final String ?qjvCapabilities;
  final String ?yoastWpseoProfileUpdated;
  final String ?lastUpdate;
  final String ?babyAge;
  final String ?weeksUser;
  final String ?acceptMailseter;
  final String ?termsPrivacy;
  final String ?sessionTokens;
  final String ?wpUserAvatar;
  final String ?wcLastActive;
  final String ?tinvwlNotifications;
  final String ?woocommercePersistentCart1;
  final String ?payingCustomer;
  final String ?orderCount;
  final String ?lastOrder;

  factory UserDetailsModel.fromJson(String str) => UserDetailsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserDetailsModel.fromMap(Map<String, dynamic> json) => UserDetailsModel(
    status: json["status"] == null ? null : json["status"],
    nickname: json["nickname"] == null ? null : json["nickname"],
    firstName: json["first_name"] == null ? null : json["first_name"],
    lastName: json["last_name"] == null ? null : json["last_name"],
    richEditing: json["rich_editing"] == null ? null : json["rich_editing"],
    syntaxHighlighting: json["syntax_highlighting"] == null ? null : json["syntax_highlighting"],
    commentShortcuts: json["comment_shortcuts"] == null ? null : json["comment_shortcuts"],
    adminColor: json["admin_color"] == null ? null : json["admin_color"],
    showAdminBarFront: json["show_admin_bar_front"] == null ? null : json["show_admin_bar_front"],
    qjvCapabilities: json["qjv_capabilities"] == null ? null : json["qjv_capabilities"],
    yoastWpseoProfileUpdated: json["_yoast_wpseo_profile_updated"] == null ? null : json["_yoast_wpseo_profile_updated"],
    lastUpdate: json["last_update"] == null ? null : json["last_update"],
    babyAge: json["Baby_age"] == null ? null : json["Baby_age"],
    weeksUser: json["Weeks_user"] == null ? null : json["Weeks_user"],
    acceptMailseter: json["accept_mailseter"] == null ? null : json["accept_mailseter"],
    termsPrivacy: json["Terms_Privacy"] == null ? null : json["Terms_Privacy"],
    sessionTokens: json["session_tokens"] == null ? null : json["session_tokens"],
    wpUserAvatar: json["wp_user_avatar"] == null ? null : json["wp_user_avatar"],
    wcLastActive: json["wc_last_active"] == null ? null : json["wc_last_active"],
    tinvwlNotifications: json["_tinvwl_notifications"] == null ? null : json["_tinvwl_notifications"],
    woocommercePersistentCart1: json["_woocommerce_persistent_cart_1"] == null ? null : json["_woocommerce_persistent_cart_1"],
    payingCustomer: json["paying_customer"] == null ? null : json["paying_customer"],
    orderCount: json["_order_count"] == null ? null : json["_order_count"],
    lastOrder: json["_last_order"] == null ? null : json["_last_order"],
  );

  Map<String, dynamic> toMap() => {
    "status": status == null ? null : status,
    "nickname": nickname == null ? null : nickname,
    "first_name": firstName == null ? null : firstName,
    "last_name": lastName == null ? null : lastName,
    "rich_editing": richEditing == null ? null : richEditing,
    "syntax_highlighting": syntaxHighlighting == null ? null : syntaxHighlighting,
    "comment_shortcuts": commentShortcuts == null ? null : commentShortcuts,
    "admin_color": adminColor == null ? null : adminColor,
    "show_admin_bar_front": showAdminBarFront == null ? null : showAdminBarFront,
    "qjv_capabilities": qjvCapabilities == null ? null : qjvCapabilities,
    "_yoast_wpseo_profile_updated": yoastWpseoProfileUpdated == null ? null : yoastWpseoProfileUpdated,
    "last_update": lastUpdate == null ? null : lastUpdate,
    "Baby_age": babyAge == null ? null : babyAge,
    "Weeks_user": weeksUser == null ? null : weeksUser,
    "accept_mailseter": acceptMailseter == null ? null : acceptMailseter,
    "Terms_Privacy": termsPrivacy == null ? null : termsPrivacy,
    "session_tokens": sessionTokens == null ? null : sessionTokens,
    "wp_user_avatar": wpUserAvatar == null ? null : wpUserAvatar,
    "wc_last_active": wcLastActive == null ? null : wcLastActive,
    "_tinvwl_notifications": tinvwlNotifications == null ? null : tinvwlNotifications,
    "_woocommerce_persistent_cart_1": woocommercePersistentCart1 == null ? null : woocommercePersistentCart1,
    "paying_customer": payingCustomer == null ? null : payingCustomer,
    "_order_count": orderCount == null ? null : orderCount,
    "_last_order": lastOrder == null ? null : lastOrder,
  };
}
