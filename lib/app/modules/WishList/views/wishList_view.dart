import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motherclub/app/Models/ProductModel.dart';
import 'package:motherclub/app/Shimmers/GridShimmer.dart';
import 'package:motherclub/app/modules/Store/controller/storeController.dart';
import 'package:motherclub/app/modules/Store/widgets/_performSearch.dart';
import 'package:motherclub/app/modules/Store/widgets/store_widget.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:motherclub/common/CustomWidget/CustomButton.dart';
import 'package:motherclub/common/CustomWidget/appBarWidget.dart';
import 'package:motherclub/common/Utils/Utils.dart';


class WishListView extends StatefulWidget {

  @override
  _StoreViewScreenState createState() => _StoreViewScreenState();
}

class _StoreViewScreenState  extends State<WishListView>{
  var _searchview = new TextEditingController();
  bool _show = false;
  bool _firstSearch = true;
  String _query = "";

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }
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
        bottomSheet: Card(
          color: Colors.white,
          child: Container(
            padding: EdgeInsets.all(10),
            height: Utils.deviceHeight/4,
          width: Utils.deviceWidth,
          child: Column(children: [
            Align(
                alignment: Alignment.topLeft,
                child: Text('Sizes:',style: Theme.of(context).textTheme.headline4,)),
            Container(
              height: 60,
              child: ListView.builder(

                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    height: 50,
                    width: 100,
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(8),
                    color: CustomButton_Color.withOpacity(0.1),
                    child: Text('10.5 cm',style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.normal,color: Colors.red)),


                  );
                },
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: Row(children: [
                Text('AMD 150',style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.normal,color: Colors.black)),
                SizedBox(width: 10,),
                Text('AMD 180',style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.normal,color: Colors.grey)),
                SizedBox(width: 10,),
                Text('(10% off)',style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.normal,color: Colors.red)),

              ],),
            ),
            SizedBox(height: 10,),
            CustomBUttonWidget('Done', Utils.deviceHeight/20, Utils.deviceWidth/1.1, context)
          ],),),
        ),
        appBar:  AppBar(
        backgroundColor:Colors.white ,
        title: Container(
          child: Row(
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset('assets/images/sort.png',height: 37,width:  deviceWidth/14,)),

              Image.asset('assets/images/logo.png',width: deviceWidth/5,height: deviceHeight/8,),
              Text('Wish List',style: GoogleFonts.roboto(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Black_textColor),),
              // Image.asset('assets/images/logo.png',width: 120,height: 87,),

            ],
          ),
        ),
        actions: [
          Icon(Icons.search,color: Colors.black87,),
          SizedBox(width: 20,),
          Image.asset('assets/images/translate.png'),

        ],
      ),
        body: SingleChildScrollView(
          child: Column(
              children: [
                // AppBarWidget("Store", deviceHeight / 9.4, deviceWidth, context),


                /*Padding(
                  padding: EdgeInsets.only(top:20),
                  child: Card(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(

                          height: deviceHeight/17,
                          width: deviceWidth/1.09,
                          // alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            border: Border.all(
                                color:white_color,
                                width: 0.5
                            ),
                          ),
                          child: TextFormField(
                            controller: _searchview,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              prefixIcon: Icon(Icons.search,color: Black_textColor,),
                              suffixIcon: Icon(Icons.sort,color: Black_textColor,),
                              labelText: 'Search Products',labelStyle: Theme.of(context).textTheme.bodyText2,
                              //  suffixIcon:  Icon(IconButton,color: Black_textColor,),
                              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                            ),
                          ),
                        ),
                        // SizedBox(width: 10,),
                        // Icon(Icons.sort,color: Colors.black,size: 25,),
                        *//*Icon(Icons.arrow_back,color: Colors.black,),
                        SizedBox(width: 20,),
                        Text('Category List',style: Theme.of(context).textTheme.headline1,),
*//*

                      ],),
                  ),
                ),
                SizedBox(height:0),
*/
                Container(
                    padding: EdgeInsets.all(10),
                    // color: Colors.red,
                    height: deviceHeight,
                    child: FutureBuilder<List<ProductModel>>(
                      future: Utils.bLoC.Product_list(context),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<ProductModel>? data = snapshot.data;
                          print(data);
                          return _firstSearch?  GridView.builder(
                            itemCount:data!.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount:  2,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                              childAspectRatio: (.53 ),
                            ),
                            itemBuilder: (context,index,) {
                              return Container(
                                padding: EdgeInsets.only(left: 10),
                                width: deviceWidth/2.3,
                                height: deviceHeight/2.98,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: white_color,),

                                child: SingleChildScrollView(
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children:[
                                        SizedBox(height:23),
                                        Image.network('${data[index].imageslist[0].src}',height: 130,width: 155,),
                                        SizedBox(height:15),

                                        Text("${data[index].name}",style: GoogleFonts.roboto(
                                          fontSize: 13,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w500,
                                          color: Black_textColor,

                                        ),
                                        ),
                                        SizedBox(height:15),
                                        Text("AMD ${data[index].price}",style: GoogleFonts.roboto(
                                          fontSize: 18,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w700,
                                          color: Black_textColor,

                                        )
                                        ),
                                        SizedBox(height:10),
                                        Container(
                                          alignment: Alignment.bottomRight,
                                          padding: EdgeInsets.only(right: 10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Icon(Icons.favorite_border,size: 28,),
                                              SizedBox(width:15),
                                              Container(
                                                width: 40,
                                                height:40,

                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(25.0),
                                                  gradient: LinearGradient(
                                                      begin: Alignment.topLeft,
                                                      end: Alignment.bottomRight,
                                                      stops: [0.0,0.1,10.0],

                                                      colors: [
                                                        // Colors.deepPurple.shade400,
                                                        CustomButton_Color,
                                                        CustomButton_Color,
                                                        CustomButton_Second_Color,
                                                        // Colors.deepPurple.shade200,
                                                      ]),

                                                  // gradient: colorsConstants.gradient1
                                                ),
                                                child: Icon(Icons.add_shopping_cart,color: Colors.white,),


                                              ),
                                            ],
                                          ),
                                        ),

                                      ]),
                                ),
                              );
                            },
                          ):performSearch(data!,_query);
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        return GridShimmer(deviceWidth: deviceWidth, deviceHeight: deviceHeight);
                        return CircularProgressIndicator();
                      },

                    )
                )










              ]),
        ),
        //storeAppBar("",deviceHeight/9.4,deviceWidth,context),
        /*floatingActionButton: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.0,0.1,10.0],

                colors: [
                  // Colors.deepPurple.shade400,
                  CustomButton_Color,
                  CustomButton_Color,
                  CustomButton_Second_Color,
                  // Colors.deepPurple.shade200,
                ]),
          ),
          child: Icon(Icons.shopping_cart,color: white_color,size: 35,)
        )*/


      ),
    );
  }

  Widget? _showBottomSheet()
  {
    if(_show)
    {
      return BottomSheet(
        onClosing: () {

        },
        builder: (context) {
          return Card(
            color: Colors.white,
            child: Container(
              padding: EdgeInsets.all(10),
              height: Utils.deviceHeight/4,
              width: Utils.deviceWidth,
              child: Column(children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Text('Sizes:',style: Theme.of(context).textTheme.headline4,)),
                Container(
                  height: 60,
                  child: ListView.builder(

                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 50,
                        width: 100,
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(8),
                        color: CustomButton_Color.withOpacity(0.1),
                        child: Text('10.5 cm',style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.normal,color: Colors.red)),


                      );
                    },
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Row(children: [
                    Text('AMD 150',style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.normal,color: Colors.black)),
                    SizedBox(width: 10,),
                    Text('AMD 180',style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.normal,color: Colors.grey)),
                    SizedBox(width: 10,),
                    Text('(10% off)',style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.normal,color: Colors.red)),

                  ],),
                ),
                SizedBox(height: 10,),
                CustomBUttonWidget('Done', Utils.deviceHeight/20, Utils.deviceWidth/1.1, context)
              ],),),
          );
        },
      );
    }
    else{
      return null;
    }
  }
}