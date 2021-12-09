import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:motherclub/app/Models/CategoriesModel.dart';
import 'package:motherclub/app/Models/FormsModel.dart';
import 'package:motherclub/app/Models/MonthsModel.dart';
import 'package:motherclub/app/Models/ProductModel.dart';
import 'package:motherclub/app/Models/UserDetailsModel.dart';
import 'package:motherclub/app/Models/WeeksDetail.dart';
import 'package:motherclub/app/Models/WeeksModel.dart';
import 'package:motherclub/app/Models/baby_model.dart';
import 'package:motherclub/app/Models/cart_item_model.dart';
import 'package:motherclub/app/Models/choose_for_you_model.dart';
import 'package:motherclub/app/Models/replies_model.dart';
import 'package:motherclub/app/Models/wishlistModel.dart';
import 'package:motherclub/app/Models/wishlist_item_model.dart';
import 'package:motherclub/common/Utils/Utils.dart';

class BLoC {
  Future<List<ProductModel>> productList(BuildContext context) async {
    List<ProductModel> productsList = <ProductModel>[];

    var dataFromResponse = await Utils.networkcall.getProductsAPICall(context);
    await dataFromResponse.forEach((newProduct) {
      List<Images> imagesOfProductList = [];
      newProduct["images"].forEach(
        (newImage) {
          imagesOfProductList.add(
            new Images(
              id: newImage["id"],
              src: newImage['src'],
            ),
          );
        },
      );
      if (imagesOfProductList.length != 0) {
        ProductModel productModel = new ProductModel(
            id: newProduct['id'].toString(),
            name: newProduct['name'],
            description: newProduct['description'],
            price: newProduct['price'].toString(),
            salePrice: newProduct['sale_price'].toString(),
            regular_price: newProduct['regular_price'].toString(),
            on_sale: newProduct['on_sale'],
            total_sales: newProduct['total_sales'].toString(),
            imageslist: imagesOfProductList);

        productsList.add(productModel);
      }
    });
    return productsList;
  }

  Future<ProductModel> getSpecificProduct(String productId) async {


    var dataFromResponse =
        await Utils.networkcall.getProductsDetails(productId);

    List<Images> imagesOfProductList = [];
    dataFromResponse["images"].forEach(
      (newImage) {
        imagesOfProductList.add(
          new Images(
            id: newImage["id"],
            src: newImage['src'],
          ),
        );
      },
    );
    ProductModel productModel = new ProductModel(
        id: dataFromResponse['id'].toString(),
        name: dataFromResponse['name'],
        description: dataFromResponse['description'],
        price: dataFromResponse['price'].toString(),
        salePrice: dataFromResponse['sale_price'].toString(),
        regular_price: dataFromResponse['regular_price'].toString(),
        on_sale: dataFromResponse['on_sale'],
        total_sales: dataFromResponse['total_sales'].toString(),
        imageslist: imagesOfProductList);
    return productModel;
  }

  Future<List<WeeksModel>> weeksList() async {
    List<WeeksModel> weeksLst = <WeeksModel>[];

    var weekResponse = await Utils.networkcall.getWeeksAPICall();
    weekResponse.forEach((newWeek) {


      WeeksModel weeksModel = new WeeksModel(
          id: newWeek['id'].toString(),
          name: newWeek['name'],
          slug: newWeek['slug'],
          count: newWeek['count'].toString());
      weeksLst.add(weeksModel);
    });

    return weeksLst;
  }

  Future<WeeksDetail> weekDetails() async {
    var weekDetailResponse = await Utils.networkcall.getWeeksDetailAPICall();
      WeeksDetail weeksDetailModel = new WeeksDetail(
          name: weekDetailResponse[0]['name'].toString(),
          description: weekDetailResponse[0]['description'].toString(),
          videoLink: weekDetailResponse[0]['video_link'].toString(),
          slug: weekDetailResponse[0]['slug'].toString(),
      );
    return weeksDetailModel;
  }

  Future<List<FormsModel>> forumsList() async {
    List<FormsModel> formsLst = <FormsModel>[];

    var fromResponse = await Utils.networkcall.getForumAPICall();
    // var test = _networkService.convertToJson(fromResponse);

    fromResponse.forEach((newFrom) {
       FormsModel forumModel = FormsModel.fromJson(newFrom);
       formsLst.add(forumModel);
    });

    return formsLst;
  }

