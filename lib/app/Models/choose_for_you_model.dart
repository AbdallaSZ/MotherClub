// To parse this JSON data, do
//
//     final chooseForYouModel = chooseForYouModelFromMap(jsonString);

import 'dart:convert';

class ChooseForYouModel {
  ChooseForYouModel({
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
    this.author,
    this.featuredMedia,
    this.commentStatus,
    this.pingStatus,
    this.template,
    this.weeks,
    this.acf,
    this.lastEditorUsedJetpack,
    this.editLast,
    this.chooseForYouModelUrlSourceImg,
    this.urlSourceImg,
    this.chooseForYouModelSourceImage,
    this.sourceImage,
    this.yoastWpseoFocuskeywords,
    this.yoastWpseoKeywordsynonyms,
    this.editLock,
    this.thumbnailId,
    this.yoastWpseoContentScore,
    this.yoastWpseoPrimaryWeeks,
    this.wpOldDate,
    this.oembed31A462A611B39F2D991Ece0837D3799F,
    this.oembedTime31A462A611B39F2D991Ece0837D3799F,
    this.yoastWpseoPrimaryCats,
    this.wpPageTemplate,
    this.links,
    this.image,
  });

  final int ?id;
  final DateTime? date;
  final DateTime ?dateGmt;
  final Guid ?guid;
  final DateTime ?modified;
  final DateTime? modifiedGmt;
  final String ?slug;
  final String ?status;
  final String? type;
  final String ?link;
  final Guid ?title;
  final Content ?content;
  final int? author;
  final int ?featuredMedia;
  final String ?commentStatus;
  final String ?pingStatus;
  final String ?template;
  final List<int> ?weeks;
  final List<dynamic>? acf;
  final String ?lastEditorUsedJetpack;
  final String ?editLast;
  final String ?chooseForYouModelUrlSourceImg;
  final String ?urlSourceImg;
  final String ?chooseForYouModelSourceImage;
  final String ?sourceImage;
  final String ?yoastWpseoFocuskeywords;
  final String ?yoastWpseoKeywordsynonyms;
  final String ?editLock;
  final String ?thumbnailId;
  final String ?yoastWpseoContentScore;
  final String ?yoastWpseoPrimaryWeeks;
  final String ?wpOldDate;
  final String ?oembed31A462A611B39F2D991Ece0837D3799F;
  final String ?oembedTime31A462A611B39F2D991Ece0837D3799F;
  final String ?yoastWpseoPrimaryCats;
  final String ?wpPageTemplate;
  final Links? links;
  final String ?image;

