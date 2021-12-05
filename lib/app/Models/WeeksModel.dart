class WeeksModel{
  late String id;
  late String name;
  late String slug;
  late String count;



  WeeksModel({required this.id, required this.name, required this.slug,required this.count});

  factory WeeksModel.fromJson(Map<String, dynamic> json) {
    return WeeksModel(id: json['id'], name: json['name'], slug: json['slug'], count: json['count']);  }
}
