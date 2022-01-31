// To parse this JSON data, do
//
//     final forumDetailesModel = forumDetailesModelFromMap(jsonString);

import 'dart:convert';

class ForumDetailsModel {
  ForumDetailsModel({
    this.id,
    this.title,
    this.parent,
    this.topicCount,
    this.replyCount,
    this.permalink,
    this.content,
    this.type,
    this.subforums,
    this.totalTopics,
    this.totalPages,
    this.currentPage,
    this.perPage,
    this.nextPage,
    this.nextPageUrl,
    this.prevPage,
    this.prevPageUrl,
    this.topics,
  });

  final int ?id;
  final String ?title;
  final int? parent;
  final String ?topicCount;
  final String ?replyCount;
  final String ?permalink;
  final String ?content;
  final String ?type;
  final List<dynamic> ?subforums;
  final int ?totalTopics;
  final int ?totalPages;
  final int ?currentPage;
  final int ?perPage;
  final int ?nextPage;
  final String ?nextPageUrl;
  final int ?prevPage;
  final String ?prevPageUrl;
  final List<Topic> ?topics;

  ForumDetailsModel copyWith({
    int ?id,
    String ?title,
    int ?parent,
    String ?topicCount,
    String ?replyCount,
    String ?permalink,
    String ?content,
    String ?type,
    List<dynamic> ?subforums,
    int ?totalTopics,
    int ?totalPages,
    int ?currentPage,
    int ?perPage,
    int ?nextPage,
    String? nextPageUrl,
    int ?prevPage,
    String? prevPageUrl,
    List<Topic> ?topics,
  }) =>
      ForumDetailsModel(
        id: id ?? this.id,
        title: title ?? this.title,
        parent: parent ?? this.parent,
        topicCount: topicCount ?? this.topicCount,
        replyCount: replyCount ?? this.replyCount,
        permalink: permalink ?? this.permalink,
        content: content ?? this.content,
        type: type ?? this.type,
        subforums: subforums ?? this.subforums,
        totalTopics: totalTopics ?? this.totalTopics,
        totalPages: totalPages ?? this.totalPages,
        currentPage: currentPage ?? this.currentPage,
        perPage: perPage ?? this.perPage,
        nextPage: nextPage ?? this.nextPage,
        nextPageUrl: nextPageUrl ?? this.nextPageUrl,
        prevPage: prevPage ?? this.prevPage,
        prevPageUrl: prevPageUrl ?? this.prevPageUrl,
        topics: topics ?? this.topics,
      );

  factory ForumDetailsModel.fromJson(String str) => ForumDetailsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ForumDetailsModel.fromMap(Map<String, dynamic> json) => ForumDetailsModel(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    parent: json["parent"] == null ? null : json["parent"],
    topicCount: json["topic_count"] == null ? null : json["topic_count"],
    replyCount: json["reply_count"] == null ? null : json["reply_count"],
    permalink: json["permalink"] == null ? null : json["permalink"],
    content: json["content"] == null ? null : json["content"],
    type: json["type"] == null ? null : json["type"],
    subforums: json["subforums"] == null ? null : List<dynamic>.from(json["subforums"].map((x) => x)),
    totalTopics: json["total_topics"] == null ? null : json["total_topics"],
    totalPages: json["total_pages"] == null ? null : json["total_pages"],
    currentPage: json["current_page"] == null ? null : json["current_page"],
    perPage: json["per_page"] == null ? null : json["per_page"],
    nextPage: json["next_page"] == null ? null : json["next_page"],
    nextPageUrl: json["next_page_url"] == null ? null : json["next_page_url"],
    prevPage: json["prev_page"] == null ? null : json["prev_page"],
    prevPageUrl: json["prev_page_url"] == null ? null : json["prev_page_url"],
    topics: json["topics"] == null ? null : List<Topic>.from(json["topics"].map((x) => Topic.fromMap(x))),
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
    "subforums": subforums == null ? null : List<dynamic>.from(subforums!.map((x) => x)),
    "total_topics": totalTopics == null ? null : totalTopics,
    "total_pages": totalPages == null ? null : totalPages,
    "current_page": currentPage == null ? null : currentPage,
    "per_page": perPage == null ? null : perPage,
    "next_page": nextPage == null ? null : nextPage,
    "next_page_url": nextPageUrl == null ? null : nextPageUrl,
    "prev_page": prevPage == null ? null : prevPage,
    "prev_page_url": prevPageUrl == null ? null : prevPageUrl,
    "topics": topics == null ? null : List<dynamic>.from(topics!.map((x) => x.toMap())),
  };
}

class Topic {
  Topic({
    this.id,
    this.title,
    this.replyCount,
    this.permalink,
    this.authorName,
    this.authorAvatar,
    this.postDate,
  });

  final int ?id;
  final String ?title;
  final String ?replyCount;
  final String ?permalink;
  final String ?authorName;
  final String ?authorAvatar;
  final String ?postDate;

  Topic copyWith({
    int? id,
    String ?title,
    String? replyCount,
    String ?permalink,
    String ?authorName,
    String ?authorAvatar,
    String ?postDate,
  }) =>
      Topic(
        id: id ?? this.id,
        title: title ?? this.title,
        replyCount: replyCount ?? this.replyCount,
        permalink: permalink ?? this.permalink,
        authorName: authorName ?? this.authorName,
        authorAvatar: authorAvatar ?? this.authorAvatar,
        postDate: postDate ?? this.postDate,
      );

  factory Topic.fromJson(String str) => Topic.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Topic.fromMap(Map<String, dynamic> json) => Topic(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    replyCount: json["reply_count"] == null ? null : json["reply_count"],
    permalink: json["permalink"] == null ? null : json["permalink"],
    authorName: json["author_name"] == null ? null : json["author_name"],
    authorAvatar: json["author_avatar"] == null ? null : json["author_avatar"],
    postDate: json["post_date"] == null ? null : json["post_date"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "reply_count": replyCount == null ? null : replyCount,
    "permalink": permalink == null ? null : permalink,
    "author_name": authorName == null ? null : authorName,
    "author_avatar": authorAvatar == null ? null : authorAvatar,
    "post_date": postDate == null ? null : postDate,
  };
}