  factory ChooseForYouModel.fromJson(String str) => ChooseForYouModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ChooseForYouModel.fromMap(Map<String, dynamic> json) => ChooseForYouModel(
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
    author: json["author"] == null ? null : json["author"],
    featuredMedia: json["featured_media"] == null ? null : json["featured_media"],
    commentStatus: json["comment_status"] == null ? null : json["comment_status"],
    pingStatus: json["ping_status"] == null ? null : json["ping_status"],
    template: json["template"] == null ? null : json["template"],
    weeks: json["weeks"] == null ? null : List<int>.from(json["weeks"].map((x) => x)),
    acf: json["acf"] == null ? null : List<dynamic>.from(json["acf"].map((x) => x)),
    lastEditorUsedJetpack: json["_last_editor_used_jetpack"] == null ? null : json["_last_editor_used_jetpack"],
    editLast: json["_edit_last"] == null ? null : json["_edit_last"],
    chooseForYouModelUrlSourceImg: json["url_source_img"] == null ? null : json["url_source_img"],
    urlSourceImg: json["_url_source_img"] == null ? null : json["_url_source_img"],
    chooseForYouModelSourceImage: json["source_image"] == null ? null : json["source_image"],
    sourceImage: json["_source_image"] == null ? null : json["_source_image"],
    yoastWpseoFocuskeywords: json["_yoast_wpseo_focuskeywords"] == null ? null : json["_yoast_wpseo_focuskeywords"],
    yoastWpseoKeywordsynonyms: json["_yoast_wpseo_keywordsynonyms"] == null ? null : json["_yoast_wpseo_keywordsynonyms"],
    editLock: json["_edit_lock"] == null ? null : json["_edit_lock"],
    thumbnailId: json["_thumbnail_id"] == null ? null : json["_thumbnail_id"],
    yoastWpseoContentScore: json["_yoast_wpseo_content_score"] == null ? null : json["_yoast_wpseo_content_score"],
    yoastWpseoPrimaryWeeks: json["_yoast_wpseo_primary_weeks"] == null ? null : json["_yoast_wpseo_primary_weeks"],
    wpOldDate: json["_wp_old_date"] == null ? null : json["_wp_old_date"],
    oembed31A462A611B39F2D991Ece0837D3799F: json["_oembed_31a462a611b39f2d991ece0837d3799f"] == null ? null : json["_oembed_31a462a611b39f2d991ece0837d3799f"],
    oembedTime31A462A611B39F2D991Ece0837D3799F: json["_oembed_time_31a462a611b39f2d991ece0837d3799f"] == null ? null : json["_oembed_time_31a462a611b39f2d991ece0837d3799f"],
    yoastWpseoPrimaryCats: json["_yoast_wpseo_primary_cats"] == null ? null : json["_yoast_wpseo_primary_cats"],
    wpPageTemplate: json["_wp_page_template"] == null ? null : json["_wp_page_template"],
    links: json["_links"] == null ? null : Links.fromMap(json["_links"]),
    image: json["image"] == null ? null : json["image"],
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
    "author": author == null ? null : author,
    "featured_media": featuredMedia == null ? null : featuredMedia,
    "comment_status": commentStatus == null ? null : commentStatus,
    "ping_status": pingStatus == null ? null : pingStatus,
    "template": template == null ? null : template,
    "weeks": weeks == null ? null : List<dynamic>.from(weeks!.map((x) => x)),
    "acf": acf == null ? null : List<dynamic>.from(acf!.map((x) => x)),
    "_last_editor_used_jetpack": lastEditorUsedJetpack == null ? null : lastEditorUsedJetpack,
    "_edit_last": editLast == null ? null : editLast,
    "url_source_img": chooseForYouModelUrlSourceImg == null ? null : chooseForYouModelUrlSourceImg,
    "_url_source_img": urlSourceImg == null ? null : urlSourceImg,
    "source_image": chooseForYouModelSourceImage == null ? null : chooseForYouModelSourceImage,
    "_source_image": sourceImage == null ? null : sourceImage,
    "_yoast_wpseo_focuskeywords": yoastWpseoFocuskeywords == null ? null : yoastWpseoFocuskeywords,
    "_yoast_wpseo_keywordsynonyms": yoastWpseoKeywordsynonyms == null ? null : yoastWpseoKeywordsynonyms,
    "_edit_lock": editLock == null ? null : editLock,
    "_thumbnail_id": thumbnailId == null ? null : thumbnailId,
    "_yoast_wpseo_content_score": yoastWpseoContentScore == null ? null : yoastWpseoContentScore,
    "_yoast_wpseo_primary_weeks": yoastWpseoPrimaryWeeks == null ? null : yoastWpseoPrimaryWeeks,
    "_wp_old_date": wpOldDate == null ? null : wpOldDate,
    "_oembed_31a462a611b39f2d991ece0837d3799f": oembed31A462A611B39F2D991Ece0837D3799F == null ? null : oembed31A462A611B39F2D991Ece0837D3799F,
    "_oembed_time_31a462a611b39f2d991ece0837d3799f": oembedTime31A462A611B39F2D991Ece0837D3799F == null ? null : oembedTime31A462A611B39F2D991Ece0837D3799F,
    "_yoast_wpseo_primary_cats": yoastWpseoPrimaryCats == null ? null : yoastWpseoPrimaryCats,
    "_wp_page_template": wpPageTemplate == null ? null : wpPageTemplate,
    "_links": links == null ? null : links!.toMap(),
    "image": image == null ? null : image,
  };
}

class Content {
  Content({
    this.rendered,
    this.protected,
  });

