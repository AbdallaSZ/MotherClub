import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:motherclub/common/CustomWidget/CustomButton.dart';
import 'package:motherclub/common/Utils/Utils.dart';

class product_details_views extends StatefulWidget {
  product_details_views() : super();

  final String title = "Carousel Demo";

  @override
  product_details_viewsState createState() => product_details_viewsState();
}

class product_details_viewsState extends State<product_details_views> {
  //
  late CarouselSlider carouselSlider;
  int _current = 0;
  List imgList = [
    'https://images.unsplash.com/photo-1502117859338-fd9daa518a9a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1554321586-92083ba0a115?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1536679545597-c2e5e1946495?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1543922596-b3bbaba80649?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1502943693086-33b5b1cfdf2f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80'
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,

        backgroundColor: Colors.white,
        title: Text('Item Details',style: TextStyle(color: Colors.black),),
      ),
      body: Container(
        color: Color(0xffE5E5E5),
        padding: EdgeInsets.all(10),
        child: Column(
        //  mainAxisAlignment: MainAxisAlignment.center,
         // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            carouselSlider = CarouselSlider(

              items: imgList.map((imgUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                     // margin: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.green,
                      ),
                      child: Image.network(
                        imgUrl,
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                );
              }).toList(),
             options: CarouselOptions(
      height: 200,
      aspectRatio: 16/9,
      viewportFraction: 0.8,
      initialPage: 0,
      enableInfiniteScroll: true,
      reverse: false,
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 3),
      autoPlayAnimationDuration: Duration(milliseconds: 800),
      autoPlayCurve: Curves.fastOutSlowIn,
      enlargeCenterPage: true,
     // onPageChanged: callbackFunction,
      scrollDirection: Axis.horizontal,
    ),
            ),
            SizedBox(
              height: 20,
            ),
           /* Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: map<Widget>(imgList, (index, url) {
                return Container(
                  width: 10.0,
                  height: 10.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index ? Colors.redAccent : Colors.green,
                  ),
                );
              }),
            ),
            SizedBox(
              height: 20.0,
            ),*/

            Container(
              padding: EdgeInsets.all(15),
              height:  MediaQuery.of(context).size.height/1.7,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(20.0),topLeft:Radius.circular(20.0)
                )
              ),
              child: Column(children: [
                Row(
                 children: [

                   Expanded(
                     flex:1,
                     child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text('Maternity Bladder Control ads',style: Theme.of(context).textTheme.headline4,),
                      Divider(height: 5,color: Colors.transparent,),
                      Row(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('AMD 150',style: GoogleFonts.roboto(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.red)),
                         SizedBox(width: Utils.deviceWidth/8,),
                          Text('AMD 150',style: GoogleFonts.roboto(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.grey)),

                        ],
                      ),





                    ],),
                  ),
                   Align(alignment:Alignment.topLeft,child: Icon(Icons.favorite,color: Colors.red,))

                ],),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)
                        )
                    ),
                    height: 60,
                    width: Utils.deviceWidth/2.5,
                    child:  Text('Discription',style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.normal,color: Colors.white)),

                  ),
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)
                        )
                    ),
                    height: 60,
                    width: Utils.deviceWidth/2.5,
                    child:  Text('Review',style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.normal,color: Colors.grey)),

                  )
                ],),
    SizedBox(
    height: 10,
    ),
                Text('Magnetic Energy Anion Sanitary Napkins are designed for your wellness during your periods. Magnetic Strip provides 3 natural energies (magnetism, anion and far infrared) that',style: GoogleFonts.roboto(fontSize: 14,fontWeight: FontWeight.normal,color: Colors.grey)),
                SizedBox(
                  height: 10,
                ),

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
                SizedBox(
                  height: Utils.deviceHeight/9,
                ),
                Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
    children: [

                  Container(
                    padding: EdgeInsets.all(15),
                    alignment: Alignment.center,
                 decoration: BoxDecoration(

                     border: Border.all(color: Colors.red,
                        width: 1,),
    borderRadius: BorderRadius.all(Radius.circular(10.0))

    ),
                    height: Utils.deviceHeight/17,
                    width: Utils.deviceWidth/2.7,
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Icon(Icons.remove),
                      Text('1',style: GoogleFonts.roboto(fontSize: 18,fontWeight: FontWeight.normal,color: Colors.black)),
                      Icon(Icons.add)
                    ],)
                  ),
    CustomBUttonWidget("Add to Cart", Utils.deviceHeight/17 , Utils.deviceWidth/2.3, context),

    ],)

              ],),
            ),

          ],
        ),
      ),
    );
  }


}