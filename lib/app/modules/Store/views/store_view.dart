import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:motherclub/app/Models/ProductModel.dart';
import 'package:motherclub/app/SearchModule/DataSearch.dart';
import 'package:motherclub/app/SearchModule/SearchBloc.dart';
import 'package:motherclub/app/Shimmers/GridShimmer.dart';
import 'package:motherclub/app/modules/ProductDetailsModule/ProductDetailsBloc/ProductDetailsBloc.dart';
import 'package:motherclub/app/modules/Store/views/product_item.dart';
import 'package:motherclub/app/modules/Store/widgets/_performSearch.dart';
import 'package:motherclub/app/routes/app_pages.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:motherclub/common/Utils/Utils.dart';

import '../../ProductDetailsModule/ProductDetailsScreen.dart';

class StoreView extends StatefulWidget {
  @override
  _StoreViewScreenState createState() => _StoreViewScreenState();
}

class _StoreViewScreenState extends State<StoreView> {
  var _searchview = new TextEditingController();

  bool _firstSearch = true;
  String _query = "";
  SearchBloc? searchBloc ;

  @override
  void initState() {
    searchBloc =SearchBloc();
    super.initState();
  }
  List<ProductModel>? data;
  _StoreViewScreenState() {
    //Register a closure to be called when the object changes.
    _searchview.addListener(() {
      if (_searchview.text.isEmpty) {
        //Notify the framework that the internal state of this object has changed.
        setState(() {
          _firstSearch = true;
          _query = "";
        });
      } else {
        setState(() {
          _firstSearch = false;
          _query = _searchview.text;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          SingleChildScrollView(
            child: Column(children: [
              // AppBarWidget("Store", deviceHeight / 9.4, deviceWidth, context),

              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Card(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: deviceHeight / 17,
                        width: deviceWidth / 1.09,
                        // alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          border: Border.all(color: white_color, width: 0.5),
                        ),
                        child: GestureDetector(
                          onTap: (){
                            print("tapped");
                            DataSearch myDataSearch = DataSearch( data);
                            var result = showSearch(
                                context: context,
                                delegate:myDataSearch );
                           result.then((value){
                             if(value!=null){
                               Navigator.push(context, MaterialPageRoute(builder: (c)=>BlocProvider(
                                   create: (c)=>ProductDetailsBloc(),
                                   child: ProductDetailsScreen(value.productId!))));
                             }
                           });
                          },
                          child: TextFormField(
                            controller: _searchview,
                            enabled: false,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.search,
                                color: Black_textColor,
                              ),

                              labelText: Utils.labels!.search_product,
                              labelStyle: Theme.of(context).textTheme.bodyText2,
                              //  suffixIcon:  Icon(IconButton,color: Black_textColor,),
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(width: 10,),
                      // Icon(Icons.sort,color: Colors.black,size: 25,),
                      /*Icon(Icons.arrow_back,color: Colors.black,),
                              SizedBox(width: 20,),
                              Text('Category List',style: Theme.of(context).textTheme.headline1,),
*/
                    ],
                  ),
                ),
              ),
              SizedBox(height: 0),

              Container(
                padding: EdgeInsets.all(10),
                // color: Colors.red,
                height: deviceHeight,
                child: FutureBuilder<List<ProductModel>>(
                  future: Utils.bLoC.productList(context),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                       data = snapshot.data;
                      if (_firstSearch) {
                        return GridView.builder(
                              itemCount: data!.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20,
                                childAspectRatio: (.53),
                              ),
                              itemBuilder: (
                                context,
                                index,
                              ) {
                                return GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (c)=>BlocProvider(
                                          create: (c)=>ProductDetailsBloc(),
                                          child: ProductDetailsScreen(data![index].id))));
                                    },
                                    child: ProductItem(data: data![index]));
                              },
                            );
                      } else {
                        return performSearch(data!, _query);
                      }
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return GridShimmer(
                        deviceWidth: deviceWidth, deviceHeight: deviceHeight);
                  },
                ),
              ),
            ]),
          ),
          PositionedDirectional(
            bottom: 20,
            end: 40,
            child: Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: () {
                   Get.toNamed(Routes.CART);
                },
                child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [
                            0.0,
                            0.1,
                            10.0
                          ],
                          colors: [
                            // Colors.deepPurple.shade400,
                            CustomButton_Color,
                            CustomButton_Color,
                            CustomButton_Second_Color,
                            // Colors.deepPurple.shade200,
                          ]),
                    ),
                    child: Icon(
                      Icons.shopping_cart,
                      color: white_color,
                      size: 35,
                    )),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