  final String? rendered;
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
    this.author,
    this.replies,
    this.versionHistory,
    this.wpFeaturedmedia,
    this.wpAttachment,
    this.wpTerm,
    this.curies,
    this.predecessorVersion,
  });

  final List<About>?self;
  final List<About>?collection;
  final List<About>?about;
  final List<Author> ?author;
  final List<Author> ?replies;
  final List<VersionHistory> ?versionHistory;
  final List<Author> ?wpFeaturedmedia;
  final List<About>? wpAttachment;
  final List<WpTerm> ?wpTerm;
  final List<Cury>? curies;
  final List<PredecessorVersion>? predecessorVersion;

  factory Links.fromJson(String str) => Links.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Links.fromMap(Map<String, dynamic> json) => Links(
    self: json["self"] == null ? null : List<About>.from(json["self"].map((x) => About.fromMap(x))),
    collection: json["collection"] == null ? null : List<About>.from(json["collection"].map((x) => About.fromMap(x))),
    about: json["about"] == null ? null : List<About>.from(json["about"].map((x) => About.fromMap(x))),
    author: json["author"] == null ? null : List<Author>.from(json["author"].map((x) => Author.fromMap(x))),
    replies: json["replies"] == null ? null : List<Author>.from(json["replies"].map((x) => Author.fromMap(x))),
    versionHistory: json["version-history"] == null ? null : List<VersionHistory>.from(json["version-history"].map((x) => VersionHistory.fromMap(x))),
    wpFeaturedmedia: json["wp:featuredmedia"] == null ? null : List<Author>.from(json["wp:featuredmedia"].map((x) => Author.fromMap(x))),
    wpAttachment: json["wp:attachment"] == null ? null : List<About>.from(json["wp:attachment"].map((x) => About.fromMap(x))),
    wpTerm: json["wp:term"] == null ? null : List<WpTerm>.from(json["wp:term"].map((x) => WpTerm.fromMap(x))),
    curies: json["curies"] == null ? null : List<Cury>.from(json["curies"].map((x) => Cury.fromMap(x))),
    predecessorVersion: json["predecessor-version"] == null ? null : List<PredecessorVersion>.from(json["predecessor-version"].map((x) => PredecessorVersion.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "self": self == null ? null : List<dynamic>.from(self!.map((x) => x.toMap())),
    "collection": collection == null ? null : List<dynamic>.from(collection!.map((x) => x.toMap())),
    "about": about == null ? null : List<dynamic>.from(about!.map((x) => x.toMap())),
    "author": author == null ? null : List<dynamic>.from(author!.map((x) => x.toMap())),
    "replies": replies == null ? null : List<dynamic>.from(replies!.map((x) => x.toMap())),
    "version-history": versionHistory == null ? null : List<dynamic>.from(versionHistory!.map((x) => x.toMap())),
    "wp:featuredmedia": wpFeaturedmedia == null ? null : List<dynamic>.from(wpFeaturedmedia!.map((x) => x.toMap())),
    "wp:attachment": wpAttachment == null ? null : List<dynamic>.from(wpAttachment!.map((x) => x.toMap())),
    "wp:term": wpTerm == null ? null : List<dynamic>.from(wpTerm!.map((x) => x.toMap())),
    "curies": curies == null ? null : List<dynamic>.from(curies!.map((x) => x.toMap())),
    "predecessor-version": predecessorVersion == null ? null : List<dynamic>.from(predecessorVersion!.map((x) => x.toMap())),
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

class Author {
  Author({
    this.embeddable,
    this.href,
  });

  final bool ?embeddable;
  final String ?href;

  factory Author.fromJson(String str) => Author.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Author.fromMap(Map<String, dynamic> json) => Author(
    embeddable: json["embeddable"] == null ? null : json["embeddable"],
    href: json["href"] == null ? null : json["href"],
  );

  Map<String, dynamic> toMap() => {
    "embeddable": embeddable == null ? null : embeddable,
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

class PredecessorVersion {
  PredecessorVersion({
    this.id,
    this.href,
  });

  final int ?id;
  final String ?href;

  factory PredecessorVersion.fromJson(String str) => PredecessorVersion.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PredecessorVersion.fromMap(Map<String, dynamic> json) => PredecessorVersion(
    id: json["id"] == null ? null : json["id"],
    href: json["href"] == null ? null : json["href"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "href": href == null ? null : href,
  };
}

class VersionHistory {
  VersionHistory({
    this.count,
    this.href,
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
    this.taxonomy,
    this.embeddable,
    this.href,
  });

  final String ?taxonomy;
  final bool ?embeddable;
  final String? href;

  factory WpTerm.fromJson(String str) => WpTerm.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory WpTerm.fromMap(Map<String, dynamic> json) => WpTerm(
    taxonomy: json["taxonomy"] == null ? null : json["taxonomy"],
    embeddable: json["embeddable"] == null ? null : json["embeddable"],
    href: json["href"] == null ? null : json["href"],
  );

  Map<String, dynamic> toMap() => {
    "taxonomy": taxonomy == null ? null : taxonomy,
    "embeddable": embeddable == null ? null : embeddable,
    "href": href == null ? null : href,
  };
}
