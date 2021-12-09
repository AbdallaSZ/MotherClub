import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motherclub/app/Models/ProductModel.dart';
import 'package:motherclub/app/Models/wishlistModel.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:motherclub/common/Utils/Utils.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({Key? key, required this.data}) : super(key: key);
  final ProductModel data;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  WishlistModel dropdownValue = WishlistModel();
  String newWishlist = '';
  Set<WishlistModel> items = Set();
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: Utils.deviceWidth / 2.2,
          height: Utils.deviceHeight / 3.2,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(0xffe0e0e0),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 0), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(10),
            color: white_color,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex:6,
                child: Image.network(
                  '${widget.data.imageslist[0].src}',
                  fit: BoxFit.contain,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      "${widget.data.name}",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.roboto(
                        fontSize: 13,
                        height: 1.1,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        color: Black_textColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5,),
              Expanded(
                flex:1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("${widget.data.price} " + Utils.labels!.amd,
                        style: GoogleFonts.roboto(
                          fontSize: 18,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700,
                          color: Black_textColor,
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            int quantity = 1;
                            List<String> dropDItems = [
                              "0-3",
                              "3-6",
                              "6-9",
                              "9-12",
                            ];
                            String variation = '0-3';
                            return StatefulBuilder(builder: (context, update) {
                              return Container(
                                height: 220,
                                child: Card(
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    width: Utils.deviceWidth / 2.1,
                                    // height: deviceHeight/2.98,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: white_color,
                                    ),

                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              children: [
                                                // SizedBox(height:23),
                                                Expanded(
                                                    flex: 2,
                                                    child: Column(
                                                      children: [
                                                        Image.network(
                                                          '${widget.data
                                                              .imageslist[0]
                                                              .src}',
                                                          height: 100,
                                                          width: 155,
                                                        ),
                                                        Text(
                                                          "${widget.data.name}",
                                                          style:
                                                          GoogleFonts.roboto(
                                                            fontSize: 13,
                                                            fontStyle:
                                                            FontStyle.normal,
                                                            fontWeight:
                                                            FontWeight.w500,
                                                            color:
                                                            Black_textColor,
                                                          ),
                                                        ),
                                                        Text(
                                                            Utils.labels!.amd +
                                                                " ${widget.data
                                                                    .price}",
                                                            style: GoogleFonts
                                                                .roboto(
                                                              fontSize: 18,
                                                              fontStyle: FontStyle
                                                                  .normal,
                                                              fontWeight:
                                                              FontWeight.w700,
                                                              color:
                                                              Black_textColor,
                                                            )),
                                                      ],
                                                    )),

                                                // SizedBox(height:10),
                                                Expanded(
                                                  flex: 2,
                                                  child: Align(
                                                    alignment:
                                                    Alignment.bottomCenter,
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Text('Quantity'),
                                                            SizedBox(width: 10),
                                                            Expanded(
                                                              child: Container(
                                                                padding:
                                                                EdgeInsets
                                                                    .all(5),
                                                                alignment: Alignment
                                                                    .bottomCenter,
                                                                decoration:
                                                                BoxDecoration(
                                                                    border:
                                                                    Border
                                                                        .all(
                                                                      color: Colors
                                                                          .red,
                                                                      width:
                                                                      1,
                                                                    ),
                                                                    borderRadius:
                                                                    BorderRadius
                                                                        .all(
                                                                        Radius
                                                                            .circular(
                                                                            10.0))),
                                                                height: Utils
                                                                    .deviceHeight /
                                                                    22,
                                                                //width: Utils.deviceWidth/5,
                                                                child: Row(
                                                                  crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                                  mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                                  children: [
                                                                    GestureDetector(
                                                                      onTap: () {
                                                                        update(
                                                                                () {
                                                                              if (quantity >
                                                                                  1)
                                                                                quantity--;
                                                                            });
                                                                      },
                                                                      child: Icon(
                                                                        Icons
                                                                            .remove,
                                                                        size: 15,
                                                                      ),
                                                                    ),
                                                                    Text(quantity
                                                                        .toString(),
                                                                        style: GoogleFonts
                                                                            .roboto(
                                                                            fontSize:
                                                                            16,
                                                                            fontWeight: FontWeight
                                                                                .normal,
                                                                            color:
                                                                            Colors
                                                                                .black)),
                                                                    GestureDetector(
                                                                      onTap: () {
                                                                        update(
                                                                                () {
                                                                              quantity++;
                                                                            });
                                                                      },
                                                                      child: Icon(
                                                                        Icons.add,
                                                                        size: 18,
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(height: 15),
                                                        Row(
                                                          children: [
                                                            Text('Variation'),
                                                            SizedBox(width: 10),
                                                            Expanded(
                                                              child: Container(
                                                                padding:
                                                                EdgeInsets
                                                                    .all(5),
                                                                alignment: Alignment
                                                                    .bottomCenter,
                                                                decoration:
                                                                BoxDecoration(
                                                                    border:
                                                                    Border
                                                                        .all(
                                                                      color: Colors
                                                                          .red,
                                                                      width:
                                                                      1,
                                                                    ),
                                                                    borderRadius:
                                                                    BorderRadius
                                                                        .all(
                                                                        Radius
                                                                            .circular(
                                                                            10.0))),
                                                                height: Utils
                                                                    .deviceHeight /
                                                                    22,
                                                                //width: Utils.deviceWidth/5,
                                                                child:
                                                                DropdownButtonHideUnderline(
                                                                  child:
                                                                  DropdownButton<
                                                                      String>(
                                                                    value:
                                                                    variation,
                                                                    icon:
                                                                    const Icon(
                                                                      Icons
                                                                          .arrow_drop_down,
                                                                      size: 20,
                                                                    ),
                                                                    elevation: 16,
                                                                    style:
                                                                    const TextStyle(
                                                                      color: Colors
                                                                          .lightBlue,
                                                                      decoration:
                                                                      TextDecoration
                                                                          .none,
                                                                    ),
                                                                    onChanged:
                                                                        (String?
                                                                    newValue) {
                                                                      update(() {
                                                                        variation =
                                                                        newValue!;
                                                                      });
                                                                    },
                                                                    items: dropDItems
                                                                        .map<
                                                                        DropdownMenuItem<
                                                                            String>>((
                                                                        String
                                                                        value) {
                                                                      return DropdownMenuItem<
                                                                          String>(
                                                                        value:
                                                                        value,
                                                                        child:
                                                                        Text(
                                                                          '$value Months',
                                                                          style:
                                                                          const TextStyle(
                                                                            color:
                                                                            Colors
                                                                                .lightBlue,
                                                                            decoration:
                                                                            TextDecoration
                                                                                .none,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }).toList(),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ]),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.blue),
                                            onPressed: () async {
                                              String res = await Utils.bLoC
                                                  .addCartItems(widget.data.id,
                                                  quantity, variation);
                                              Navigator.pop(context);
                                              ScaffoldMessenger.of(
                                                  context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    res,
                                                  ),
                                                  duration:
                                                  const Duration(
                                                      seconds: 3),
                                                ),
                                              );
                                            },
                                            child: Text('Add To Cart'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            });
                          },
                        );
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
        PositionedDirectional(
          top: 15,
          start: 15,
          child: GestureDetector(
          child: Icon(
          Icons.favorite_border,
            size: 28,
          ),
          onTap: () {
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
                        future:
                        Utils.bLoC.wishlistWithUserId(Utils.id),
                        builder: (BuildContext context, snapshot) {
                          if (snapshot.hasData) {
                            dropdownValue = snapshot.data![0];
                            items.clear();
                            items.addAll(snapshot.data!);
                          }
                          return snapshot.connectionState ==
                              ConnectionState.waiting
                              ? Container(
                            alignment: Alignment.center,
                            width: Utils.deviceWidth / 3,
                            height: Utils.deviceHeight / 20,
                            child: Center(
                              child:
                              CircularProgressIndicator(),
                            ),
                          )
                              : StatefulBuilder(
                              builder: (_, StateSetter update) {
                                return Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    snapshot.hasData
                                        ? Container(
                                      alignment:
                                      Alignment.center,
                                      width:
                                      Utils.deviceWidth /
                                          3,
                                      height:
                                      Utils.deviceHeight /
                                          20,
                                      decoration:
                                      BoxDecoration(
                                        borderRadius:
                                        BorderRadius
                                            .circular(10),
                                        border: Border.all(
                                            color:
                                            Colors.grey,
                                            width: .7),
                                      ),
                                      child: Padding(
                                        padding:
                                        const EdgeInsets
                                            .symmetric(
                                          horizontal: 8.0,
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child:
                                              DropdownButtonHideUnderline(
                                                child: DropdownButton<
                                                    WishlistModel>(
                                                  hint:
                                                  Container(
                                                    alignment:
                                                    Alignment
                                                        .center,
                                                    child:
                                                    Text(
                                                      'Choose Wishlist:',
                                                    ),
                                                  ),
                                                  itemHeight:
                                                  50.0,
                                                  value:
                                                  dropdownValue,
                                                  isExpanded:
                                                  true,
                                                  style:
                                                  const TextStyle(
                                                    color: Colors
                                                        .blueGrey,
                                                  ),
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
                                                      .map<DropdownMenuItem<WishlistModel>>(
                                                          (value) {
                                                        return DropdownMenuItem<
                                                            WishlistModel>(
                                                          value:
                                                          value,
                                                          child:
                                                          Text(
                                                            value
                                                                .title!,
                                                            textAlign:
                                                            TextAlign.center,
                                                          ),
                                                        );
                                                      }).toList(),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                        : Container(
                                      decoration:
                                      BoxDecoration(
                                        borderRadius:
                                        BorderRadius
                                            .circular(10),
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: .7,
                                        ),
                                      ),
                                      width:
                                      Utils.deviceWidth /
                                          3,
                                      height:
                                      Utils.deviceHeight /
                                          20,
                                      child: Center(
                                        child: Text(
                                          'No Wish list yet',
                                          style: TextStyle(
                                              color: Colors
                                                  .grey),
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () => showDialog(
                                            context: context,
                                            builder: (c) {
                                              return AlertDialog(
                                                title: Text(Utils
                                                    .labels!
                                                    .add_wishlist_name),
                                                content: TextField(
                                                  controller:
                                                  controller,
                                                ),
                                                actions: [
                                                  ElevatedButton(
                                                    child: Text(
                                                        Utils
                                                            .labels!
                                                            .add),
                                                    onPressed:
                                                        () async {
                                                      WishlistModel wm = await Utils
                                                          .bLoC
                                                          .addWishlist(
                                                          controller
                                                              .text,
                                                          Utils
                                                              .id,
                                                          'shared');
                                                      items.add(wm);
                                                      dropdownValue =
                                                          wm;

                                                      update(() {
                                                        controller
                                                            .text = '';
                                                      });
                                                      Navigator.of(
                                                          context)
                                                          .pop(  ScaffoldMessenger.of(
                                                          context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content:
                                                          const Text(
                                                              'Wish list added'),
                                                          duration: const Duration(
                                                              seconds:
                                                              3),
                                                        ),
                                                      ),);
                                                    },
                                                  ),
                                                ],
                                              );
                                            }),
                                        icon: Icon(Icons.add)),
                                  ],
                                );
                              });
                        }),
                    actionsAlignment: MainAxisAlignment.spaceEvenly,
                    actions: [
                      ElevatedButton(
                        child: Text(Utils.labels!.yes),
                        onPressed: () async {
                          await Utils.bLoC
                              .addToWishlist(widget.data.id,
                              dropdownValue.shareKey!)
                              .then(
                                (value) =>
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(
                                  SnackBar(
                                    content: const Text(
                                        'Item added to wish list'),
                                    duration:
                                    const Duration(seconds: 3),
                                  ),
                                ),
                          );

                          Navigator.of(context).pop();
                        },
                      ),
                      ElevatedButton(
                        child: Text(Utils.labels!.cancel),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.red),
                      ),
                    ],
                  );
                });
          },
        ),)
      ],
    );
  }
}
