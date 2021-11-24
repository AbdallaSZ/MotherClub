import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motherclub/app/Models/ProductModel.dart';
import 'package:motherclub/app/Shimmers/GridShimmer.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:motherclub/common/CustomWidget/appBarWidget.dart';
import 'package:motherclub/common/Utils/Utils.dart';

Widget  storeAppBar(String Label,double height , double width,BuildContext context) {
  double deviceHeight = MediaQuery
      .of(context)
      .size
      .height;
  double deviceWidth = MediaQuery
      .of(context)
      .size
      .width;
  return SingleChildScrollView(
    child: Column(
        children: [
          // AppBarWidget("Store", deviceHeight / 9.4, deviceWidth, context),


          Padding(
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
                  /*Icon(Icons.arrow_back,color: Colors.black,),
                        SizedBox(width: 20,),
                        Text('Category List',style: Theme.of(context).textTheme.headline1,),
*/

                ],),
            ),
          ),
          SizedBox(height:0),

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
              return  GridView.builder(
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
                    Text(Utils.labels!.amd+ data[index].price,style: GoogleFonts.roboto(
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
                    );
              } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
              }
              return GridShimmer(deviceWidth: deviceWidth, deviceHeight: deviceHeight);
              return CircularProgressIndicator();
              },

            )
          )










        ]),
  );
}
