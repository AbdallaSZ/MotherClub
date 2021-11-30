
import 'package:meta/meta.dart';
import 'dart:convert';



class BabyModel {
  BabyModel({
    @required this.id,
    @required this.count,
    @required this.description,
    @required this.link,
    @required this.name,
    @required this.slug,
    @required this.taxonomy,
    @required this.parent,
    @required this.meta,
    @required this.acf,
    @required this.datumImageMonth,
    @required this.imageMonth,
    @required this.datumDescMonth,
    @required this.descMonth,
    @required this.datumAddUrlVid,
    @required this.addUrlVid,
    @required this.links,
    @required this.posts,
  });

  final int ?id;
  final int ?count;
  final String ?description;
  final String ?link;
  final String ?name;
  final String ?slug;
  final Taxonomy ?taxonomy;
  final int ?parent;
  final List<dynamic> ?meta;
  final List<dynamic> ?acf;
  final String ?datumImageMonth;
  final String ?imageMonth;
  final String ?datumDescMonth;
  final String ?descMonth;
  final String ?datumAddUrlVid;
  final String ?addUrlVid;
  final DatumLinks? links;
  final List<Post>? posts;

  factory BabyModel.fromJson(String str) => BabyModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BabyModel.fromMap(Map<String, dynamic> json) => BabyModel(
    id: json["id"] == null ? null : json["id"],
    count: json["count"] == null ? null : json["count"],
    description: json["description"] == null ? null : json["description"],
    link: json["link"] == null ? null : json["link"],
    name: json["name"] == null ? null : json["name"],
    slug: json["slug"] == null ? null : json["slug"],
    taxonomy: json["taxonomy"] == null ? null : taxonomyValues.map[json["taxonomy"]],
    parent: json["parent"] == null ? null : json["parent"],
    meta: json["meta"] == null ? null : List<dynamic>.from(json["meta"].map((x) => x)),
    acf: json["acf"] == null ? null : List<dynamic>.from(json["acf"].map((x) => x)),
    datumImageMonth: json["image_month"] == null ? null : json["image_month"],
    imageMonth: json["_image_month"] == null ? null : json["_image_month"],
    datumDescMonth: json["desc_month"] == null ? null : json["desc_month"],
    descMonth: json["_desc_month"] == null ? null : json["_desc_month"],
    datumAddUrlVid: json["add_url_vid"] == null ? null : json["add_url_vid"],
    addUrlVid: json["_add_url_vid"] == null ? null : json["_add_url_vid"],
    links: json["_links"] == null ? null : DatumLinks.fromMap(json["_links"]),
    posts: json["posts"] == null ? null : List<Post>.from(json["posts"].map((x) => Post.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "count": count == null ? null : count,
    "description": description == null ? null : description,
    "link": link == null ? null : link,
    "name": name == null ? null : name,
    "slug": slug == null ? null : slug,
    "taxonomy": taxonomy == null ? null : taxonomyValues.reverse[taxonomy],
    "parent": parent == null ? null : parent,
    "meta": meta == null ? null : List<dynamic>.from(meta!.map((x) => x)),
    "acf": acf == null ? null : List<dynamic>.from(acf!.map((x) => x)),
    "image_month": datumImageMonth == null ? null : datumImageMonth,
    "_image_month": imageMonth == null ? null : imageMonth,
    "desc_month": datumDescMonth == null ? null : datumDescMonth,
    "_desc_month": descMonth == null ? null : descMonth,
    "add_url_vid": datumAddUrlVid == null ? null : datumAddUrlVid,
    "_add_url_vid": addUrlVid == null ? null : addUrlVid,
    "_links": links == null ? null : links!.toMap(),
    "posts": posts == null ? null : List<dynamic>.from(posts!.map((x) => x.toMap())),
  };
}

class DatumLinks {
  DatumLinks({
    @required this.self,
    @required this.collection,
    @required this.about,
    @required this.up,
    @required this.wpPostType,
    @required this.curies,
  });

  final List<About> ?self;
  final List<About> ?collection;
  final List<About> ?about;
  final List<Up> ?up;
  final List<About> ?wpPostType;
  final List<Cury> ?curies;

  factory DatumLinks.fromJson(String str) => DatumLinks.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DatumLinks.fromMap(Map<String, dynamic> json) => DatumLinks(
    self: json["self"] == null ? null : List<About>.from(json["self"].map((x) => About.fromMap(x))),
    collection: json["collection"] == null ? null : List<About>.from(json["collection"].map((x) => About.fromMap(x))),
    about: json["about"] == null ? null : List<About>.from(json["about"].map((x) => About.fromMap(x))),
    up: json["up"] == null ? null : List<Up>.from(json["up"].map((x) => Up.fromMap(x))),
    wpPostType: json["wp:post_type"] == null ? null : List<About>.from(json["wp:post_type"].map((x) => About.fromMap(x))),
    curies: json["curies"] == null ? null : List<Cury>.from(json["curies"].map((x) => Cury.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "self": self == null ? null : List<dynamic>.from(self!.map((x) => x.toMap())),
    "collection": collection == null ? null : List<dynamic>.from(collection!.map((x) => x.toMap())),
    "about": about == null ? null : List<dynamic>.from(about!.map((x) => x.toMap())),
    "up": up == null ? null : List<dynamic>.from(up!.map((x) => x.toMap())),
    "wp:post_type": wpPostType == null ? null : List<dynamic>.from(wpPostType!.map((x) => x.toMap())),
    "curies": curies == null ? null : List<dynamic>.from(curies!.map((x) => x.toMap())),
  };
}

class About {
  About({
    @required this.href,
  });

  final String? href;

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
    @required this.name,
    @required this.href,
    @required this.templated,
  });

  final Name ?name;
  final Href ?href;
  final bool ?templated;

  factory Cury.fromJson(String str) => Cury.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Cury.fromMap(Map<String, dynamic> json) => Cury(
    name: json["name"] == null ? null : nameValues.map[json["name"]],
    href: json["href"] == null ? null : hrefValues.map[json["href"]],
    templated: json["templated"] == null ? null : json["templated"],
  );

  Map<String, dynamic> toMap() => {
    "name": name == null ? null : nameValues.reverse[name],
    "href": href == null ? null : hrefValues.reverse[href],
    "templated": templated == null ? null : templated,
  };
}

enum Href { HTTPS_API_W_ORG_REL }

final hrefValues = EnumValues({
  "https://api.w.org/{rel}": Href.HTTPS_API_W_ORG_REL
});

enum Name { WP }

final nameValues = EnumValues({
  "wp": Name.WP
});

class Up {
  Up({
    @required this.embeddable,
    @required this.href,
  });

  final bool ?embeddable;
  final String ?href;

  factory Up.fromJson(String str) => Up.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Up.fromMap(Map<String, dynamic> json) => Up(
    embeddable: json["embeddable"] == null ? null : json["embeddable"],
    href: json["href"] == null ? null : json["href"],
  );

  Map<String, dynamic> toMap() => {
    "embeddable": embeddable == null ? null : embeddable,
    "href": href == null ? null : href,
  };
}

class Post {
  Post({
    @required this.id,
    @required this.date,
    @required this.dateGmt,
    @required this.guid,
    @required this.modified,
    @required this.modifiedGmt,
    @required this.slug,
    @required this.status,
    @required this.type,
    @required this.link,
    @required this.title,
    @required this.content,
    @required this.featuredMedia,
    @required this.commentStatus,
    @required this.pingStatus,
    @required this.template,
    @required this.months,
    @required this.acf,
    @required this.editLock,
    @required this.editLast,
    @required this.thumbnailId,
    @required this.postSourceImage,
    @required this.sourceImage,
    @required this.postUrlSourceImg,
    @required this.urlSourceImg,
    @required this.yoastWpseoContentScore,
    @required this.yoastWpseoFocuskeywords,
    @required this.yoastWpseoKeywordsynonyms,
    @required this.lastEditorUsedJetpack,
    @required this.yoastWpseoPrimaryMonths,
    @required this.links,
  });

  final int? id;
  final DateTime? date;
  final DateTime ?dateGmt;
  final Guid ?guid;
  final DateTime ?modified;
  final DateTime ?modifiedGmt;
  final String ?slug;
  final Status? status;
  final Type ?type;
  final String ?link;
  final Guid ?title;
  final Content ?content;
  final int ?featuredMedia;
  final CommentStatus ?commentStatus;
  final PingStatus? pingStatus;
  final String? template;
  final List<int>? months;
  final List<dynamic> ?acf;
  final String ?editLock;
  final String ?editLast;
  final String ?thumbnailId;
  final SourceImageEnum ?postSourceImage;
  final SourceImage? sourceImage;
  final String ?postUrlSourceImg;
  final UrlSourceImg ?urlSourceImg;
  final String ?yoastWpseoContentScore;
  final YoastWpseoFocuskeywords ?yoastWpseoFocuskeywords;
  final YoastWpseoKeywordsynonyms? yoastWpseoKeywordsynonyms;
  final LastEditorUsedJetpack? lastEditorUsedJetpack;
  final String ?yoastWpseoPrimaryMonths;
  final PostLinks ?links;

  factory Post.fromJson(String str) => Post.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Post.fromMap(Map<String, dynamic> json) => Post(
    id: json["id"] == null ? null : json["id"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    dateGmt: json["date_gmt"] == null ? null : DateTime.parse(json["date_gmt"]),
    guid: json["guid"] == null ? null : Guid.fromMap(json["guid"]),
    modified: json["modified"] == null ? null : DateTime.parse(json["modified"]),
    modifiedGmt: json["modified_gmt"] == null ? null : DateTime.parse(json["modified_gmt"]),
    slug: json["slug"] == null ? null : json["slug"],
    status: json["status"] == null ? null : statusValues.map[json["status"]],
    type: json["type"] == null ? null : typeValues.map[json["type"]],
    link: json["link"] == null ? null : json["link"],
    title: json["title"] == null ? null : Guid.fromMap(json["title"]),
    content: json["content"] == null ? null : Content.fromMap(json["content"]),
    featuredMedia: json["featured_media"] == null ? null : json["featured_media"],
    commentStatus: json["comment_status"] == null ? null : commentStatusValues.map[json["comment_status"]],
    pingStatus: json["ping_status"] == null ? null : pingStatusValues.map[json["ping_status"]],
    template: json["template"] == null ? null : json["template"],
    months: json["months"] == null ? null : List<int>.from(json["months"].map((x) => x)),
    acf: json["acf"] == null ? null : List<dynamic>.from(json["acf"].map((x) => x)),
    editLock: json["_edit_lock"] == null ? null : json["_edit_lock"],
    editLast: json["_edit_last"] == null ? null : json["_edit_last"],
    thumbnailId: json["_thumbnail_id"] == null ? null : json["_thumbnail_id"],
    postSourceImage: json["source_image"] == null ? null : sourceImageEnumValues.map[json["source_image"]],
    sourceImage: json["_source_image"] == null ? null : sourceImageValues.map[json["_source_image"]],
    postUrlSourceImg: json["url_source_img"] == null ? null : json["url_source_img"],
    urlSourceImg: json["_url_source_img"] == null ? null : urlSourceImgValues.map[json["_url_source_img"]],
    yoastWpseoContentScore: json["_yoast_wpseo_content_score"] == null ? null : json["_yoast_wpseo_content_score"],
    yoastWpseoFocuskeywords: json["_yoast_wpseo_focuskeywords"] == null ? null : yoastWpseoFocuskeywordsValues.map[json["_yoast_wpseo_focuskeywords"]],
    yoastWpseoKeywordsynonyms: json["_yoast_wpseo_keywordsynonyms"] == null ? null : yoastWpseoKeywordsynonymsValues.map[json["_yoast_wpseo_keywordsynonyms"]],
    lastEditorUsedJetpack: json["_last_editor_used_jetpack"] == null ? null : lastEditorUsedJetpackValues.map[json["_last_editor_used_jetpack"]],
    yoastWpseoPrimaryMonths: json["_yoast_wpseo_primary_months"] == null ? null : json["_yoast_wpseo_primary_months"],
    links: json["_links"] == null ? null : PostLinks.fromMap(json["_links"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "date": date == null ? null : date!.toIso8601String(),
    "date_gmt": dateGmt == null ? null : dateGmt!.toIso8601String(),
    "guid": guid == null ? null : guid!.toMap(),
    "modified": modified == null ? null : modified!.toIso8601String(),
    "modified_gmt": modifiedGmt == null ? null : modifiedGmt!.toIso8601String(),
    "slug": slug == null ? null : slug,
    "status": status == null ? null : statusValues.reverse[status],
    "type": type == null ? null : typeValues.reverse[type],
    "link": link == null ? null : link,
    "title": title == null ? null : title!.toMap(),
    "content": content == null ? null : content!.toMap(),
    "featured_media": featuredMedia == null ? null : featuredMedia,
    "comment_status": commentStatus == null ? null : commentStatusValues.reverse[commentStatus],
    "ping_status": pingStatus == null ? null : pingStatusValues.reverse[pingStatus],
    "template": template == null ? null : template,
    "months": months == null ? null : List<dynamic>.from(months!.map((x) => x)),
    "acf": acf == null ? null : List<dynamic>.from(acf!.map((x) => x)),
    "_edit_lock": editLock == null ? null : editLock,
    "_edit_last": editLast == null ? null : editLast,
    "_thumbnail_id": thumbnailId == null ? null : thumbnailId,
    "source_image": postSourceImage == null ? null : sourceImageEnumValues.reverse[postSourceImage],
    "_source_image": sourceImage == null ? null : sourceImageValues.reverse[sourceImage],
    "url_source_img": postUrlSourceImg == null ? null : postUrlSourceImg,
    "_url_source_img": urlSourceImg == null ? null : urlSourceImgValues.reverse[urlSourceImg],
    "_yoast_wpseo_content_score": yoastWpseoContentScore == null ? null : yoastWpseoContentScore,
    "_yoast_wpseo_focuskeywords": yoastWpseoFocuskeywords == null ? null : yoastWpseoFocuskeywordsValues.reverse[yoastWpseoFocuskeywords],
    "_yoast_wpseo_keywordsynonyms": yoastWpseoKeywordsynonyms == null ? null : yoastWpseoKeywordsynonymsValues.reverse[yoastWpseoKeywordsynonyms],
    "_last_editor_used_jetpack": lastEditorUsedJetpack == null ? null : lastEditorUsedJetpackValues.reverse[lastEditorUsedJetpack],
    "_yoast_wpseo_primary_months": yoastWpseoPrimaryMonths == null ? null : yoastWpseoPrimaryMonths,
    "_links": links == null ? null : links!.toMap(),
  };
}

enum CommentStatus { OPEN }

final commentStatusValues = EnumValues({
  "open": CommentStatus.OPEN
});

class Content {
  Content({
    @required this.rendered,
    @required this.protected,
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
    @required this.rendered,
  });

  final String? rendered;

  factory Guid.fromJson(String str) => Guid.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Guid.fromMap(Map<String, dynamic> json) => Guid(
    rendered: json["rendered"] == null ? null : json["rendered"],
  );

  Map<String, dynamic> toMap() => {
    "rendered": rendered == null ? null : rendered,
  };
}

enum LastEditorUsedJetpack { EMPTY, CLASSIC_EDITOR }

final lastEditorUsedJetpackValues = EnumValues({
  "classic-editor": LastEditorUsedJetpack.CLASSIC_EDITOR,
  "": LastEditorUsedJetpack.EMPTY
});

class PostLinks {
  PostLinks({
    @required this.self,
    @required this.collection,
    @required this.about,
    @required this.replies,
    @required this.versionHistory,
    @required this.wpFeaturedmedia,
    @required this.wpAttachment,
    @required this.wpTerm,
    @required this.curies,
  });

  final List<About> ?self;
  final List<About> ?collection;
  final List<About> ?about;
  final List<Up> ?replies;
  final List<VersionHistory> ?versionHistory;
  final List<Up> ?wpFeaturedmedia;
  final List<About> ?wpAttachment;
  final List<WpTerm> ?wpTerm;
  final List<Cury> ?curies;

  factory PostLinks.fromJson(String str) => PostLinks.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PostLinks.fromMap(Map<String, dynamic> json) => PostLinks(
    self: json["self"] == null ? null : List<About>.from(json["self"].map((x) => About.fromMap(x))),
    collection: json["collection"] == null ? null : List<About>.from(json["collection"].map((x) => About.fromMap(x))),
    about: json["about"] == null ? null : List<About>.from(json["about"].map((x) => About.fromMap(x))),
    replies: json["replies"] == null ? null : List<Up>.from(json["replies"].map((x) => Up.fromMap(x))),
    versionHistory: json["version-history"] == null ? null : List<VersionHistory>.from(json["version-history"].map((x) => VersionHistory.fromMap(x))),
    wpFeaturedmedia: json["wp:featuredmedia"] == null ? null : List<Up>.from(json["wp:featuredmedia"].map((x) => Up.fromMap(x))),
    wpAttachment: json["wp:attachment"] == null ? null : List<About>.from(json["wp:attachment"].map((x) => About.fromMap(x))),
    wpTerm: json["wp:term"] == null ? null : List<WpTerm>.from(json["wp:term"].map((x) => WpTerm.fromMap(x))),
    curies: json["curies"] == null ? null : List<Cury>.from(json["curies"].map((x) => Cury.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "self": self == null ? null : List<dynamic>.from(self!.map((x) => x.toMap())),
    "collection": collection == null ? null : List<dynamic>.from(collection!.map((x) => x.toMap())),
    "about": about == null ? null : List<dynamic>.from(about!.map((x) => x.toMap())),
    "replies": replies == null ? null : List<dynamic>.from(replies!.map((x) => x.toMap())),
    "version-history": versionHistory == null ? null : List<dynamic>.from(versionHistory!.map((x) => x.toMap())),
    "wp:featuredmedia": wpFeaturedmedia == null ? null : List<dynamic>.from(wpFeaturedmedia!.map((x) => x.toMap())),
    "wp:attachment": wpAttachment == null ? null : List<dynamic>.from(wpAttachment!.map((x) => x.toMap())),
    "wp:term": wpTerm == null ? null : List<dynamic>.from(wpTerm!.map((x) => x.toMap())),
    "curies": curies == null ? null : List<dynamic>.from(curies!.map((x) => x.toMap())),
  };
}

class VersionHistory {
  VersionHistory({
    @required this.count,
    @required this.href,
  });

  final int ?count;
  final String ?href;

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

class WpTerm {
  WpTerm({
    @required this.taxonomy,
    @required this.embeddable,
    @required this.href,
  });

  final Taxonomy ?taxonomy;
  final bool? embeddable;
  final String ?href;

  factory WpTerm.fromJson(String str) => WpTerm.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory WpTerm.fromMap(Map<String, dynamic> json) => WpTerm(
    taxonomy: json["taxonomy"] == null ? null : taxonomyValues.map[json["taxonomy"]],
    embeddable: json["embeddable"] == null ? null : json["embeddable"],
    href: json["href"] == null ? null : json["href"],
  );

  Map<String, dynamic> toMap() => {
    "taxonomy": taxonomy == null ? null : taxonomyValues.reverse[taxonomy],
    "embeddable": embeddable == null ? null : embeddable,
    "href": href == null ? null : href,
  };
}

enum Taxonomy { MONTHS }

final taxonomyValues = EnumValues({
  "months": Taxonomy.MONTHS
});

enum PingStatus { CLOSED }

final pingStatusValues = EnumValues({
  "closed": PingStatus.CLOSED
});

enum SourceImageEnum { FREEPIK }

final sourceImageEnumValues = EnumValues({
  "freepik": SourceImageEnum.FREEPIK
});

enum SourceImage { FIELD_5_F5_EE9_B52_F5_E8 }

final sourceImageValues = EnumValues({
  "field_5f5ee9b52f5e8": SourceImage.FIELD_5_F5_EE9_B52_F5_E8
});

enum Status { PUBLISH }

final statusValues = EnumValues({
  "publish": Status.PUBLISH
});

enum Type { BABY }

final typeValues = EnumValues({
  "baby": Type.BABY
});

enum UrlSourceImg { FIELD_5_F5_EE9_C22_F5_E9 }

final urlSourceImgValues = EnumValues({
  "field_5f5ee9c22f5e9": UrlSourceImg.FIELD_5_F5_EE9_C22_F5_E9
});

enum YoastWpseoFocuskeywords { EMPTY }

final yoastWpseoFocuskeywordsValues = EnumValues({
  "[]": YoastWpseoFocuskeywords.EMPTY
});

enum YoastWpseoKeywordsynonyms { EMPTY }

final yoastWpseoKeywordsynonymsValues = EnumValues({
  "[\"\"]": YoastWpseoKeywordsynonyms.EMPTY
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> ?reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
