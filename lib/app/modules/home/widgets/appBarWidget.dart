import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motherclub/app/Models/CategoriesModel.dart';
import 'package:motherclub/app/Models/ProductModel.dart';
import 'package:motherclub/app/Shimmers/Product_Shimmer.dart';
import 'package:motherclub/app/modules/Store/views/product_item.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:motherclub/common/CustomWidget/InfoWidget.dart';
import 'package:motherclub/common/CustomWidget/appBarWidget.dart';
import 'package:motherclub/common/Utils/RandomColorModel.dart';
import 'package:motherclub/common/Utils/Utils.dart';

Widget  HomeAppBar(String Label,double height , double width,BuildContext context){
  double deviceHeight=MediaQuery.of(context).size.height;
  double deviceWidth=MediaQuery.of(context).size.width;
  return CustomScrollView(
    slivers: <Widget>[
      // SliverToBoxAdapter(
          // child: AppBarWidget("",deviceHeight/9.4,deviceWidth,context)),
      SliverToBoxAdapter(child: InfoWidget(Utils.labels!.hi+", ${Utils.name}",Utils.labels!.you_are_pregnant_for,Utils.labels!.week,"9-12",deviceHeight/10,deviceWidth,context)),
      SliverToBoxAdapter(
        child: Container(
          height: 120.0,
          child:

          FutureBuilder<List<CategoriesModel>>(
          future: Utils.bLoC.categores_list(context),
          builder: (context, snapshot) {
          if (snapshot.hasData) {
          List<CategoriesModel>? data = snapshot.data;
          print('DADAD  $data');
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: data!.length,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(8),
                color: Colors.white,
                child: Container(
                  // decoration: BoxDecoration(color: Colors.blueGrey),
                    height:deviceHeight/7.65,
                    width:deviceWidth/4.9,
                    child:Column(
                        children:[
                          Container(
                            height:66.66 ,
                            width: 78.47,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: RandomColorModel().getColor().withOpacity(0.3),
                            ),
                            child: Image.network(data[index].image),
                          ),
                          SizedBox(height:3),

                          Text('${data[index].title}',style: GoogleFonts.roboto(
                            fontSize: 13,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            color: Black_textColor,

                          ),textAlign: TextAlign.center,
                          ),
                        ]
                    )
                ),
              );
            },
          );
          }
          else{
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return snapshot.hasData? ProductShimer(height, width, context):Card(
                  // padding: EdgeInsets.all(2),
                  // color: Colors.yellow,
                  child: ProductShimer(height, width, context),
                );
              },
            );
          }}),

        ),
      ),

      SliverToBoxAdapter(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(Utils.labels!.we_choose_for_you,style: GoogleFonts.roboto(
                fontSize: 18,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w700,
                color: Black_textColor,

              ),
              ),
              Text(Utils.labels!.see_all,style: GoogleFonts.roboto(
                fontSize: 15,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                color: primary_text_color,

              ),
              ),
            ],
          ),
        ),
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          // To convert this infinite list to a list with three items,
          // uncomment the following line:
          // if (index > 3) return null;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 3),
            child: Card(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: white_color,

                ),
                height: deviceHeight/9.14,
                width: deviceWidth/1.05,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/images/home_listimage.png',height: 98,width: 98,),
                        SizedBox(width: 20,),
                        Text("Thiamine (Vitamin B1) in\n your diet \nduring pregnancy",style: GoogleFonts.roboto(
                          fontSize: 13,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          color: Black_textColor,

                        ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Container(
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
                        child: Icon(Icons.arrow_forward_outlined,color: Colors.white,),


                      ),
                    ),
                  ],
                ),
              ),
            ),
          );

        },
          // Or, uncomment the following line:
          childCount: 3,

        ),
      ),
      SliverToBoxAdapter(
        child: SizedBox(
          height: 29,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(Utils.labels!.shopping_products,style: GoogleFonts.roboto(
                  fontSize: 20,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700,
                  color: Black_textColor,

                ),
                ),
                Text(Utils.labels!.see_all,style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                  color: primary_text_color,

                ),
                ),
              ],
            ),
          ),
        ),
      ),
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Container(
            height: 300.0,
            child:

            FutureBuilder<List<ProductModel>>(
            future: Utils.bLoC.Product_list(context),
            builder: (context, snapshot) {
            if (snapshot.hasData) {
            List<ProductModel>? data = snapshot.data;
            print(data);
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: data!.length,
              itemBuilder: (context, index) {
                return ProductItem(data: data[index],);
                //   Card(
                //   // padding: EdgeInsets.all(2),
                //   // color: Colors.yellow,
                //   child: Container(
                //       padding: EdgeInsets.only(left: 10),
                //       decoration: BoxDecoration(),
                //       height:117,
                //       width:180,
                //       child:Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children:[
                //             SizedBox(height:23),
                //             Image.network('${data[index].imageslist[0].src}',height: 130,width: 155,),
                //             SizedBox(height:15),
                //
                //             Text("${data[index].name}",style: GoogleFonts.roboto(
                //               fontSize: 13,
                //               fontStyle: FontStyle.normal,
                //               fontWeight: FontWeight.w500,
                //               color: Black_textColor,
                //
                //             ),
                //             ),
                //             SizedBox(height:15),
                //             Text("AMD ${data[index].price}",style: GoogleFonts.roboto(
                //               fontSize: 18,
                //               fontStyle: FontStyle.normal,
                //               fontWeight: FontWeight.w700,
                //               color: Black_textColor,
                //             )
                //             ),
                //             SizedBox(height:10),
                //             Container(
                //               alignment: Alignment.bottomRight,
                //               padding: EdgeInsets.only(right: 10),
                //               child: Row(
                //                 mainAxisAlignment: MainAxisAlignment.end,
                //                 children: [
                //                   Icon(Icons.favorite_border,size: 28,),
                //                   SizedBox(width:20),
                //                   Container(
                //                     width: 40,
                //                     height:40,
                //
                //                     decoration: BoxDecoration(
                //                       borderRadius: BorderRadius.circular(25.0),
                //                       gradient: LinearGradient(
                //                           begin: Alignment.topLeft,
                //                           end: Alignment.bottomRight,
                //                           stops: [0.0,0.1,10.0],
                //
                //                           colors: [
                //                             // Colors.deepPurple.shade400,
                //                             CustomButton_Color,
                //                             CustomButton_Color,
                //                             CustomButton_Second_Color,
                //                             // Colors.deepPurple.shade200,
                //                           ]),
                //
                //                       // gradient: colorsConstants.gradient1
                //                     ),
                //                     child: Icon(Icons.add_shopping_cart,color: Colors.white,),
                //
                //
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           ]
                //       )
                //   ),
                // );
              },
            );}
            else{
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return snapshot.hasData? ProductShimer(height, width, context):Card(
                    // padding: EdgeInsets.all(2),
                    // color: Colors.yellow,
                    child: ProductShimer(height, width, context),
                  );
                },
              );
            }
  }),


          ),
        ),
      ),
    ]);
}