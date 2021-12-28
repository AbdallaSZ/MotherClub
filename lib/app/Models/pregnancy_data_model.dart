// To parse this JSON data, do
//
//     final pregnancyData = pregnancyDataFromMap(jsonString);

import 'dart:convert';

class PregnancyDataModel {
  PregnancyDataModel({
    this.id,
    this.count,
    this.description,
    this.link,
    this.name,
    this.slug,
    this.taxonomy,
    this.parent,
    this.meta,
    this.acf,
    this.pregnancyDatumAlternativeTitle,
    this.alternativeTitle,
    this.pregnancyDatumShortDesc,
    this.shortDesc,
    this.pregnancyDatumWeeksToGo,
    this.weeksToGo,
    this.pregnancyDatumImagePapy,
    this.imagePapy,
    this.pregnancyDatumResultBaby,
    this.resultBaby,
    this.pregnancyDatumIconWeek,
    this.iconWeek,
    this.pregnancyDatumAddData,
    this.addData,
    this.pregnancyDatumWeek10,
    this.week10,
    this.links,
    this.videoLink,
    this.articles,
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
  final String ?pregnancyDatumAlternativeTitle;
  final String ?alternativeTitle;
  final String ?pregnancyDatumShortDesc;
  final String ?shortDesc;
  final String ?pregnancyDatumWeeksToGo;
  final String ?weeksToGo;
  final String ?pregnancyDatumImagePapy;
  final String ?imagePapy;
  final String ?pregnancyDatumResultBaby;
  final String ?resultBaby;
  final String ?pregnancyDatumIconWeek;
  final String ?iconWeek;
  final String ?pregnancyDatumAddData;
  final String ?addData;
  final String ?pregnancyDatumWeek10;
  final String ?week10;
  final PregnancyDatumLinks ?links;
  final String ?videoLink;
  final List<Article> ?articles;

  factory PregnancyDataModel.fromJson(String str) => PregnancyDataModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PregnancyDataModel.fromMap(Map<String, dynamic> json) => PregnancyDataModel(
    id: json["id"] == null ? null : json["id"],
    count: json["count"] == null ? null : json["count"],
    description: json["description"] == null ? null : json["description"],
    link: json["link"] == null ? null : json["link"],
    name: json["name"] == null ? null : json["name"],
    slug: json["slug"] == null ? null : json["slug"],
    taxonomy: json["taxonomy"] == null ? null : taxonomyValues.map![json["taxonomy"]],
    parent: json["parent"] == null ? null : json["parent"],
    meta: json["meta"] == null ? null : List<dynamic>.from(json["meta"].map((x) => x)),
    acf: json["acf"] == null ? null : List<dynamic>.from(json["acf"].map((x) => x)),
    pregnancyDatumAlternativeTitle: json["alternative_title"] == null ? null : json["alternative_title"],
    alternativeTitle: json["_alternative_title"] == null ? null : json["_alternative_title"],
    pregnancyDatumShortDesc: json["short_desc"] == null ? null : json["short_desc"],
    shortDesc: json["_short_desc"] == null ? null : json["_short_desc"],
    pregnancyDatumWeeksToGo: json["weeks_to_go"] == null ? null : json["weeks_to_go"],
    weeksToGo: json["_weeks_to_go"] == null ? null : json["_weeks_to_go"],
    pregnancyDatumImagePapy: json["image_papy"] == null ? null : json["image_papy"],
    imagePapy: json["_image_papy"] == null ? null : json["_image_papy"],
    pregnancyDatumResultBaby: json["result_baby"] == null ? null : json["result_baby"],
    resultBaby: json["_result_baby"] == null ? null : json["_result_baby"],
    pregnancyDatumIconWeek: json["icon_week"] == null ? null : json["icon_week"],
    iconWeek: json["_icon_week"] == null ? null : json["_icon_week"],
    pregnancyDatumAddData: json["add_data"] == null ? null : json["add_data"],
    addData: json["_add_data"] == null ? null : json["_add_data"],
    pregnancyDatumWeek10: json["week_10"] == null ? null : json["week_10"],
    week10: json["_week_10"] == null ? null : json["_week_10"],
    links: json["_links"] == null ? null : PregnancyDatumLinks.fromMap(json["_links"]),
    videoLink: json["video_link"] == null ? null : json["video_link"],
    articles: json["articles"] == null ? null : List<Article>.from(json["articles"].map((x) => Article.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "count": count == null ? null : count,
    "description": description == null ? null : description,
    "link": link == null ? null : link,
    "name": name == null ? null : name,
    "slug": slug == null ? null : slug,
    "taxonomy": taxonomy == null ? null : taxonomyValues.reverse![taxonomy],
    "parent": parent == null ? null : parent,
    "meta": meta == null ? null : List<dynamic>.from(meta!.map((x) => x)),
    "acf": acf == null ? null : List<dynamic>.from(acf!.map((x) => x)),
    "alternative_title": pregnancyDatumAlternativeTitle == null ? null : pregnancyDatumAlternativeTitle,
    "_alternative_title": alternativeTitle == null ? null : alternativeTitle,
    "short_desc": pregnancyDatumShortDesc == null ? null : pregnancyDatumShortDesc,
    "_short_desc": shortDesc == null ? null : shortDesc,
    "weeks_to_go": pregnancyDatumWeeksToGo == null ? null : pregnancyDatumWeeksToGo,
    "_weeks_to_go": weeksToGo == null ? null : weeksToGo,
    "image_papy": pregnancyDatumImagePapy == null ? null : pregnancyDatumImagePapy,
    "_image_papy": imagePapy == null ? null : imagePapy,
    "result_baby": pregnancyDatumResultBaby == null ? null : pregnancyDatumResultBaby,
    "_result_baby": resultBaby == null ? null : resultBaby,
    "icon_week": pregnancyDatumIconWeek == null ? null : pregnancyDatumIconWeek,
    "_icon_week": iconWeek == null ? null : iconWeek,
    "add_data": pregnancyDatumAddData == null ? null : pregnancyDatumAddData,
    "_add_data": addData == null ? null : addData,
    "week_10": pregnancyDatumWeek10 == null ? null : pregnancyDatumWeek10,
    "_week_10": week10 == null ? null : week10,
    "_links": links == null ? null : links!.toMap(),
    "video_link": videoLink == null ? null : videoLink,
    "articles": articles == null ? null : List<dynamic>.from(articles!.map((x) => x.toMap())),
  };
}

class Article {
  Article({
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
    this.articleUrlSourceImg,
    this.urlSourceImg,
    this.articleSourceImage,
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

  final int? id;
  final DateTime ?date;
  final DateTime ?dateGmt;
  final Guid ?guid;
  final DateTime ?modified;
  final DateTime ?modifiedGmt;
  final String ?slug;
  final StatusEnum? status;
  final Type ?type;
  final String ?link;
  final Guid ?title;
  final Content? content;
  final int? author;
  final int ?featuredMedia;
  final Status?commentStatus;
  final Status?pingStatus;
  final String?template;
  final List<int>? weeks;
  final List<dynamic>? acf;
  final LastEditorUsedJetpack ?lastEditorUsedJetpack;
  final String ?editLast;
  final String ?articleUrlSourceImg;
  final UrlSourceImg ?urlSourceImg;
  final SourceImageEnum ?articleSourceImage;
  final SourceImage? sourceImage;
  final YoastWpseoFocuskeywords? yoastWpseoFocuskeywords;
  final YoastWpseoKeywordsynonyms ?yoastWpseoKeywordsynonyms;
  final String ?editLock;
  final String ?thumbnailId;
  final String ?yoastWpseoContentScore;
  final String ?yoastWpseoPrimaryWeeks;
  final String ?wpOldDate;
  final String ?oembed31A462A611B39F2D991Ece0837D3799F;
  final String ?oembedTime31A462A611B39F2D991Ece0837D3799F;
  final String ?yoastWpseoPrimaryCats;
  final String ?wpPageTemplate;
  final ArticleLinks ?links;
  final String ?image;

  factory Article.fromJson(String str) => Article.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Article.fromMap(Map<String, dynamic> json) => Article(
    id: json["id"] == null ? null : json["id"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    dateGmt: json["date_gmt"] == null ? null : DateTime.parse(json["date_gmt"]),
    guid: json["guid"] == null ? null : Guid.fromMap(json["guid"]),
    modified: json["modified"] == null ? null : DateTime.parse(json["modified"]),
    modifiedGmt: json["modified_gmt"] == null ? null : DateTime.parse(json["modified_gmt"]),
    slug: json["slug"] == null ? null : json["slug"],
    status: json["status"] == null ? null : statusEnumValues.map![json["status"]],
    type: json["type"] == null ? null : typeValues.map![json["type"]],
    link: json["link"] == null ? null : json["link"],
    title: json["title"] == null ? null : Guid.fromMap(json["title"]),
    content: json["content"] == null ? null : Content.fromMap(json["content"]),
    author: json["author"] == null ? null : json["author"],
    featuredMedia: json["featured_media"] == null ? null : json["featured_media"],
    commentStatus: json["comment_status"] == null ? null : statusValues.map![json["comment_status"]],
    pingStatus: json["ping_status"] == null ? null : statusValues.map![json["ping_status"]],
    template: json["template"] == null ? null : json["template"],
    weeks: json["weeks"] == null ? null : List<int>.from(json["weeks"].map((x) => x)),
    acf: json["acf"] == null ? null : List<dynamic>.from(json["acf"].map((x) => x)),
    lastEditorUsedJetpack: json["_last_editor_used_jetpack"] == null ? null : lastEditorUsedJetpackValues.map![json["_last_editor_used_jetpack"]],
    editLast: json["_edit_last"] == null ? null : json["_edit_last"],
    articleUrlSourceImg: json["url_source_img"] == null ? null : json["url_source_img"],
    urlSourceImg: json["_url_source_img"] == null ? null : urlSourceImgValues.map![json["_url_source_img"]],
    articleSourceImage: json["source_image"] == null ? null : sourceImageEnumValues.map![json["source_image"]],
    sourceImage: json["_source_image"] == null ? null : sourceImageValues.map![json["_source_image"]],
    yoastWpseoFocuskeywords: json["_yoast_wpseo_focuskeywords"] == null ? null : yoastWpseoFocuskeywordsValues.map![json["_yoast_wpseo_focuskeywords"]],
    yoastWpseoKeywordsynonyms: json["_yoast_wpseo_keywordsynonyms"] == null ? null : yoastWpseoKeywordsynonymsValues.map![json["_yoast_wpseo_keywordsynonyms"]],
    editLock: json["_edit_lock"] == null ? null : json["_edit_lock"],
    thumbnailId: json["_thumbnail_id"] == null ? null : json["_thumbnail_id"],
    yoastWpseoContentScore: json["_yoast_wpseo_content_score"] == null ? null : json["_yoast_wpseo_content_score"],
    yoastWpseoPrimaryWeeks: json["_yoast_wpseo_primary_weeks"] == null ? null : json["_yoast_wpseo_primary_weeks"],
    wpOldDate: json["_wp_old_date"] == null ? null : json["_wp_old_date"],
    oembed31A462A611B39F2D991Ece0837D3799F: json["_oembed_31a462a611b39f2d991ece0837d3799f"] == null ? null : json["_oembed_31a462a611b39f2d991ece0837d3799f"],
    oembedTime31A462A611B39F2D991Ece0837D3799F: json["_oembed_time_31a462a611b39f2d991ece0837d3799f"] == null ? null : json["_oembed_time_31a462a611b39f2d991ece0837d3799f"],
    yoastWpseoPrimaryCats: json["_yoast_wpseo_primary_cats"] == null ? null : json["_yoast_wpseo_primary_cats"],
    wpPageTemplate: json["_wp_page_template"] == null ? null : json["_wp_page_template"],
    links: json["_links"] == null ? null : ArticleLinks.fromMap(json["_links"]),
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
    "status": status == null ? null : statusEnumValues.reverse![status],
    "type": type == null ? null : typeValues.reverse![type],
    "link": link == null ? null : link,
    "title": title == null ? null : title!.toMap(),
    "content": content == null ? null : content!.toMap(),
    "author": author == null ? null : author,
    "featured_media": featuredMedia == null ? null : featuredMedia,
    "comment_status": commentStatus == null ? null : statusValues.reverse![commentStatus],
    "ping_status": pingStatus == null ? null : statusValues.reverse![pingStatus],
    "template": template == null ? null : template,
    "weeks": weeks == null ? null : List<dynamic>.from(weeks!.map((x) => x)),
    "acf": acf == null ? null : List<dynamic>.from(acf!.map((x) => x)),
    "_last_editor_used_jetpack": lastEditorUsedJetpack == null ? null : lastEditorUsedJetpackValues.reverse![lastEditorUsedJetpack],
    "_edit_last": editLast == null ? null : editLast,
    "url_source_img": articleUrlSourceImg == null ? null : articleUrlSourceImg,
    "_url_source_img": urlSourceImg == null ? null : urlSourceImgValues.reverse![urlSourceImg],
    "source_image": articleSourceImage == null ? null : sourceImageEnumValues.reverse![articleSourceImage],
    "_source_image": sourceImage == null ? null : sourceImageValues.reverse![sourceImage],
    "_yoast_wpseo_focuskeywords": yoastWpseoFocuskeywords == null ? null : yoastWpseoFocuskeywordsValues.reverse![yoastWpseoFocuskeywords],
    "_yoast_wpseo_keywordsynonyms": yoastWpseoKeywordsynonyms == null ? null : yoastWpseoKeywordsynonymsValues.reverse![yoastWpseoKeywordsynonyms],
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

enum SourceImageEnum { FREEPIK }

final sourceImageEnumValues = EnumValues({
  "freepik": SourceImageEnum.FREEPIK
});

enum Status { OPEN, CLOSED }

final statusValues = EnumValues({
  "closed": Status.CLOSED,
  "open": Status.OPEN
});

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

enum LastEditorUsedJetpack { CLASSIC_EDITOR, EMPTY }

final lastEditorUsedJetpackValues = EnumValues({
  "classic-editor": LastEditorUsedJetpack.CLASSIC_EDITOR,
  "": LastEditorUsedJetpack.EMPTY
});

class ArticleLinks {
  ArticleLinks({
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
  });

  final List<About> ?self;
  final List<About> ?collection;
  final List<About> ?about;
  final List<Author>? author;
  final List<Author>? replies;
  final List<VersionHistory>? versionHistory;
  final List<Author> ?wpFeaturedmedia;
  final List<About> ?wpAttachment;
  final List<WpTerm>? wpTerm;
  final List<Cury> ?curies;

  factory ArticleLinks.fromJson(String str) => ArticleLinks.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ArticleLinks.fromMap(Map<String, dynamic> json) => ArticleLinks(
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
  };
}

class About {
  About({
    this.href,
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

class Author {
  Author({
    this.embeddable,
    this.href,
  });

  final bool ?embeddable;
  final String? href;

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

  final Name ?name;
  final Href ?href;
  final bool ?templated;

  factory Cury.fromJson(String str) => Cury.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Cury.fromMap(Map<String, dynamic> json) => Cury(
    name: json["name"] == null ? null : nameValues.map![json["name"]],
    href: json["href"] == null ? null : hrefValues.map![json["href"]],
    templated: json["templated"] == null ? null : json["templated"],
  );

  Map<String, dynamic> toMap() => {
    "name": name == null ? null : nameValues.reverse![name],
    "href": href == null ? null : hrefValues.reverse![href],
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

  final Taxonomy ?taxonomy;
  final bool ?embeddable;
  final String ?href;

  factory WpTerm.fromJson(String str) => WpTerm.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory WpTerm.fromMap(Map<String, dynamic> json) => WpTerm(
    taxonomy: json["taxonomy"] == null ? null : taxonomyValues.map![json["taxonomy"]],
    embeddable: json["embeddable"] == null ? null : json["embeddable"],
    href: json["href"] == null ? null : json["href"],
  );

  Map<String, dynamic> toMap() => {
    "taxonomy": taxonomy == null ? null : taxonomyValues.reverse![taxonomy],
    "embeddable": embeddable == null ? null : embeddable,
    "href": href == null ? null : href,
  };
}

enum Taxonomy { WEEKS }

final taxonomyValues = EnumValues({
  "weeks": Taxonomy.WEEKS
});

enum SourceImage { FIELD_5_F5_EE9_B52_F5_E8 }

final sourceImageValues = EnumValues({
  "field_5f5ee9b52f5e8": SourceImage.FIELD_5_F5_EE9_B52_F5_E8
});

enum StatusEnum { PUBLISH }

final statusEnumValues = EnumValues({
  "publish": StatusEnum.PUBLISH
});

enum Type { PREGNANCY }

final typeValues = EnumValues({
  "pregnancy": Type.PREGNANCY
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

class PregnancyDatumLinks {
  PregnancyDatumLinks({
    this.self,
    this.collection,
    this.about,
    this.wpPostType,
    this.curies,
  });

  final List<About>? self;
  final List<About>? collection;
  final List<About>? about;
  final List<About>? wpPostType;
  final List<Cury> ?curies;

  factory PregnancyDatumLinks.fromJson(String str) => PregnancyDatumLinks.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PregnancyDatumLinks.fromMap(Map<String, dynamic> json) => PregnancyDatumLinks(
    self: json["self"] == null ? null : List<About>.from(json["self"].map((x) => About.fromMap(x))),
    collection: json["collection"] == null ? null : List<About>.from(json["collection"].map((x) => About.fromMap(x))),
    about: json["about"] == null ? null : List<About>.from(json["about"].map((x) => About.fromMap(x))),
    wpPostType: json["wp:post_type"] == null ? null : List<About>.from(json["wp:post_type"].map((x) => About.fromMap(x))),
    curies: json["curies"] == null ? null : List<Cury>.from(json["curies"].map((x) => Cury.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "self": self == null ? null : List<dynamic>.from(self!.map((x) => x.toMap())),
    "collection": collection == null ? null : List<dynamic>.from(collection!.map((x) => x.toMap())),
    "about": about == null ? null : List<dynamic>.from(about!.map((x) => x.toMap())),
    "wp:post_type": wpPostType == null ? null : List<dynamic>.from(wpPostType!.map((x) => x.toMap())),
    "curies": curies == null ? null : List<dynamic>.from(curies!.map((x) => x.toMap())),
  };
}

class EnumValues<T> {
  Map<String, T> ?map;
  Map<T, String> ?reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
