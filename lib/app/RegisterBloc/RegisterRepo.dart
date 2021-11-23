import 'package:motherclub/app/Models/RegisterRequestModel.dart';
import 'package:motherclub/app/Models/RegisterResponseModel.dart';
import 'package:motherclub/app/NetworkCalls/Api.dart';

class RegisterRepo {
  static Register(RegisterRequestModel model)async{
    var response =await NetworkService.post("api/user/register/", model.toJson());
    if(response["status"] !="error" )
      return RegisterResponseModel.fromJson(response) ;
    else return response["error"];
  }

}