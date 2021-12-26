import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motherclub/app/RegisterBloc/RegisterState.dart';
import 'package:motherclub/app/StateEnum.dart';
import 'package:motherclub/app/language/LanguageEvent.dart';
import 'package:motherclub/app/language/LanguageState.dart';
import 'package:motherclub/app/modules/ProductDetailsModule/ProductDetailsBloc/ProductDetailsEvent.dart';
import 'package:motherclub/app/modules/ProductDetailsModule/ProductDetailsBloc/ProductDetailsRepo.dart';
import 'package:motherclub/app/modules/ProductDetailsModule/ProductDetailsBloc/ProductDetailsState.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  ProductDetailsBloc() : super(ProductDetailsState(ResultState.Empty));

  @override
  Stream<ProductDetailsState> mapEventToState(
      ProductDetailsEvent event) async* {
    yield ProductDetailsState(ResultState.Loading);
    try {
       var result=    await ProductDetailsRepo.getProductDetails(event.id);
        if(result is String){
          yield ProductDetailsState(ResultState.Error, errorMessage: result);
        }
        else yield ProductDetailsState(ResultState.Success, model: result);
    } catch (exception) {
      yield ProductDetailsState(ResultState.Error, errorMessage: exception.toString());

    }
  }
}
