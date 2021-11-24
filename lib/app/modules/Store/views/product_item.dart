import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motherclub/app/Models/ProductModel.dart';
import 'package:motherclub/app/routes/app_pages.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:motherclub/common/Utils/Utils.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key, required this.data}) : super(key: key);
  final ProductModel data;

  @override
  Widget build(BuildContext context) {
    return Card(

      child: Container(
        width: Utils.deviceWidth / 2.3,
        height: Utils.deviceHeight / 3.6,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: .3,
              blurRadius: 1,
              offset: Offset(.1, .1), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          color: white_color,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Image.network(
              '${data.imageslist[0].src}',
              fit: BoxFit.contain,
            ),

            Text(
              "${data.name}",
              style: GoogleFonts.roboto(
                fontSize: 13,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                color: Black_textColor,
              ),
            ),

            Text("AMD ${data.price}",
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700,
                  color: Black_textColor,
                )),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 28,
                  ),
                  SizedBox(width: 15),
                  GestureDetector(
                    onTap: () async {
                      await Utils.bLoC.addCartItems(data.id,1,'0-3');
                      // Get.toNamed(Routes.CART);
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
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
                            ],),

                        // gradient: colorsConstants.gradient1
                      ),
                      child: Icon(
                        Icons.add_shopping_cart,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