  Future<List<RepliesModel>> commentsList(String postId) async {
    List<RepliesModel> commentsLst = <RepliesModel>[];

    var fromResponse = await Utils.networkcall.getCommentsAPICall(postId);
    // var test = _networkService.convertToJson(fromResponse);

    fromResponse.forEach((newFrom) {
      RepliesModel forumModel = RepliesModel.fromMap(newFrom);
      commentsLst.add(forumModel);
    });

    return commentsLst;
  }

  Future<List<BabyModel>> babyList(String slug) async {
    List<BabyModel> babyList = <BabyModel>[];
    var response = await Utils.networkcall.getBabyAPICall(slug);
    var test = response['data'];

    test.forEach((newFrom) {
      BabyModel babyModel = BabyModel.fromMap(newFrom);
      babyList.add(babyModel);
    });
    return babyList;
  }

  Future<UserDetailsModel> usersDetails() async {
    // UserDetailsModel userDetailsModel; //= UserDetailsModel();

    var fromResponse = await Utils.networkcall.getForumAPICall();
    // FromResponse
 
    return UserDetailsModel(
        userId: fromResponse['id'].toString(),
        username: fromResponse['user']['username'],
        nicename: fromResponse['user']['nicename'],
        email: fromResponse['user']['email'],
        url: fromResponse['user']['url'],
        registered: fromResponse['user']['registered'],
        displayname: fromResponse['user']['displayname'],
        firstname: fromResponse['user']['firstname'],
        lastname: fromResponse['user']['lastname'],
        nickname: fromResponse['user']['nickname'],
        description: fromResponse['user']['description'],
        baby_age: fromResponse['user']['baby_age'],
        pregnancy_week: fromResponse['user']['pregnancy_week'],
        capabilities: fromResponse['user']['capabilities']);
  }

  Future<List<MonthsModel>> monthsList(BuildContext context) async {
    List<MonthsModel> monthsLst = <MonthsModel>[];

    var weekResponse = await Utils.networkcall.getMonthAPICall();
    weekResponse.forEach((month) {


      MonthsModel monthsModel = new MonthsModel(
          Id: month['id'].toString(),
          name: month['name'],
          slug: month['slug'],
          count: month['count'].toString());
      monthsLst.add(monthsModel);
    });

    return monthsLst;
  }

  // Future<List<MonthDetailsModel>> monthDetail() async {
  //   List<MonthDetailsModel> monthDetailList = <MonthDetailsModel>[];
  //
  //   var weekDetailResponse = await Utils.networkcall.getWeeksDetailAPICall();
  //   weekDetailResponse.forEach((newMonthDetail) {
  //
  //
  //     MonthDetailsModel monthDetailsModel = new MonthDetailsModel(
  //         id: newMonthDetail['id'],
  //         name: newMonthDetail['name'],
  //         acf: newMonthDetail['acf'],
  //         addUrlVid: newMonthDetail['addUrlVid'],
  //         cartItemModelAddUrlVid: newMonthDetail['cartItemModelAddUrlVid'],
  //         cartItemModelDescMonth: newMonthDetail['cartItemModelDescMonth'],
  //         cartItemModelImageMonth: newMonthDetail['cartItemModelImageMonth'],
  //         count: newMonthDetail['count'],
  //         descMonth: newMonthDetail['descMonth'],
  //         description: newMonthDetail['description'],
  //         imageMonth: newMonthDetail['imageMonth'],
  //         link: newMonthDetail['link'],
  //         links: newMonthDetail['links'],
  //         meta: newMonthDetail['meta'],
  //         parent: newMonthDetail['parent'],
  //         slug: newMonthDetail['slug'],
  //         taxonomy: newMonthDetail['taxonomy']);
  //     monthDetailList.add(monthDetailsModel);
  //   });
  //
  //   return monthDetailList;
  // }

