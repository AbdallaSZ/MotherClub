class MonthDetailsModel {
  MonthDetailsModel({
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
    this.cartItemModelImageMonth,
    this.imageMonth,
    this.cartItemModelDescMonth,
    this.descMonth,
    this.cartItemModelAddUrlVid,
    this.addUrlVid,
    this.links,
  });

  final int ?id;
  final int ?count;
  final String ?description;
  final String ?link;
  final String ?name;
  final String ?slug;
  final String ?taxonomy;
  final int ?parent;
  final List<dynamic> ?meta;
  final List<dynamic> ?acf;
  final String ?cartItemModelImageMonth;
  final String ?imageMonth;
  final String ?cartItemModelDescMonth;
  final String ?descMonth;
  final String ?cartItemModelAddUrlVid;
  final String ?addUrlVid;
  final Links ?links;

  MonthDetailsModel copyWith({
    int ?id,
    int ?count,
    String ?description,
    String ?link,
    String ?name,
    String ?slug,
    String ?taxonomy,
    int ?parent,
    List<dynamic> ?meta,
    List<dynamic> ?acf,
    String ?cartItemModelImageMonth,
    String ?imageMonth,
    String ?cartItemModelDescMonth,
    String ?descMonth,
    String ?cartItemModelAddUrlVid,
    String ?addUrlVid,
    Links ?links,
  }) =>
      MonthDetailsModel(
        id: id ?? this.id,
        count: count ?? this.count,
        description: description ?? this.description,
        link: link ?? this.link,
        name: name ?? this.name,
        slug: slug ?? this.slug,
        taxonomy: taxonomy ?? this.taxonomy,
        parent: parent ?? this.parent,
        meta: meta ?? this.meta,
        acf: acf ?? this.acf,
        cartItemModelImageMonth: cartItemModelImageMonth ?? this.cartItemModelImageMonth,
        imageMonth: imageMonth ?? this.imageMonth,
        cartItemModelDescMonth: cartItemModelDescMonth ?? this.cartItemModelDescMonth,
        descMonth: descMonth ?? this.descMonth,
        cartItemModelAddUrlVid: cartItemModelAddUrlVid ?? this.cartItemModelAddUrlVid,
        addUrlVid: addUrlVid ?? this.addUrlVid,
        links: links ?? this.links,
      );
}

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

  Links copyWith({
    List<About> ?self,
    List<About> ?collection,
    List<About> ?about,
    List<About> ?wpPostType,
    List<Cury> ?curies,
  }) =>
      Links(
        self: self ?? this.self,
        collection: collection ?? this.collection,
        about: about ?? this.about,
        wpPostType: wpPostType ?? this.wpPostType,
        curies: curies ?? this.curies,
      );
}

class About {
  About({
    this.href,
  });

  final String ?href;

  About copyWith({
    String ?href,
  }) =>
      About(
        href: href ?? this.href,
      );
}

class Cury {
  Cury({
    this.name,
    this.href,
    this.templated,
  });

  final String ?name;
  final String ?href;
  final bool? templated;

  Cury copyWith({
    String ?name,
    String ?href,
    bool ?templated,
  }) =>
      Cury(
        name: name ?? this.name,
        href: href ?? this.href,
        templated: templated ?? this.templated,
      );
}
