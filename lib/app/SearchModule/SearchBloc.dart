import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motherclub/app/Models/ProductDetailsModel.dart';
import 'package:motherclub/app/Models/ProductModel.dart';
import 'package:motherclub/app/StateEnum.dart';
import 'package:motherclub/common/Utils/Utils.dart';

class SearchBloc extends Bloc<SearchEvent , SearchState>{
  SearchBloc() : super(SearchState(ResultState.Loading));
  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async*{
    // TODO: implement mapEventToState
    try {
      var result = search(event.keyword, event.models);
      if (result.length > 0) {
        yield SearchState(ResultState.Success, searchResultProducts: result);
      }
      else
        yield SearchState(ResultState.Success,
            errorMessage: Utils.labels!.there_is_no_product);
    }catch(e){
      yield SearchState(ResultState.Success,
          errorMessage: e.toString());
    }

  }
  List <ProductDetailsModel>search(String keyword, List<ProductDetailsModel> models ){
    List<ProductDetailsModel> result =[];
    for(var i in models){
      if (i.name!.toLowerCase().trim().contains(keyword.toLowerCase().trim())){
        result.add(i);
      }
    }
    return result;

  }

}
class SearchEvent {
  String keyword;
  List<ProductDetailsModel> models ;
  SearchEvent(this.keyword,this.models);
}
class SearchState{

  List<ProductDetailsModel>? searchResultProducts ;
  ResultState resultState ;
  String? errorMessage ;

  SearchState( this.resultState,{this.errorMessage , this.searchResultProducts});
}