  Future<List<CategoriesModel>> categoresList(BuildContext context) async {
    List<CategoriesModel> categoriesLst = <CategoriesModel>[];
 
    var categoriesResponse =
        await Utils.networkcall.geAppCategoriesAPI(context);
    categoriesResponse['data'].forEach((newProduct) {

      CategoriesModel categoriesModel = new CategoriesModel(
          title: newProduct['title'],
          image: newProduct['image'],
          description: newProduct['description']);
      categoriesLst.add(categoriesModel);
    });

    return categoriesLst;
  }

  Future<dynamic> cartItemsList() async {
    List<dynamic> cartItems = <Item>[];
  try {
    var response = await Utils.networkcall.getCartItems();

      if(cartItems != [])
      {
        CartItemModel.fromJson(response).items!.forEach((element) {
      cartItems.add(element);
      });
      return cartItems;
      }
     else{
     return [];
      }
  } on Exception catch (e) {
    throw Exception('Failed. $e');
  }
  }

  Future<String> addCartItems(String id, int quantity, String variation) async {
    var res = await Utils.networkcall.addCartItem(id, quantity, variation);
    return res;
  }

  Future<String> delCartItems(String itemId) async {
    var res = await Utils.networkcall.deleteFromCartItem(itemId);
    return res;
  }
  Future<String> clearCart() async {
    var res = await Utils.networkcall.clearCartItem();
    return res;
  }


  Future<List<WishlistModel>> wishlistWithUserId(String userId) async {
    List<WishlistModel> items = [];
    var wishlistResponse = await Utils.networkcall.getWishlistByUserId(userId);
    try {
      await wishlistResponse.forEach((wishlist) {

        WishlistModel wishlistModel = new WishlistModel(
          userId: wishlist['user_id'],
          id: wishlist['id'],
          status: wishlist['status'],
          shareKey: wishlist['share_key'],
          title: wishlist['title'],
          dateAdded: wishlist['date_added'],
        );
        items.add(wishlistModel);
      });
    } on Exception catch (e) {
      print(e);
    }
    return items;
  }

  Future<dynamic> wishlistProducts(String sharedKey) async {
    List<WishlistProductModel> items = <WishlistProductModel>[];
    var wishlistItemsResponse =
        await Utils.networkcall.getProductsFromWishlist(sharedKey);
    if (wishlistItemsResponse is String) {
      return wishlistItemsResponse;
    }
    wishlistItemsResponse.forEach((wishlistItem) {

      WishlistProductModel wishlistItemModel = new WishlistProductModel(
        itemId: wishlistItem['item_id'],
        inStock: wishlistItem['in_stock'],
        dateAdded: wishlistItem['date_added'],
        productId: wishlistItem['product_id'],
        meta: wishlistItem['meta'],
        price: wishlistItem['price'],
        variationId: wishlistItem['variation_id'],
      );
      items.add(wishlistItemModel);
    });

    return items;
  }

  Future<WishlistModel> addWishlist(
      String title, String userId, String status) async {
    WishlistModel item;
    var wishlistModel =
        await Utils.networkcall.createWishlist(title, userId, status);

    WishlistModel wishlistItemModel = new WishlistModel(
      userId: wishlistModel['user_id'],
      id: wishlistModel['id'],
      status: wishlistModel['status'],
      shareKey: wishlistModel['share_key'],
      title: wishlistModel['title'],
      dateAdded: wishlistModel['date_added'],
    );
    item = wishlistItemModel;
    return item;
  }

  Future<void> addToWishlist(String productId, String sharedKey) async {
    try {
      await Utils.networkcall.addProductToWishlist(productId, sharedKey);
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<void> updateWishlistName(String name, String sharedKey) async {
    try {
      await Utils.networkcall.updateWishlistName(name, sharedKey);
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<void> delWishlist(String sharedKey) async {
    try {
      await Utils.networkcall.delAllWishlist(sharedKey);
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<void> delWishlistProd(String prodId) async {
    try {
      await Utils.networkcall.delProductFromWishlist(prodId);
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<List<ChooseForYouModel>> articles() async {
    List<ChooseForYouModel> articlesList = <ChooseForYouModel>[];
    var response = await Utils.networkcall.getArticles();

    response['data'].forEach((newFrom) {
      ChooseForYouModel chooseForYouModel = ChooseForYouModel.fromMap(newFrom);
      articlesList.add(chooseForYouModel);
    });
    return articlesList;
  }

}
