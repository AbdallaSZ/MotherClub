import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motherclub/app/modules/splash/controllers/splash_controllers.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:motherclub/common/CustomWidget/ResorcesListCard.dart';
import 'package:motherclub/common/CustomWidget/logslist_Widget.dart';
import 'package:motherclub/common/Utils/Utils.dart';


class blog_views extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    bool isChecked = false;
    return Scaffold(
        backgroundColor: Background_Color,
        appBar: AppBar(
          backgroundColor:Colors.white ,
          title: Container(
            child: Row(
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset('assets/images/sort.png',height: 37,width:  deviceWidth/14,)),

                Image.asset('assets/images/logo.png',width: deviceWidth/5,height: deviceHeight/8,),
                Text(Utils.labels!.expert_Blogs,style: GoogleFonts.roboto(
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
        body:CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildBuilderDelegate(

                    (BuildContext context, int index) {
                  return InkWell(
                      onTap: () {


                      },
                      child:Padding(
                          padding: EdgeInsets.all(10),
                          child: Container(
                            //sheight: 500,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                color:Colors.white),

                            child: Column(
                              children: [

                                Container(

                                  child: ExpansionTile(

                                      onExpansionChanged:(value){

                                      },

                                      title:   Text(Utils.labels!.physical,style: Theme.of(context).textTheme.headline4,),
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.only(left: 10,right: 10),
                                          //height: deviceHeight/4,
                                          child: ListView.builder(
                                              itemCount: 4,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemBuilder: (BuildContext context,int index){
                                                return Row(
                                                  children: [
                                                    Checkbox(
                                                      checkColor: Colors.white,
                                                      fillColor: MaterialStateProperty.resolveWith(getColor),
                                                      value: isChecked,
                                                      onChanged: (bool? value) {

                                                      },
                                                    ),
                                                    Text('Dr. Safeena Anas')
                                                  ],
                                                );
                                              }
                                          ),
                                        )
                                      ]
                                  ),
                                )

                              ],
                            ),

                          )));
                },
                childCount: 3,
              ),
            ),

            SliverList(
            delegate: SliverChildBuilderDelegate(

            (BuildContext context, int index) {
    return  Bloglist_Widget(deviceHeight, deviceWidth, context);}))

          ])

    );
  }
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.red;
  }
}
