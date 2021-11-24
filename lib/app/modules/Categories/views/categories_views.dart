import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:motherclub/app/Models/CategoriesModel.dart';
import 'package:motherclub/app/Shimmers/FurmShimmer.dart';
import 'package:motherclub/app/modules/Categories/controllers/CalegoriesController.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:motherclub/common/CustomWidget/CategoriesCard.dart';
import 'package:motherclub/common/CustomWidget/appBarWidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motherclub/common/Utils/Utils.dart';

class CategoriesView extends GetView<CategoriesController> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Background_Color,
        appBar:AppBar(
         backgroundColor:Colors.white ,
         title: Container(
           child: Row(
             children: [
               Align(
                   alignment: Alignment.centerLeft,
                   child: Image.asset('assets/images/sort.png',height: 37,width:  deviceWidth/14,)),

               Image.asset('assets/images/logo.png',width: deviceWidth/5,height: deviceHeight/8,),
               Text(Utils.labels!.category,style: GoogleFonts.roboto(
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
        body: Container(
          padding: EdgeInsets.symmetric(vertical: deviceHeight/75,horizontal: deviceWidth/40),
          height: deviceHeight,
          width: deviceWidth,
          child:
    FutureBuilder<List<CategoriesModel>>(
    future: Utils.bLoC.categores_list(context),
    builder: (context, snapshot) {
    if (snapshot.hasData) {
    List<CategoriesModel>? data = snapshot.data;
    print('DADAD  $data');
    return ListView.builder(
        itemCount: data!.length,
        itemBuilder: (BuildContext context,int index){
          return CategoriresCard(deviceHeight, deviceWidth, context,data[index]);
        }
    );
    }
    else {
      return ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context,int index){
            return Card(child: FurmShimmer(deviceHeight, deviceWidth, context));

          });
    }
    }
    ),


        )
    );
  }
}