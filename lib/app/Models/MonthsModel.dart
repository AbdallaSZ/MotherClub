class MonthsModel{
  late String Id;
  late String name;
  late String slug;
  late String count;



  MonthsModel({required this.Id, required this.name, required this.slug,required this.count});

  factory MonthsModel.fromJson(Map<String, dynamic> json) {
    return MonthsModel(Id: json['id'], name: json['name'], slug: json['slug'], count: json['count']);  }
}
