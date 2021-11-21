import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motherclub/app/Models/ProductModel.dart';
import 'package:motherclub/app/Shimmers/GridShimmer.dart';
import 'package:motherclub/app/modules/Store/controller/storeController.dart';
import 'package:motherclub/app/modules/Store/widgets/_performSearch.dart';
import 'package:motherclub/app/modules/Store/widgets/store_widget.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:motherclub/common/CustomWidget/appBarWidget.dart';
import 'package:motherclub/common/Utils/Utils.dart';


class NonetworkView extends StatefulWidget {

  @override
  _NonetworkViewState createState() => _NonetworkViewState();
}

class _NonetworkViewState  extends State<NonetworkView>{

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Container(
        alignment: Alignment.center,
        color: Colors.white,
        height: deviceHeight,
        width: deviceWidth,
        child: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Icon(Icons.no_cell_outlined,size: 80,),
            SizedBox(height: 30,),
            Align(
              alignment: Alignment.center,
                child: Text('You have not connected with internet connection please check your Network connection settings ',style: TextStyle(color: Colors.black54 ,fontSize: 15,decoration: TextDecoration.none,),textAlign: TextAlign.center,)),
              SizedBox(height: 30,),

              Align(
                  alignment: Alignment.center,
                  child: Text('Ok Go Back ',style: TextStyle(color: Colors.red ,fontSize: 15,decoration: TextDecoration.none,),textAlign: TextAlign.center,)),

            ],),
        ),
      ),
    );
  }
}