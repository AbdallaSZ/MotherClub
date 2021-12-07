// To parse this JSON data, do
//
//     final repliesModel = repliesModelFromMap(jsonString);

import 'dart:convert';

class RepliesModel {
  RepliesModel({
    this.id,
    this.date,
    this.dateGmt,
    this.guid,
    this.modified,
    this.modifiedGmt,
    this.slug,
    this.status,
    this.type,
    this.link,
    this.title,
    this.content,
    this.template,
    this.acf,
    this.bbpForumId,
    this.bbpTopicId,
    this.bbpAuthorIp,
    this.bbpActivityId,
    this.links,
  });

  final int? id;
  final DateTime ?date;
  final DateTime ?dateGmt;
  final Guid ?guid;
  final DateTime? modified;
  final DateTime ?modifiedGmt;
  final String ?slug;
  final String ?status;
  final String ?type;
  final String ?link;
  final Guid ?title;
  final Content ?content;
  final String ?template;
  final List<dynamic>? acf;
  final String? bbpForumId;
  final String ?bbpTopicId;
  final String ?bbpAuthorIp;
  final String ?bbpActivityId;
  final Links ?links;

  factory RepliesModel.fromJson(String str) => RepliesModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RepliesModel.fromMap(Map<String, dynamic> json) => RepliesModel(
    id: json["id"] == null ? null : json["id"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    dateGmt: json["date_gmt"] == null ? null : DateTime.parse(json["date_gmt"]),
    guid: json["guid"] == null ? null : Guid.fromMap(json["guid"]),
    modified: json["modified"] == null ? null : DateTime.parse(json["modified"]),
    modifiedGmt: json["modified_gmt"] == null ? null : DateTime.parse(json["modified_gmt"]),
    slug: json["slug"] == null ? null : json["slug"],
    status: json["status"] == null ? null : json["status"],
    type: json["type"] == null ? null : json["type"],
    link: json["link"] == null ? null : json["link"],
    title: json["title"] == null ? null : Guid.fromMap(json["title"]),
    content: json["content"] == null ? null : Content.fromMap(json["content"]),
    template: json["template"] == null ? null : json["template"],
    acf: json["acf"] == null ? null : List<dynamic>.from(json["acf"].map((x) => x)),
    bbpForumId: json["_bbp_forum_id"] == null ? null : json["_bbp_forum_id"],
    bbpTopicId: json["_bbp_topic_id"] == null ? null : json["_bbp_topic_id"],
    bbpAuthorIp: json["_bbp_author_ip"] == null ? null : json["_bbp_author_ip"],
    bbpActivityId: json["_bbp_activity_id"] == null ? null : json["_bbp_activity_id"],
    links: json["_links"] == null ? null : Links.fromMap(json["_links"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "date": date == null ? null : date!.toIso8601String(),
    "date_gmt": dateGmt == null ? null : dateGmt!.toIso8601String(),
    "guid": guid == null ? null : guid!.toMap(),
    "modified": modified == null ? null : modified!.toIso8601String(),
    "modified_gmt": modifiedGmt == null ? null : modifiedGmt!.toIso8601String(),
    "slug": slug == null ? null : slug,
    "status": status == null ? null : status,
    "type": type == null ? null : type,
    "link": link == null ? null : link,
    "title": title == null ? null : title!.toMap(),
    "content": content == null ? null : content!.toMap(),
    "template": template == null ? null : template,
    "acf": acf == null ? null : List<dynamic>.from(acf!.map((x) => x)),
    "_bbp_forum_id": bbpForumId == null ? null : bbpForumId,
    "_bbp_topic_id": bbpTopicId == null ? null : bbpTopicId,
    "_bbp_author_ip": bbpAuthorIp == null ? null : bbpAuthorIp,
    "_bbp_activity_id": bbpActivityId == null ? null : bbpActivityId,
    "_links": links == null ? null : links!.toMap(),
  };
}

class Content {
  Content({
    this.rendered,
    this.protected,
  });

  final String ?rendered;
  final bool ?protected;

  factory Content.fromJson(String str) => Content.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Content.fromMap(Map<String, dynamic> json) => Content(
    rendered: json["rendered"] == null ? null : json["rendered"],
    protected: json["protected"] == null ? null : json["protected"],
  );

  Map<String, dynamic> toMap() => {
    "rendered": rendered == null ? null : rendered,
    "protected": protected == null ? null : protected,
  };
}

class Guid {
  Guid({
    this.rendered,
  });

  final String ?rendered;

  factory Guid.fromJson(String str) => Guid.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Guid.fromMap(Map<String, dynamic> json) => Guid(
    rendered: json["rendered"] == null ? null : json["rendered"],
  );

  Map<String, dynamic> toMap() => {
    "rendered": rendered == null ? null : rendered,
  };
}

class Links {
  Links({
    this.self,
    this.collection,
    this.about,
    this.versionHistory,
    this.wpAttachment,
    this.curies,
  });

  final List<About> ?self;
  final List<About> ?collection;
  final List<About> ?about;
  final List<VersionHistory> ?versionHistory;
  final List<About> ?wpAttachment;
  final List<Cury>? curies;

  factory Links.fromJson(String str) => Links.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Links.fromMap(Map<String, dynamic> json) => Links(
    self: json["self"] == null ? null : List<About>.from(json["self"].map((x) => About.fromMap(x))),
    collection: json["collection"] == null ? null : List<About>.from(json["collection"].map((x) => About.fromMap(x))),
    about: json["about"] == null ? null : List<About>.from(json["about"].map((x) => About.fromMap(x))),
    versionHistory: json["version-history"] == null ? null : List<VersionHistory>.from(json["version-history"].map((x) => VersionHistory.fromMap(x))),
    wpAttachment: json["wp:attachment"] == null ? null : List<About>.from(json["wp:attachment"].map((x) => About.fromMap(x))),
    curies: json["curies"] == null ? null : List<Cury>.from(json["curies"].map((x) => Cury.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "self": self == null ? null : List<dynamic>.from(self!.map((x) => x.toMap())),
    "collection": collection == null ? null : List<dynamic>.from(collection!.map((x) => x.toMap())),
    "about": about == null ? null : List<dynamic>.from(about!.map((x) => x.toMap())),
    "version-history": versionHistory == null ? null : List<dynamic>.from(versionHistory!.map((x) => x.toMap())),
    "wp:attachment": wpAttachment == null ? null : List<dynamic>.from(wpAttachment!.map((x) => x.toMap())),
    "curies": curies == null ? null : List<dynamic>.from(curies!.map((x) => x.toMap())),
  };
}

class About {
  About({
    this.href,
  });

  final String ?href;

  factory About.fromJson(String str) => About.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory About.fromMap(Map<String, dynamic> json) => About(
    href: json["href"] == null ? null : json["href"],
  );

  Map<String, dynamic> toMap() => {
    "href": href == null ? null : href,
  };
}

class Cury {
  Cury({
    this.name,
    this.href,
    this.templated,
  });

  final String ?name;
  final String ?href;
  final bool ?templated;

  factory Cury.fromJson(String str) => Cury.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Cury.fromMap(Map<String, dynamic> json) => Cury(
    name: json["name"] == null ? null : json["name"],
    href: json["href"] == null ? null : json["href"],
    templated: json["templated"] == null ? null : json["templated"],
  );

  Map<String, dynamic> toMap() => {
    "name": name == null ? null : name,
    "href": href == null ? null : href,
    "templated": templated == null ? null : templated,
  };
}

class VersionHistory {
  VersionHistory({
    this.count,
    this.href,
  });

  final int ?count;
  final String? href;

  factory VersionHistory.fromJson(String str) => VersionHistory.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VersionHistory.fromMap(Map<String, dynamic> json) => VersionHistory(
    count: json["count"] == null ? null : json["count"],
    href: json["href"] == null ? null : json["href"],
  );

  Map<String, dynamic> toMap() => {
    "count": count == null ? null : count,
    "href": href == null ? null : href,
  };
}
