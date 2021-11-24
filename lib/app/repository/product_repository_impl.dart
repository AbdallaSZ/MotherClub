// // import 'package:darisly_flutter_teacher/api_end_point.dart';
// // import 'package:darisly_flutter_teacher/di/injection.dart';
// // import 'package:darisly_flutter_teacher/models/order.dart';
// // import 'package:darisly_flutter_teacher/repositories/abstract/order_repository.dart';
// // import 'package:darisly_flutter_teacher/services/current_user.dart';
// // import 'package:darisly_flutter_teacher/utils/request_exception.dart';
// import 'package:motherclub/app/Models/ProductModel.dart';
// import 'package:motherclub/app/NetworkCalls/Api.dart';
//
// import 'package:rxdart/rxdart.dart';
//
// class OrderRepositoryImpl{
//   final _networkService = new NetworkService();
//
//
//
//   Future<List<ProductModel> > fetchPost() async {
//     final response =
//     await _networkService.getMyData(apiUrl);
//
//     if (response.statusCode == 200) {
//       // If the call to the server was successful, parse the JSON
//       List<dynamic> values=new List<dynamic>();
//       values = json.decode(response.body);
//       if(values.length>0){
//         for(int i=0;i<values.length;i++){
//           if(values[i]!=null){
//             Map<String,dynamic> map=values[i];
//             _postList .add(Post.fromJson(map));
//             debugPrint('Id-------${map['id']}');
//           }
//         }
//       }
//       return _postList;
//
//     } else {
//       // If that call was not successful, throw an error.
//       throw Exception('Failed to load post');
//     }
//   }
//
//   @override
//   Future<Order> fetchOrders() async{
//     return Stream.fromFuture(
//       _networkService.getForumAPICall(
//         _networkService,
//       ),
//     ).map(
//       (response) {
//         final resBody = _networkService.convertFromJson(response.body);
//         if (response.statusCode != 200 || null == response.statusCode) {
//           throw RequestException(resBody['message']);
//         } else {
//           return Order.fromMap(ordersMap);
//         }
//       },
//     );
//   }
//
//   Future<Order> _getOrderStreamFromList(List orderListOfMaps) async* {
//     if (orderListOfMaps.isEmpty) return;
//     for (var ordersMap in orderListOfMaps) {
//       final order = Order.fromMap(ordersMap);
//       yield order;
//     }
//   }
// }
