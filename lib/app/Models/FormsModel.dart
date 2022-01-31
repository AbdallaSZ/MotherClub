// To parse this JSON data, do
//
//     final welcome = welcomeFromMap(jsonString);

import 'dart:convert';

class FormsModel {
  FormsModel({
    this.id,
    this.title,
    this.parent,
    this.topicCount,
    this.replyCount,
    this.permalink,
    this.content,
    this.type,
  });

  final int ?id;
  final String ?title;
  final int ?parent;
  final String ?topicCount;
  final String ?replyCount;
  final String ?permalink;
  final String ?content;
  final String ?type;

  FormsModel copyWith({
    int? id,
    String? title,
    int ?parent,
    String? topicCount,
    String ?replyCount,
    String ?permalink,
    String ?content,
    String ?type,
  }) =>
      FormsModel(
        id: id ?? this.id,
        title: title ?? this.title,
        parent: parent ?? this.parent,
        topicCount: topicCount ?? this.topicCount,
        replyCount: replyCount ?? this.replyCount,
        permalink: permalink ?? this.permalink,
        content: content ?? this.content,
        type: type ?? this.type,
      );

  factory FormsModel.fromJson(String str) => FormsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FormsModel.fromMap(Map<String, dynamic> json) => FormsModel(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    parent: json["parent"] == null ? null : json["parent"],
    topicCount: json["topic_count"] == null ? null : json["topic_count"],
    replyCount: json["reply_count"] == null ? null : json["reply_count"],
    permalink: json["permalink"] == null ? null : json["permalink"],
    content: json["content"] == null ? null : json["content"],
    type: json["type"] == null ? null : json["type"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "parent": parent == null ? null : parent,
    "topic_count": topicCount == null ? null : topicCount,
    "reply_count": replyCount == null ? null : replyCount,
    "permalink": permalink == null ? null : permalink,
    "content": content == null ? null : content,
    "type": type == null ? null : type,
  };
}
