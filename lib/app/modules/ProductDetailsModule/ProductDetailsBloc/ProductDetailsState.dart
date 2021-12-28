import 'package:flutter/material.dart';
import 'package:motherclub/app/Models/ProductDetailsModel.dart';
import 'package:motherclub/app/StateEnum.dart';
class ProductDetailsState{
    ProductDetailsModel? model ;
    ResultState status;
    String? errorMessage ;
    ProductDetailsState(this.status,{this.model,this.errorMessage});
}