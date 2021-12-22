// To parse this JSON data, do
//
//     final monthsModel = monthsModelFromMap(jsonString);

import 'dart:convert';

class MonthsModel {
  MonthsModel({
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
    this.monthsModelImageMonth,
    this.imageMonth,
    this.monthsModelDescMonth,
    this.descMonth,
    this.monthsModelAddUrlVid,
    this.addUrlVid,
    this.links,
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
  final String ?monthsModelImageMonth;
  final ImageMonth? imageMonth;
  final String ?monthsModelDescMonth;
  final DescMonth ?descMonth;
  final AddUrlVidEnum ?monthsModelAddUrlVid;
  final AddUrlVid ?addUrlVid;
  final Links ?links;

  factory MonthsModel.fromJson(String str) => MonthsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MonthsModel.fromMap(Map<String, dynamic> json) => MonthsModel(
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
    monthsModelImageMonth: json["image_month"] == null ? null : json["image_month"],
    imageMonth: json["_image_month"] == null ? null : imageMonthValues.map![json["_image_month"]],
    monthsModelDescMonth: json["desc_month"] == null ? null : json["desc_month"],
    descMonth: json["_desc_month"] == null ? null : descMonthValues.map![json["_desc_month"]],
    monthsModelAddUrlVid: json["add_url_vid"] == null ? null : addUrlVidEnumValues.map![json["add_url_vid"]],
    addUrlVid: json["_add_url_vid"] == null ? null : addUrlVidValues.map![json["_add_url_vid"]],
    links: json["_links"] == null ? null : Links.fromMap(json["_links"]),
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
    "image_month": monthsModelImageMonth == null ? null : monthsModelImageMonth,
    "_image_month": imageMonth == null ? null : imageMonthValues.reverse![imageMonth],
    "desc_month": monthsModelDescMonth == null ? null : monthsModelDescMonth,
    "_desc_month": descMonth == null ? null : descMonthValues.reverse![descMonth],
    "add_url_vid": monthsModelAddUrlVid == null ? null : addUrlVidEnumValues.reverse![monthsModelAddUrlVid],
    "_add_url_vid": addUrlVid == null ? null : addUrlVidValues.reverse![addUrlVid],
    "_links": links == null ? null : links!.toMap(),
  };
}

enum AddUrlVid { FIELD_5_EFA5_D17223_C1 }

final addUrlVidValues = EnumValues({
  "field_5efa5d17223c1": AddUrlVid.FIELD_5_EFA5_D17223_C1
});

enum DescMonth { FIELD_5_EFA5_B0_C93_B59 }

final descMonthValues = EnumValues({
  "field_5efa5b0c93b59": DescMonth.FIELD_5_EFA5_B0_C93_B59
});

enum ImageMonth { FIELD_5_EFA58_F035410 }

final imageMonthValues = EnumValues({
  "field_5efa58f035410": ImageMonth.FIELD_5_EFA58_F035410
});

class Links {
  Links({
    this.self,
    this.collection,
    this.about,
    this.wpPostType,
    this.curies,
  });

  final List<About> ?self;
  final List<About> ?collection;
  final List<About> ?about;
  final List<About> ?wpPostType;
  final List<Cury> ?curies;

  factory Links.fromJson(String str) => Links.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Links.fromMap(Map<String, dynamic> json) => Links(
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

enum AddUrlVidEnum { X_EFNQ4_Q4_BFK, EMPTY }

final addUrlVidEnumValues = EnumValues({
  "": AddUrlVidEnum.EMPTY,
  "XEfnq4Q4bfk": AddUrlVidEnum.X_EFNQ4_Q4_BFK
});

enum Taxonomy { MONTHS }

final taxonomyValues = EnumValues({
  "months": Taxonomy.MONTHS
});

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
