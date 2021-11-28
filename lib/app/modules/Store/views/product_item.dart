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
  String dropdownValue = 'default';
  String newWishlist = '';
  var items = <String>[];
  TextEditingController controller = TextEditingController();

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
                                  builder: (context, snapshot) {
                                    dropdownValue = snapshot.data![0].title!;
                                    items.clear();
                                    snapshot.data!.forEach((element) {
                                      items.add(element.title!);
                                    });
                                    items.add('default');
                                    return StatefulBuilder(
                                      builder: (BuildContext context,
                                          StateSetter update) {
                                        print('buildddddddddddddd${items}');

                                        return Container(
                                          height: Utils.deviceHeight / 8,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          20, 0, 20, 0),
                                                      child: DropdownButton<
                                                          String>(
                                                        hint: Text(
                                                            'Choose Wishlist:'),
                                                        itemHeight: 50.0,
                                                        value: dropdownValue,
                                                        isExpanded: true,
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.black),
                                                        onChanged:
                                                            (String? newValue) {
                                                          print('ppppppppppppppppttttttttttttt${newValue}');
                                                          update(() {
                                                            dropdownValue =
                                                                newValue!;
                                                            print(
                                                                'adasdkkkkkkkkkkkkkkkkkkk$dropdownValue نننننننن$items');
                                                          });
                                                        },
                                                        items: items.map<
                                                            DropdownMenuItem<
                                                                String>>((String
                                                            value) {
                                                          return DropdownMenuItem<
                                                              String>(
                                                            value: value,
                                                            child: Text(value),
                                                            onTap: () {},
                                                          );
                                                        }).toList(),
                                                      ),
                                                    ),
                                                  ),
                                                  IconButton(
                                                      onPressed: () =>
                                                          showDialog(
                                                              context: context,
                                                              builder: (c) {
                                                                return AlertDialog(
                                                                  title: Text(
                                                                      'add wishlist name'),
                                                                  content:
                                                                      TextField(
                                                                    controller:
                                                                        controller,
                                                                  ),
                                                                  actions: [
                                                                    ElevatedButton(
                                                                      child: Text(
                                                                          "add"),
                                                                      onPressed:
                                                                          () async {
                                                                        update(
                                                                            () {
                                                                          items.add(
                                                                              controller.text);
                                                                          dropdownValue =
                                                                              controller.text;
                                                                          controller.text =
                                                                              '';
                                                                        });
                                                                        await Utils.networkcall.createWishlist(
                                                                            dropdownValue,
                                                                            Utils.id,
                                                                            'shared');
                                                                        Navigator.of(context)
                                                                            .pop();
                                                                      },
                                                                    ),
                                                                  ],
                                                                );
                                                              }),
                                                      icon: Icon(Icons.add)),
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  }),
                              actionsAlignment: MainAxisAlignment.spaceEvenly,
                              actions: [
                                ElevatedButton(
                                  child: Text("YES"),
                                  onPressed: () {
                                    //Put your code here which you want to execute on Yes button click.
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
