import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motherclub/app/Models/wishlistModel.dart';
import 'package:motherclub/app/modules/WishList/views/wishList_view.dart';
import 'package:motherclub/app/routes/app_pages.dart';
import 'package:motherclub/common/CustomWidget/statless/custom_appbar.dart';
import 'package:motherclub/common/Utils/Utils.dart';
import 'dart:math' as math;

class WishlistList extends StatefulWidget {
  const WishlistList({Key? key}) : super(key: key);

  @override
  State<WishlistList> createState() => _WishlistListState();
}

class _WishlistListState extends State<WishlistList> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Utils.labels!.wish_List,
        centerTitle: true,
        withBackButton: true,
        onBackButtonPressed: () {
          Navigator.pop(context);
        },
      ),
      body: FutureBuilder<List<WishlistModel>>(
          future: Utils.bLoC.wishlistWithUserId(Utils.id),
          builder: (context, snapshot) {
            return snapshot.connectionState == ConnectionState.waiting
                ? Center(child: CircularProgressIndicator())
                : snapshot.hasData
                    ? GridView.builder(
                        itemCount: snapshot.data!.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          childAspectRatio: (.80),
                        ),
                        itemBuilder: (
                          context,
                          index,
                        ) {
                          return Stack(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => WishListView(
                                            wishlist: snapshot.data![index])),
                                  );
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(15.0),
                                  padding: const EdgeInsets.all(3.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(40),
                                        bottomRight: Radius.circular(40),
                                        bottomLeft: Radius.circular(40),
                                      ),
                                      color: Color((math.Random().nextDouble() *
                                                  0xFFFFFF)
                                              .toInt())
                                          .withOpacity(0.3)),
                                  child: Center(
                                    child: Text(
                                      snapshot.data![index].title!,
                                      style: TextStyle(fontSize: 16),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: () => showDialog(
                                          context: context,
                                          builder: (c) {
                                            return AlertDialog(
                                              title: Text(Utils
                                                  .labels!.edit_wishlist_Name),
                                              content: TextField(
                                                controller: controller,
                                              ),
                                              actions: [
                                                ElevatedButton(
                                                  child:
                                                      Text(Utils.labels!.edit),
                                                  onPressed: () async {
                                                    await Utils.bLoC
                                                        .updateWishlistName(
                                                            controller.text,
                                                            snapshot
                                                                .data![index]
                                                                .shareKey!)
                                                        .then(
                                                          (value) =>
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                            SnackBar(
                                                              content: const Text(
                                                                  'Wish list name edited !'),
                                                              duration:
                                                                  const Duration(
                                                                      seconds:
                                                                          3),
                                                            ),
                                                          ),
                                                        );
                                                    Navigator.of(context).pop();
                                                    setState(() {
                                                      controller.text = '';
                                                    });
                                                  },
                                                ),
                                              ],
                                            );
                                          }),
                                      child: Icon(Icons.edit_outlined),
                                    ),
                                    GestureDetector(
                                        onTap: () async {
                                          await Utils.bLoC
                                              .delWishlist(snapshot
                                                  .data![index].shareKey!)
                                              .then(
                                                (value) => ScaffoldMessenger.of(
                                                  context,
                                                ).showSnackBar(
                                                  SnackBar(
                                                    content: const Text(
                                                        'Wish list deleted'),
                                                    duration: const Duration(
                                                      seconds: 3,
                                                    ),
                                                  ),
                                                ),
                                              );
                                          setState(() {
                                            print('deleted');
                                          });
                                        },
                                        child: Icon(
                                            Icons.delete_forever_outlined)),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      )
                    : Center(
                        child: Text('no wishlist yet'),
                      );
          }),
    );
  }
}
