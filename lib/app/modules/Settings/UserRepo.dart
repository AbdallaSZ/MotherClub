import 'package:motherclub/app/NetworkCalls/Api.dart';
import 'package:motherclub/common/Utils/Utils.dart';

class UserRepo {
  static Future<dynamic > changePassword (String oldPassword , String newPassword)async{
   var response =  await NetworkService.getMyData("api/change_password.php?user_id=${Utils.id}&password=$oldPassword&new_password=$newPassword");
    return response;
  }
}