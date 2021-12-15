import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:motherclub/app/Models/cart_item_model.dart';

import 'package:motherclub/app/Shimmers/GridShimmer.dart';
import 'package:motherclub/app/modules/Cart/views/ShippingDetailsScreen.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:motherclub/common/CustomWidget/CustomButton.dart';
import 'package:motherclub/common/CustomWidget/statless/custom_appbar.dart';
import 'package:motherclub/common/Utils/Utils.dart';
import 'package:rxdart/rxdart.dart';

class CartView extends StatefulWidget {
  @override
  _StoreViewScreenState createState() => _StoreViewScreenState();
}

class _StoreViewScreenState extends State<CartView> {
  BehaviorSubject<int> rxItemsCount = BehaviorSubject();

  @override
  void initState() {
    rxItemsCount.sink.add(0);
    super.initState();
  }

  @override
  void dispose() {
    rxItemsCount.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: FutureBuilder<List<Item>>(
          future: Utils.bLoC.cartItemsList(),
          builder: (context, snapshot) {
            List<Item>? data = snapshot.data;
            //   if (data != null)
            // rxItemsCount.sink.add(data.length);

            if (snapshot.hasData) {
              rxItemsCount.sink.add(snapshot.data!.length);
              return StreamBuilder<int>(
                  stream: rxItemsCount.stream,
                  builder: (context, snapshot2) {
                    return Scaffold(
                      appBar: CustomAppBar(
                        onBackButtonPressed: () {
                          Navigator.of(context).pop();
                        },
                        centerTitle: true,
                        withBackButton: true,
                        title: Utils.labels!.your_cart,
                      ),
                      bottomSheet: Card(
                        color: Colors.white,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          height: Utils.deviceHeight / 4.33,
                          width: Utils.deviceWidth,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(Utils.labels!.items,
                                      style: GoogleFonts.roboto(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.blueGrey)),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(Utils.labels!.amd + " " + getTotal(data),
                                      style: GoogleFonts.roboto(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black)),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(Utils.labels!.discount,
                                      style: GoogleFonts.roboto(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.blueGrey)),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(Utils.labels!.amd + "0",
                                      style: GoogleFonts.roboto(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black)),
                                ],
                              ),
                              Divider(
                                thickness: 2,
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(Utils.labels!.total,
                                      style: GoogleFonts.roboto(
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black)),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(Utils.labels!.amd + " " + getTotal(data),
                                      style: GoogleFonts.roboto(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.redAccent)),
                                ],
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              CustomBUttonWidget(
                                  Utils.labels!.checkout,
                                  Utils.deviceHeight / 20,
                                  Utils.deviceWidth / 1.1,
                                  context, onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (c) {
                                  return ShippingDetailsScreen(
                                      data, double.parse(getTotal(data)));
                                }));
                              }),
                            ],
                          ),
                        ),
                      ),
                      body: SingleChildScrollView(
                        child: Column(children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.green.withOpacity(0.1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.shopping_basket,
                                  color: Colors.green,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                    "${Utils.labels!.you_have} ${snapshot2.data} ${Utils.labels!.items_in_your_cart}",
                                    style: GoogleFonts.roboto(
                                      fontSize: 13,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.green,
                                    ))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Container(
                              // color: Colors.red,
                              height: deviceHeight / 1.9,
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: snapshot2.data,
                                itemBuilder: (context, index) {
                                  return Dismissible(
                                    direction: DismissDirection.endToStart,
                                    onDismissed: (d) async {
                                      // Remove the item from the data source.
                                      await Utils.bLoC
                                          .delCartItems(
                                              data![index].itemKey!)
                                          .then((value) => ScaffoldMessenger
                                                  .of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(
                                                      '${data[index].title} ${Utils.labels!.has_deleted}'))));
                                      data.removeAt(index);
                                      rxItemsCount.sink.add(data.length);
                                    },
                                    key: Key(data![index].id.toString()),
                                    child: Row(
                                      children: [
                                        Card(
                                          child: Container(
                                            padding: EdgeInsets.all(10),
                                            width: deviceWidth -70,
                                            height: deviceHeight / 5,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: white_color,
                                            ),
                                            child: SingleChildScrollView(
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  //crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    // SizedBox(height:23),
                                                    Expanded(
                                                        flex: 2,
                                                        child: Image.network(
                                                          '${data[index].featuredImage}',
                                                          height: 100,
                                                          width: 155,
                                                        )),
                                                    // SizedBox(height:15),
                                                    Expanded(
                                                      flex: 3,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Align(
                                                            alignment: Alignment
                                                                .topLeft,
                                                            child: Text(
                                                              "${data[index].title}",
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                fontSize: 13,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color:
                                                                    Black_textColor,
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(height: 15),
                                                          Align(
                                                            alignment: Alignment
                                                                .topLeft,
                                                            child: Text(
                                                                (data[index]
                                                                            .meta!
                                                                            .variation ==
                                                                        null)
                                                                    ? '0-3 Months'
                                                                    : data[index]
                                                                        .meta!
                                                                        .variation!
                                                                        .age!,
                                                                style:
                                                                    GoogleFonts
                                                                        .roboto(
                                                                  fontSize: 14,
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .normal,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: Colors
                                                                      .grey,
                                                                )),
                                                          ),
                                                          SizedBox(height: 15),
                                                          Text(
                                                              Utils.labels!
                                                                      .amd +
                                                                  (double.parse(data[index]
                                                                              .price!) *
                                                                          int.parse(data[index]
                                                                              .quantity!
                                                                              .value
                                                                              .toString()))
                                                                      .toString(),
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
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 1,
                                                      child: Align(
                                                        alignment: Alignment
                                                            .bottomCenter,
                                                        child: Container(
                                                            padding: EdgeInsets.all(
                                                                5),
                                                            alignment: Alignment
                                                                .bottomCenter,
                                                            decoration:
                                                                BoxDecoration(
                                                                    border: Border
                                                                        .all(
                                                                      color: Colors
                                                                          .red,
                                                                      width: 1,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.all(Radius.circular(
                                                                            10.0))),
                                                            height:
                                                                Utils.deviceHeight /
                                                                    25,
                                                            //width: Utils.deviceWidth/5,
                                                            child: Text(
                                                                data[index]
                                                                    .quantity!
                                                                    .value
                                                                    .toString(),
                                                                style: GoogleFonts.roboto(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    color: Colors
                                                                        .black))),
                                                      ),
                                                    ),
                                                  ]),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Container(
                                            color: Colors.redAccent,
                                            width: 30,
                                            height: deviceHeight / 5,
                                            child: Center(
                                              child: Icon(
                                                Icons.delete_forever_outlined,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          )
                        ]),
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              //throw Exception(snapshot.stackTrace);
              return Scaffold(body: Center(child: Text("${snapshot.error}")));
            }
            return Scaffold(
              body: GridShimmer(
                  deviceWidth: deviceWidth, deviceHeight: deviceHeight),
            );
          }),
      //  }),
    );
  }

  String getTotal(List<Item>? data) {
    double total = 0;
    for (var i in data!) {
      total += (i.quantity!.value! * double.parse(i.price!));
    }
    return total.toString();
  }

// Widget? _showBottomSheet() {
//   if (_show) {
//     return BottomSheet(
//       onClosing: () {},
//       builder: (context) {
//         return Card(
//           color: Colors.white,
//           child: Container(
//             padding: EdgeInsets.all(10),
//             height: Utils.deviceHeight / 4,
//             width: Utils.deviceWidth,
//             child: Column(
//               children: [
//                 Align(
//                     alignment: Alignment.topLeft,
//                     child: Text(
//                       Utils.labels!.sizes,
//                       style: Theme.of(context).textTheme.headline4,
//                     )),
//                 Container(
//                   height: 60,
//                   child: ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: 5,
//                     itemBuilder: (context, index) {
//                       return Container(
//                         height: 50,
//                         width: 100,
//                         alignment: Alignment.center,
//                         margin: EdgeInsets.all(8),
//                         color: CustomButton_Color.withOpacity(0.1),
//                         child: Text('10.5 cm',
//                             style: GoogleFonts.roboto(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.normal,
//                                 color: Colors.red)),
//                       );
//                     },
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(left: 8),
//                   child: Row(
//                     children: [
//                       Text(Utils.labels!.amd + '150',
//                           style: GoogleFonts.roboto(
//                               fontSize: 16,
//                               fontWeight: FontWeight.normal,
//                               color: Colors.black)),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Text(Utils.labels!.amd + '180',
//                           style: GoogleFonts.roboto(
//                               fontSize: 16,
//                               fontWeight: FontWeight.normal,
//                               color: Colors.grey)),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Text('(10% off)',
//                           style: GoogleFonts.roboto(
//                               fontSize: 16,
//                               fontWeight: FontWeight.normal,
//                               color: Colors.red)),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 CustomBUttonWidget(Utils.labels!.done,
//                     Utils.deviceHeight / 20, Utils.deviceWidth / 1.1, context)
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   } else {
//     return null;
//   }
// }
}
