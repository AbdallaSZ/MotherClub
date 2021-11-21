class FormsModel{
  late String Id;
  late String Date;
  late String Title;
  late String Content;
 


  FormsModel({required this.Id, required this.Date, required this.Title,required this.Content});

  factory FormsModel.fromJson(Map<String, dynamic> json) {
    return FormsModel(Id: json['id'], Date: json['date'], Title: json['title']['rendered'],Content: json['content']['rendered']);
  }
}
