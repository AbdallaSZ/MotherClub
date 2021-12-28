class FormsModel {
  final int? id;
  final String? date;
  final String? dateGmt;
  final Guid? guid;
  final String? modified;
  final String? modifiedGmt;
  final String? slug;
  final String? status;
  final String? type;
  final String? link;
  final Title? title;
  final Content? content;
  final int? parent;
  final String? template;
  final List<dynamic>? acf;
  final Links? links;

  FormsModel({
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
    this.parent,
    this.template,
    this.acf,
    this.links,
  });

  FormsModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        date = json['date'] as String?,
        dateGmt = json['date_gmt'] as String?,
        guid = (json['guid'] as Map<String,dynamic>?) != null ? Guid.fromJson(json['guid'] as Map<String,dynamic>) : null,
        modified = json['modified'] as String?,
        modifiedGmt = json['modified_gmt'] as String?,
        slug = json['slug'] as String?,
        status = json['status'] as String?,
        type = json['type'] as String?,
        link = json['link'] as String?,
        title = (json['title'] as Map<String,dynamic>?) != null ? Title.fromJson(json['title'] as Map<String,dynamic>) : null,
        content = (json['content'] as Map<String,dynamic>?) != null ? Content.fromJson(json['content'] as Map<String,dynamic>) : null,
        parent = json['parent'] as int?,
        template = json['template'] as String?,
        acf = json['acf'] as List?,
        links = (json['_links'] as Map<String,dynamic>?) != null ? Links.fromJson(json['_links'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'date' : date,
    'date_gmt' : dateGmt,
    'guid' : guid?.toJson(),
    'modified' : modified,
    'modified_gmt' : modifiedGmt,
    'slug' : slug,
    'status' : status,
    'type' : type,
    'link' : link,
    'title' : title?.toJson(),
    'content' : content?.toJson(),
    'parent' : parent,
    'template' : template,
    'acf' : acf,
    '_links' : links?.toJson()
  };
}

class Guid {
  final String? rendered;

  Guid({
    this.rendered,
  });

  Guid.fromJson(Map<String, dynamic> json)
      : rendered = json['rendered'] as String?;

  Map<String, dynamic> toJson() => {
    'rendered' : rendered
  };
}

class Title {
  final String? rendered;

  Title({
    this.rendered,
  });

  Title.fromJson(Map<String, dynamic> json)
      : rendered = json['rendered'] as String?;

  Map<String, dynamic> toJson() => {
    'rendered' : rendered
  };
}

class Content {
  final String? rendered;
  final bool? protected;

  Content({
    this.rendered,
    this.protected,
  });

  Content.fromJson(Map<String, dynamic> json)
      : rendered = json['rendered'] as String?,
        protected = json['protected'] as bool?;

  Map<String, dynamic> toJson() => {
    'rendered' : rendered,
    'protected' : protected
  };
}

class Links {
  final List<Self>? self;
  final List<Collection>? collection;
  final List<About>? about;
  final List<VersionHistory>? versionHistory;
  final List<WpAttachment>? wpAttachment;
  final List<Curies>? curies;

  Links({
    this.self,
    this.collection,
    this.about,
    this.versionHistory,
    this.wpAttachment,
    this.curies,
  });

  Links.fromJson(Map<String, dynamic> json)
      : self = (json['self'] as List?)?.map((dynamic e) => Self.fromJson(e as Map<String,dynamic>)).toList(),
        collection = (json['collection'] as List?)?.map((dynamic e) => Collection.fromJson(e as Map<String,dynamic>)).toList(),
        about = (json['about'] as List?)?.map((dynamic e) => About.fromJson(e as Map<String,dynamic>)).toList(),
        versionHistory = (json['version-history'] as List?)?.map((dynamic e) => VersionHistory.fromJson(e as Map<String,dynamic>)).toList(),
        wpAttachment = (json['wp:attachment'] as List?)?.map((dynamic e) => WpAttachment.fromJson(e as Map<String,dynamic>)).toList(),
  curies = (json['curies'] as List?)?.map((dynamic e) => Curies.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
  'self' : self?.map((e) => e.toJson()).toList(),
  'collection' : collection?.map((e) => e.toJson()).toList(),
  'about' : about?.map((e) => e.toJson()).toList(),
  'version-history' : versionHistory?.map((e) => e.toJson()).toList(),
  'wp:attachment' : wpAttachment?.map((e) => e.toJson()).toList(),
  'curies' : curies?.map((e) => e.toJson()).toList()
};
}

class Self {
  final String? href;

  Self({
    this.href,
  });

  Self.fromJson(Map<String, dynamic> json)
      : href = json['href'] as String?;

  Map<String, dynamic> toJson() => {
    'href' : href
  };
}

class Collection {
  final String? href;

  Collection({
    this.href,
  });

  Collection.fromJson(Map<String, dynamic> json)
      : href = json['href'] as String?;

  Map<String, dynamic> toJson() => {
    'href' : href
  };
}

class About {
  final String? href;

  About({
    this.href,
  });

  About.fromJson(Map<String, dynamic> json)
      : href = json['href'] as String?;

  Map<String, dynamic> toJson() => {
    'href' : href
  };
}

class VersionHistory {
final int? count;
final String? href;

VersionHistory({
  this.count,
  this.href,
});

VersionHistory.fromJson(Map<String, dynamic> json)
: count = json['count'] as int?,
href = json['href'] as String?;

Map<String, dynamic> toJson() => {
  'count' : count,
  'href' : href
};
}

class WpAttachment{
final String? href;

WpAttachment({
  this.href,
});

WpAttachment.fromJson(Map<String, dynamic> json)
: href = json['href'] as String?;

Map<String, dynamic> toJson() => {
  'href' : href
};
}

class Curies {
  final String? name;
  final String? href;
  final bool? templated;

  Curies({
    this.name,
    this.href,
    this.templated,
  });

  Curies.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        href = json['href'] as String?,
        templated = json['templated'] as bool?;

  Map<String, dynamic> toJson() => {
    'name' : name,
    'href' : href,
    'templated' : templated
  };
}