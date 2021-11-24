
import 'package:motherclub/app/Models/RegisterResponseModel.dart';

import '../StateEnum.dart';
class RegisterState {
  ResultState? resultState ;
RegisterResponseModel? model;
String? errorMessage ;

  RegisterState({this.resultState, this.model , this.errorMessage});
}