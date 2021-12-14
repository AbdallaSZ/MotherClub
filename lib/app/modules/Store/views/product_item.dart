import 'dart:collection';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motherclub/app/Models/ProductDetailsModel.dart';
import 'package:motherclub/app/Models/ProductModel.dart';
import 'package:motherclub/app/Models/wishlistModel.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:motherclub/common/Utils/Utils.dart';
import 'package:rxdart/rxdart.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({Key? key, required this.data}) : super(key: key);
  final ProductDetailsModel data;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  BehaviorSubject<String> rxSelectedAgeSubject = BehaviorSubject();
  WishlistModel dropdownValue = WishlistModel();
  String newWishlist = '';
  Set<WishlistModel> items = Set();
  TextEditingController controller = TextEditingController();
  TextEditingController itemNumberController = TextEditingController();
  BehaviorSubject<int> rxItemsCount = BehaviorSubject();
  int stockQuantity = 3;

  @override
  void dispose() {
    rxSelectedAgeSubject.close();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    stockQuantity = widget.data.stockQuantity!;
    itemNumberController.text = 1.toString();
    rxItemsCount.sink.add(1);

    super.initState();
  }

  _buildCountItem(Icon icon, Function onPress) {
    return Container(
      width: 25,
      height: 25,
      padding: EdgeInsets.all(2),
      alignment: Alignment.center,
      child: GestureDetector(
          onTap: () {
            onPress();
          },
          child: icon),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          shape: BoxShape.rectangle),
    );
  }

  _buildAgeSection(ProductDetailsModel model) {
    rxSelectedAgeSubject.sink.add(widget.data.attributes![0].options![0]);
    return StreamBuilder<String>(
        stream: rxSelectedAgeSubject.stream,
        builder: (context, snapshot) {
          return DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              value: snapshot.data,
              items: model.attributes![0].options!
                  .toSet()
                  .toList()
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (_) {
                rxSelectedAgeSubject.sink.add(_!);
              },
            ),
          );
        });
  }

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
                flex: 6,
                child: Image.network(
                  '${widget.data.images![0].src}',
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
              SizedBox(
                height: 5,
              ),
              Expanded(
                flex: 1,
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
                                                          '${widget.data.images![0].src}',
                                                          height: 100,
                                                          width: 155,
                                                        ),
                                                        Text(
                                                          "${widget.data.name}",
                                                          style: GoogleFonts
                                                              .roboto(
                                                            fontSize: 13,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color:
                                                                Black_textColor,
                                                          ),
                                                        ),
                                                        Text(
                                                            Utils.labels!.amd +
                                                                " ${widget.data.price}",
                                                            style: GoogleFonts
                                                                .roboto(
                                                              fontSize: 18,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color:
                                                                  Black_textColor,
                                                            )),
                                                      ],
                                                    )),

                                                // SizedBox(height:10),
                                                Expanded(
                                                  flex: 2,
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(Utils.labels!.quantity),
                                                          SizedBox(width: 10),
                                                          Expanded(
                                                            child: Container(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(5),
                                                              alignment: Alignment
                                                                  .bottomCenter,
                                                              height: 40,
                                                              child: StreamBuilder<
                                                                      int>(
                                                                  stream:
                                                                      rxItemsCount
                                                                          .stream,
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    if (snapshot
                                                                        .hasData)
                                                                      return Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceEvenly,
                                                                        children: [
                                                                          _buildCountItem(
                                                                              Icon(
                                                                                Icons.remove,
                                                                                color: snapshot.data! > 1 ? Color(0xffFF4550) : Colors.grey,
                                                                                size: 15,
                                                                              ),
                                                                              () {
                                                                            if (snapshot.data! >
                                                                                1)
                                                                              rxItemsCount.sink.add((snapshot.data!) - 1);
                                                                          }),
                                                                          SizedBox(
                                                                            width:
                                                                                10,
                                                                          ),
                                                                          Text(
                                                                              snapshot.data!.toString(),
                                                                              style: TextStyle(fontSize: 14, color: Colors.black87)),
                                                                          SizedBox(
                                                                            width:
                                                                                10,
                                                                          ),
                                                                          _buildCountItem(
                                                                              Icon(
                                                                                Icons.add,
                                                                                color: snapshot.data! < stockQuantity ? Color(0xffFF4550) : Colors.grey,
                                                                                size: 15,
                                                                              ),
                                                                              () {
                                                                            if (snapshot.data! <
                                                                                stockQuantity)
                                                                              rxItemsCount.sink.add((snapshot.data!) + 1);
                                                                          })
                                                                        ],
                                                                      );
                                                                    else
                                                                      return Container();
                                                                  }),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 15),
                                                      Row(
                                                        children: [
                                                          Text(Utils.labels!.variation),
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
                                                                          BorderRadius.all(
                                                                              Radius.circular(10.0))),
                                                              height: 40,
                                                              //width: Utils.deviceWidth/5,
                                                              child:
                                                                  _buildAgeSection(
                                                                      widget
                                                                          .data),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ]),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.blue),
                                            onPressed: () async {
                                              print(widget.data.id);
                                              String res = await Utils.bLoC
                                                  .addCartItems(
                                                      widget.data.id.toString(),
                                                      int.parse(rxItemsCount
                                                          .value
                                                          .toString()),
                                                      rxSelectedAgeSubject
                                                          .value);
                                              Navigator.pop(context);
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    res,
                                                  ),
                                                  duration: const Duration(
                                                      seconds: 3),
                                                ),
                                              );
                                            },
                                            child: Text(Utils.labels!.add_to_cart),
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
                          future: Utils.bLoC.wishlistWithUserId(Utils.id),
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
                                      child: CircularProgressIndicator(),
                                    ),
                                  )
                                : StatefulBuilder(
                                    builder: (_, StateSetter update) {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        //snapshot.hasData ?
                                        Container(
                                          alignment: Alignment.center,
                                          width: Utils.deviceWidth / 3,
                                          height: Utils.deviceHeight / 20,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: Colors.grey, width: .7),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0,
                                            ),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child:
                                                      DropdownButtonHideUnderline(
                                                    child: DropdownButton<
                                                        WishlistModel>(
                                                      hint: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          '${Utils.labels!.no_wish_list_yet}',
                                                        ),
                                                      ),
                                                      itemHeight: 50.0,
                                                      value: dropdownValue,
                                                      isExpanded: true,
                                                      style: const TextStyle(
                                                        color: Colors.blueGrey,
                                                      ),
                                                      onChanged: (WishlistModel?
                                                          newValue) {
                                                        update(() {
                                                          dropdownValue =
                                                              newValue!;
                                                        });
                                                      },
                                                      items: items.map<
                                                              DropdownMenuItem<
                                                                  WishlistModel>>(
                                                          (value) {
                                                        return DropdownMenuItem<
                                                            WishlistModel>(
                                                          value: value,
                                                          child: Text(
                                                            value.title!,
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                        );
                                                      }).toList(),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        //     : Container(
                                        //   decoration:
                                        //   BoxDecoration(
                                        //     borderRadius:
                                        //     BorderRadius
                                        //         .circular(10),
                                        //     border: Border.all(
                                        //       color: Colors.grey,
                                        //       width: .7,
                                        //     ),
                                        //   ),
                                        //   width:
                                        //   Utils.deviceWidth /
                                        //       3,
                                        //   height:
                                        //   Utils.deviceHeight /
                                        //       20,
                                        //   child: Center(
                                        //     child: Text(
                                        //       'No Wish list yet',
                                        //       style: TextStyle(
                                        //           color: Colors
                                        //               .grey),
                                        //     ),
                                        //   ),
                                        // ),
                                        IconButton(
                                            onPressed: () => showDialog(
                                                context: context,
                                                builder: (c) {
                                                  return AlertDialog(
                                                    title: Text(Utils.labels!
                                                        .add_wishlist_name),
                                                    content: TextField(
                                                      controller: controller,
                                                    ),
                                                    actions: [
                                                      ElevatedButton(
                                                        child: Text(
                                                            Utils.labels!.add),
                                                        onPressed: () async {
                                                          WishlistModel wm =
                                                              await Utils.bLoC
                                                                  .addWishlist(
                                                                      controller
                                                                          .text,
                                                                      Utils.id,
                                                                      'shared');
                                                          items.add(wm);
                                                          dropdownValue = wm;

                                                          update(() {
                                                            controller.text =
                                                                '';
                                                          });
                                                          Navigator.of(context)
                                                              .pop(
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content:Text(
                                                                    '${Utils.labels!.wish_List} ${Utils.labels!.added}' ),
                                                                duration:
                                                                    const Duration(
                                                                        seconds:
                                                                            3),
                                                              ),
                                                            ),
                                                          );
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
                                .addToWishlist(widget.data.id.toString(),
                                    dropdownValue.shareKey!)
                                .then(
                                  (value) => ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    SnackBar(
                                      content: Text(Utils.labels!.item_added),
                                      duration: Duration(seconds: 3),
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
                          style: ElevatedButton.styleFrom(primary: Colors.red),
                        ),
                      ],
                    );
                  });
            },
          ),
        )
      ],
    );
  }
}
