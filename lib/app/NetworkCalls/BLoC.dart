import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:motherclub/app/Models/CategoriesModel.dart';
import 'package:motherclub/app/Models/FormsModel.dart';
import 'package:motherclub/app/Models/MonthsModel.dart';
import 'package:motherclub/app/Models/ProductDetailsModel.dart';
import 'package:motherclub/app/Models/ProductModel.dart' as pm;
import 'package:motherclub/app/Models/UserDetailsModel.dart';
import 'package:motherclub/app/Models/pregnancy_data_model.dart';
import 'package:motherclub/app/Models/WeeksModel.dart';
import 'package:motherclub/app/Models/auth_model.dart';
import 'package:motherclub/app/Models/baby_model.dart';
import 'package:motherclub/app/Models/cart_item_model.dart';
import 'package:motherclub/app/Models/choose_for_you_model.dart';
import 'package:motherclub/app/Models/order_model.dart';
import 'package:motherclub/app/Models/replies_model.dart';
import 'package:motherclub/app/Models/wishlistModel.dart';
import 'package:motherclub/app/Models/wishlist_item_model.dart';
import 'package:motherclub/common/Utils/Utils.dart';

class BLoC {
  Future<List<ProductDetailsModel>> productList( {int page = 1 , int perPage= 10 , bool onSale = false , String min = '0' , String max = '10000000'}) async {
    List<ProductDetailsModel> productsList = <ProductDetailsModel>[];

    var dataFromResponse = await Utils.networkcall.getProductsAPICall(page,perPage,onSale,min,max);
    await dataFromResponse.forEach((newProduct) {
      ProductDetailsModel prodModel = ProductDetailsModel.fromJson(newProduct);
      productsList.add(prodModel);
    });
    return productsList;
  }

  Future<List<ProductDetailsModel>> search( String keyword) async {
    List<ProductDetailsModel> productsList = <ProductDetailsModel>[];
    var dataFromResponse = await Utils.networkcall.searchProducts(keyword);
    await dataFromResponse.forEach((newProduct) {
      ProductDetailsModel prodModel = ProductDetailsModel.fromJson(newProduct);
      productsList.add(prodModel);
    });
    return productsList;
  }

  Future<pm.ProductModel> getSpecificProduct(String productId) async {
    var dataFromResponse =
        await Utils.networkcall.getProductsDetails(productId);

    List<pm.Images> imagesOfProductList = [];
    dataFromResponse["images"].forEach(
      (newImage) {
        imagesOfProductList.add(
          new pm.Images(
            id: newImage["id"],
            src: newImage['src'],
          ),
        );
      },
    );
    pm.ProductModel productModel = new pm.ProductModel(
      id: dataFromResponse['id'].toString(),
      name: dataFromResponse['name'],
      description: dataFromResponse['description'],
      price: dataFromResponse['price'].toString(),
      salePrice: dataFromResponse['sale_price'].toString(),
      regular_price: dataFromResponse['regular_price'].toString(),
      on_sale: dataFromResponse['on_sale'],
      total_sales: dataFromResponse['total_sales'].toString(),
      imageslist: imagesOfProductList,
    );
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

  Future<PregnancyDataModel> weekDetails(String slug,int page) async {
    var weekDetailResponse = await Utils.networkcall.getWeeksDetailAPICall(slug,page);
    PregnancyDataModel weeksDetailModel = PregnancyDataModel.fromMap(weekDetailResponse[0]);
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
    var fromResponse = await Utils.networkcall.getUser();
    UserDetailsModel _userDetailsModel = UserDetailsModel.fromMap(fromResponse);
    return _userDetailsModel;
  }

  Future<AuthModel> authData(String userName, String password) async {
    var fromResponse = await Utils.networkcall.getAuthData(userName, password);
    AuthModel _authData = AuthModel.fromMap(fromResponse);
    return _authData;
  }

  Future<List<MonthsModel>> monthsList(BuildContext context) async {
    List<MonthsModel> monthsLst = <MonthsModel>[];

    var weekResponse = await Utils.networkcall.getMonthAPICall();
    weekResponse.forEach((month) {
      MonthsModel monthsModel = MonthsModel.fromMap(month);
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

  Future<List<Item>> cartItemsList() async {
    List<Item> cartItems = <Item>[];
    try {
      var response = await Utils.networkcall.getCartItems();

      if (response != "[]") {
        CartItemModel.fromJson(response).items!.forEach((element) {
          cartItems.add(element);
        });
        return cartItems;
      } else {
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

  Future<List<OrderModel>> orders() async {
    List<OrderModel> ordersList = <OrderModel>[];
    var response = await Utils.networkcall.getOrders();

    response.forEach((newFrom) {
      OrderModel order = OrderModel.fromMap(newFrom);
      ordersList.add(order);
    });
    return ordersList;
  }

  Future<void> delOrder(String orderId) async {
    try {
      await Utils.networkcall.deleteOrder(orderId);
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<void> sendFeedB(String userName, String userEmail, String feedbackMessage) async {
    try {
      await Utils.networkcall.sendFeedback(userName, userEmail, feedbackMessage);
    } on Exception catch (e) {
      print(e);
    }
  }

}
