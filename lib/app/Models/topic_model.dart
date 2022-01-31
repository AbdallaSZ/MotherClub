// To parse this JSON data, do
//
//     final topicModel = topicModelFromMap(jsonString);

import 'dart:convert';

class TopicModel {
  TopicModel({
    this.id,
    this.title,
    this.replyCount,
    this.permalink,
    this.tags,
    this.lastReply,
    this.authorName,
    this.authorAvatar,
    this.postDate,
    this.content,
    this.forumId,
    this.forumTitle,
    this.nextPage,
    this.totalTopics,
    this.totalPages,
    this.currentPage,
    this.perPage,
    this.nextPageUrl,
    this.prevPage,
    this.prevPageUrl,
    this.totalReplies,
    this.replies,
  });

  final int ?id;
  final String ?title;
  final String ?replyCount;
  final String ?permalink;
  final String ?tags;
  final int ?lastReply;
  final String ?authorName;
  final String ?authorAvatar;
  final String ?postDate;
  final String ?content;
  final int ?forumId;
  final String ?forumTitle;
  final int ?nextPage;
  final int ?totalTopics;
  final int ?totalPages;
  final int ?currentPage;
  final int ?perPage;
  final String ?nextPageUrl;
  final int ?prevPage;
  final String ?prevPageUrl;
  final int ?totalReplies;
  final List<Reply> ?replies;

  factory TopicModel.fromJson(String str) => TopicModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TopicModel.fromMap(Map<String, dynamic> json) => TopicModel(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    replyCount: json["reply_count"] == null ? null : json["reply_count"],
    permalink: json["permalink"] == null ? null : json["permalink"],
    tags: json["tags"] == null ? null : json["tags"],
    lastReply: json["last_reply"] == null ? null : json["last_reply"],
    authorName: json["author_name"] == null ? null : json["author_name"],
    authorAvatar: json["author_avatar"] == null ? null : json["author_avatar"],
    postDate: json["post_date"] == null ? null : json["post_date"],
    content: json["content"] == null ? null : json["content"],
    forumId: json["forum_id"] == null ? null : json["forum_id"],
    forumTitle: json["forum_title"] == null ? null : json["forum_title"],
    nextPage: json["next_page"] == null ? null : json["next_page"],
    totalTopics: json["total_topics"] == null ? null : json["total_topics"],
    totalPages: json["total_pages"] == null ? null : json["total_pages"],
    currentPage: json["current_page"] == null ? null : json["current_page"],
    perPage: json["per_page"] == null ? null : json["per_page"],
    nextPageUrl: json["next_page_url"] == null ? null : json["next_page_url"],
    prevPage: json["prev_page"] == null ? null : json["prev_page"],
    prevPageUrl: json["prev_page_url"] == null ? null : json["prev_page_url"],
    totalReplies: json["total_replies"] == null ? null : json["total_replies"],
    replies: json["replies"] == null ? null : List<Reply>.from(json["replies"].map((x) => Reply.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "reply_count": replyCount == null ? null : replyCount,
    "permalink": permalink == null ? null : permalink,
    "tags": tags == null ? null : tags,
    "last_reply": lastReply == null ? null : lastReply,
    "author_name": authorName == null ? null : authorName,
    "author_avatar": authorAvatar == null ? null : authorAvatar,
    "post_date": postDate == null ? null : postDate,
    "content": content == null ? null : content,
    "forum_id": forumId == null ? null : forumId,
    "forum_title": forumTitle == null ? null : forumTitle,
    "next_page": nextPage == null ? null : nextPage,
    "total_topics": totalTopics == null ? null : totalTopics,
    "total_pages": totalPages == null ? null : totalPages,
    "current_page": currentPage == null ? null : currentPage,
    "per_page": perPage == null ? null : perPage,
    "next_page_url": nextPageUrl == null ? null : nextPageUrl,
    "prev_page": prevPage == null ? null : prevPage,
    "prev_page_url": prevPageUrl == null ? null : prevPageUrl,
    "total_replies": totalReplies == null ? null : totalReplies,
    "replies": replies == null ? null : List<dynamic>.from(replies!.map((x) => x.toMap())),
  };
}

class Reply {
  Reply({
    this.id,
    this.title,
    this.permalink,
    this.authorName,
    this.authorAvatar,
    this.postDate,
    this.replyTo,
  });

  final int ?id;
  final String ?title;
  final String ?permalink;
  final String ?authorName;
  final String ?authorAvatar;
  final String ?postDate;
  final int ?replyTo;

  factory Reply.fromJson(String str) => Reply.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Reply.fromMap(Map<String, dynamic> json) => Reply(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    permalink: json["permalink"] == null ? null : json["permalink"],
    authorName: json["author_name"] == null ? null : json["author_name"],
    authorAvatar: json["author_avatar"] == null ? null : json["author_avatar"],
    postDate: json["post_date"] == null ? null : json["post_date"],
    replyTo: json["reply_to"] == null ? null : json["reply_to"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "permalink": permalink == null ? null : permalink,
    "author_name": authorName == null ? null : authorName,
    "author_avatar": authorAvatar == null ? null : authorAvatar,
    "post_date": postDate == null ? null : postDate,
    "reply_to": replyTo == null ? null : replyTo,
  };
}
