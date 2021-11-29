import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motherclub/app/Models/ProductModel.dart';
import 'package:motherclub/app/Models/wishlistModel.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:motherclub/common/Utils/Utils.dart';

class WishlistCardItem extends StatefulWidget {
  const WishlistCardItem({Key? key, required this.data}) : super(key: key);
  final ProductModel data;

  @override
  State<WishlistCardItem> createState() => _WishlistCardItemState();
}

class _WishlistCardItemState extends State<WishlistCardItem> {

  WishlistModel dropdownValue = WishlistModel();
  String newWishlist = '';
  Set<WishlistModel> items = Set();
  TextEditingController controller = TextEditingController();
  bool isLiked = true;

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
              '${widget.data.imageslist[0].src}',
              fit: BoxFit.contain,
            ),
            Text(
              "${widget.data.name}",
              style: GoogleFonts.roboto(
                fontSize: 13,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                color: Black_textColor,
              ),
            ),
            Text("amd ${widget.data.price}",
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
                  GestureDetector(
                    child: Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                      color: Colors.red,
                      size: 28,
                    ),
                    onTap: () async {
                      if(!isLiked) {
                        showDialog(
                            context: context,
                            builder: (c) {
                              // dropdownValue = snapshot.data[0].title!;
                              return AlertDialog(
                                title: Container(
                                  height: 50,
                                  child: Image.asset(
                                    'assets/images/addLike.png',
                                    scale: 3,
                                  ),
                                ),
                                content: FutureBuilder<List<WishlistModel>>(
                                    future: Utils.bLoC
                                        .wishlistWithUserId(Utils.id),
                                    builder: (_, snapshot) {
                                      if (snapshot.hasData) {
                                        dropdownValue = snapshot.data![0];
                                        items.clear();
                                        items.addAll(snapshot.data!);
                                        return snapshot.connectionState ==
                                            ConnectionState.waiting
                                            ? Container(
                                            height:
                                            Utils.deviceHeight / 8,
                                            child: Center(
                                                child:
                                                CircularProgressIndicator()))
                                            : StatefulBuilder(
                                          builder:
                                              (BuildContext context,
                                              StateSetter update) {
                                            return Container(
                                              height:
                                              Utils.deviceHeight /
                                                  8,
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child:
                                                        Container(
                                                          padding:
                                                          const EdgeInsets
                                                              .fromLTRB(
                                                              20,
                                                              0,
                                                              20,
                                                              0),
                                                          child: DropdownButton<
                                                              WishlistModel>(
                                                            hint: Text(
                                                                'Choose Wishlist:'),
                                                            itemHeight:
                                                            50.0,
                                                            value:
                                                            dropdownValue,
                                                            isExpanded:
                                                            true,
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .black),
                                                            onChanged:
                                                                (WishlistModel?
                                                            newValue) {
                                                              update(
                                                                      () {
                                                                    dropdownValue =
                                                                    newValue!;
                                                                  });
                                                            },
                                                            items: items
                                                                .map<
                                                                DropdownMenuItem<
                                                                    WishlistModel>>(
                                                                    (value) {
                                                                  return DropdownMenuItem<
                                                                      WishlistModel>(
                                                                    value:
                                                                    value,
                                                                    child: Text(
                                                                        value
                                                                            .title!),
                                                                  );
                                                                }).toList(),
                                                          ),
                                                        ),
                                                      ),
                                                      IconButton(
                                                          onPressed: () =>
                                                              showDialog(
                                                                  context:
                                                                  context,
                                                                  builder:
                                                                      (c) {
                                                                    return AlertDialog(
                                                                      title: Text(
                                                                          'add wishlist name'),
                                                                      content: TextField(
                                                                        controller: controller,
                                                                      ),
                                                                      actions: [
                                                                        ElevatedButton(
                                                                          child: Text(
                                                                              "add"),
                                                                          onPressed: () async {
                                                                            WishlistModel wm = await Utils
                                                                                .bLoC
                                                                                .addWishlist(
                                                                                controller
                                                                                    .text,
                                                                                Utils
                                                                                    .id,
                                                                                'shared');
                                                                            items
                                                                                .add(
                                                                                wm);
                                                                            dropdownValue =
                                                                                wm;
                                                                            update(() {
                                                                              controller
                                                                                  .text =
                                                                              '';
                                                                            });
                                                                            Navigator
                                                                                .of(
                                                                                context)
                                                                                .pop();
                                                                          },
                                                                        ),
                                                                      ],
                                                                    );
                                                                  }),
                                                          icon: Icon(
                                                              Icons
                                                                  .add)),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      }
                                      return Container(
                                        height: Utils.deviceHeight / 8,
                                        child: Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      );
                                    }),
                                actionsAlignment:
                                MainAxisAlignment.spaceEvenly,
                                actions: [
                                  ElevatedButton(
                                    child: Text("YES"),
                                    onPressed: () async {
                                      await Utils.bLoC.addToWishlist(
                                          widget.data.id,
                                          dropdownValue.shareKey!);
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  ElevatedButton(
                                    child: Text("Cancel"),
                                    onPressed: () {
                                      //Put your code here which you want to execute on No button click.
                                      Navigator.of(context).pop();
                                    },
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.red),
                                  ),
                                ],
                              );
                            });
                      }else{

                        setState(() {

                          isLiked = !isLiked;
                        });
                        print("aaaaaaaaaaaaaaaaadddqwqeq${widget.data.id}");
                        await Utils.bLoC.delWishlistProd(widget.data.id);
                      }

                    },
                  ),
                  SizedBox(width: 15),
                  GestureDetector(
                    onTap: () async {
                      await Utils.bLoC.addCartItems(widget.data.id, 1, '0-3');
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
                          stops: [0.0, 0.1, 10.0],
                          colors: [
                            // Colors.deepPurple.shade400,
                            CustomButton_Color,
                            CustomButton_Color,
                            CustomButton_Second_Color,
                            // Colors.deepPurple.shade200,
                          ],
                        ),

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
