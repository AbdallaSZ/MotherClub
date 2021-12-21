import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motherclub/app/Models/ProductDetailsModel.dart';
import 'package:motherclub/app/Models/ProductModel.dart';
import 'package:motherclub/app/SearchModule/SearchModel.dart';
import 'package:motherclub/app/StateEnum.dart';
import 'package:motherclub/app/modules/bottomNavigation/views/bottom_screen.dart';
import 'package:motherclub/common/Utils/Utils.dart';
import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'SearchBloc.dart';
/// search screen to user if he will write character to get tour or trips or category
class DataSearch extends SearchDelegate<SearchInfo?> {


  DataSearch() : super(
    searchFieldLabel: Utils.labels!.search_product,

    ///     keyboardType: TextInputType.text,
    ///     textInputAction: TextInputAction.search,
  );

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          color: Colors.red,
          icon: Icon(Icons.clear, color: Colors.black,),
          onPressed: () {
            query = "";
          }),

    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    myStream.stream.listen((query) async{
      /*try {*/

        if((query!="" || query.isNotEmpty) && query.length > 1) {
          _searchSubject.sink.add(SearchState(
              ResultState.Loading));
          var myResult = await search(query);
          if (myResult.length > 0)
            _searchSubject.sink.add(SearchState(
                ResultState.Success, searchResultProducts: myResult));
          else
            _searchSubject.sink.add(SearchState(ResultState.Error,
                errorMessage: Utils.labels!.there_is_no_product + query));
        }
        else {
          _searchSubject.sink.add(SearchState(ResultState.Error,
              errorMessage:  query));
        }
     /* }catch(c){
        _searchSubject.sink.add(SearchState(ResultState.Error,
            errorMessage: c.toString()));
      }*/

    });
    // TODO: implement buildLeading
    return GestureDetector(
      onTap: () {
        close(context, null);
      },
      child: Icon(
        Icons.arrow_back,color: Colors.black,),
    );

  }

  @override
  Widget buildResults(BuildContext context) {

    // TODO: implement buildResults
    return Container(
    );
  }


  StreamController<String> myStream = StreamController<String>.broadcast();

  BehaviorSubject<SearchState> _searchSubject = BehaviorSubject<SearchState>();
  search(String keyword  )async{
    List<ProductDetailsModel> result =[];
    result = await Utils.bLoC.search( keyword);
    return result;
  }
  @override
  Widget buildSuggestions(BuildContext context) {
    debugPrint("user 's query now :  $query");
      myStream.sink.add(query);
    return Container(
      height:MediaQuery.of(context).size.height,
      color: Colors.white,
      child: StreamBuilder< SearchState>(
        stream: _searchSubject.stream,
        builder: (context , state){
          if(state.hasData ){
          if ( state.data!.resultState == ResultState.Loading )
          {
            return Center(child: CircularProgressIndicator(),);
          }else if(state.data!.resultState == ResultState.Success ){
          return  Padding(
              padding: EdgeInsets.all(16),
              child: ListView(
                shrinkWrap: true,
                children: [
                  state.data!.searchResultProducts!.length > 0 ? Padding(
                    padding: EdgeInsetsDirectional.only(start: 16),
                    child: Text(Utils.labels!.search_product,style: TextStyle(fontSize: 17,fontWeight:FontWeight.bold , color: Colors.black),),
                  ):Container(),
                  state.data!.searchResultProducts! .length > 0 ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.data!.searchResultProducts!.length,
                      itemBuilder: (c, index) {
                        return GestureDetector(
                          onTap: () {
                            close(context, SearchInfo(state.data!.searchResultProducts![index].id.toString()));
                          },
                          child: Column(
                            children: [
                              ListTile(
                                tileColor: Colors.white,
                                leading: Image.network(state.data!.searchResultProducts![index].images![0].src!,width: 60,height: 60,fit: BoxFit.fill),
                                title: Text(
                                    state.data!.searchResultProducts![index].name!,
                                    style: TextStyle(fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,)),
                              ),
                              Divider(height: 1,)
                            ],
                          ),
                        );
                      }):Container(),
                  SizedBox(height: 16,),


                ],
              ),
            );
          }

          else return Center(child: Text(state.data!.errorMessage ?? ""),);
        }
          else return Center();
        }
        ,
      ),
    );

  }


}
class SearchInfo{

  String? productId ;

  SearchInfo(this.productId);
}
