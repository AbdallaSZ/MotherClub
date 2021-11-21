class WeeksModel{
  late String Id;
  late String name;
  late String slug;
  late String count;



  WeeksModel({required this.Id, required this.name, required this.slug,required this.count});

  factory WeeksModel.fromJson(Map<String, dynamic> json) {
    return WeeksModel(Id: json['id'], name: json['name'], slug: json['slug'], count: json['count']);  }
}
