class WeeksDetail{
  late String name;
  late String description;
  late String video_link;



  WeeksDetail({required this.name, required this.description,required this.video_link});

  factory WeeksDetail.fromJson(Map<String, dynamic> json) {
    return WeeksDetail( name: json['name'], description: json['description'], video_link: json['video_link']);  }
}
