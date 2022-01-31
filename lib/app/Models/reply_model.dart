// To parse this JSON data, do
//
//     final replyModel = replyModelFromMap(jsonString);

import 'dart:convert';

class ReplyModel {
  ReplyModel({
    this.id,
    this.title,
    this.permalink,
    this.topicId,
    this.topicTitle,
    this.forumId,
    this.tags,
    this.content,
  });

  final int ?id;
  final String ?title;
  final String? permalink;
  final int ?topicId;
  final String ?topicTitle;
  final int ?forumId;
  final String? tags;
  final String ?content;

  factory ReplyModel.fromJson(String str) => ReplyModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ReplyModel.fromMap(Map<String, dynamic> json) => ReplyModel(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    permalink: json["permalink"] == null ? null : json["permalink"],
    topicId: json["topic_id"] == null ? null : json["topic_id"],
    topicTitle: json["topic_title"] == null ? null : json["topic_title"],
    forumId: json["forum_id"] == null ? null : json["forum_id"],
    tags: json["tags"] == null ? null : json["tags"],
    content: json["content"] == null ? null : json["content"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "permalink": permalink == null ? null : permalink,
    "topic_id": topicId == null ? null : topicId,
    "topic_title": topicTitle == null ? null : topicTitle,
    "forum_id": forumId == null ? null : forumId,
    "tags": tags == null ? null : tags,
    "content": content == null ? null : content,
  };
}
