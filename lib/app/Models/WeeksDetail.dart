class WeeksDetail {
  late String name;
  late String description;
  late String videoLink;
  late String slug;

  WeeksDetail({
    required this.name,
    required this.description,
    required this.videoLink,
    required this.slug,
  });

  factory WeeksDetail.fromJson(Map<String, dynamic> json) {
    return WeeksDetail(
      name: json['name'],
      description: json['description'],
      videoLink: json['video_link'],
      slug: json['slug'],
    );
  }
}
