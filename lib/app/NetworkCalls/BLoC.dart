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
import 'package:motherclub/app/Models/month_details.dart';
import 'package:motherclub/app/Models/wishlistModel.dart';
import 'package:motherclub/app/Models/wishlist_item_model.dart';
import 'package:motherclub/app/NetworkCalls/Api.dart';
import 'package:motherclub/common/Utils/Utils.dart';

class BLoC {
  Future<List<ProductModel>> Product_list(BuildContext context) async {
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

  Future<ProductModel> getSpecficProduct(String productId) async {
    ProductModel productsList;

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

  Future<List<WeeksModel>> weeks_list(BuildContext context) async {
    List<WeeksModel> weeksLst = <WeeksModel>[];

    var weekResponse = await Utils.networkcall.getWeeksAPICall(context);
    weekResponse.forEach((newWeek) {


      WeeksModel weeksModel = new WeeksModel(
          Id: newWeek['id'].toString(),
          name: newWeek['name'],
          slug: newWeek['slug'],
          count: newWeek['count'].toString());
      weeksLst.add(weeksModel);
    });

    return weeksLst;
  }

  Future<List<WeeksDetail>> weeks_detail() async {
    List<WeeksDetail> weeksDetailList = <WeeksDetail>[];

    var weekDetailResponse = await Utils.networkcall.getWeeksDetailAPICall();
    weekDetailResponse.forEach((newWeekDetail) {


      WeeksDetail weeksDetailModel = new WeeksDetail(
          name: newWeekDetail['name'].toString(),
          description: newWeekDetail['description'].toString(),
          video_link: newWeekDetail['link'].toString());
      weeksDetailList.add(weeksDetailModel);
    });

    return weeksDetailList;
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

  Future<List<BabyModel>> babyList(String slug) async {
    List<BabyModel> babyList = <BabyModel>[];
    var response = await Utils.networkcall.getBabyAPICall(slug);
    var test = response['data'];

    test.forEach((newFrom) {
      BabyModel babyModel = BabyModel.fromMap(newFrom);
      babyList.add(babyModel);
    });
    log(babyList.toString());
    return babyList;
  }

  Future<UserDetailsModel> UsersDetails() async {
    UserDetailsModel userDetailsModel; //= UserDetailsModel();

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

  Future<List<MonthsModel>> months_list(BuildContext context) async {
    List<MonthsModel> monthsLst = <MonthsModel>[];

    var weekResponse = await Utils.networkcall.getmonthAPICall();
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

  Future<List<MonthDetailsModel>> monthDetail() async {
    List<MonthDetailsModel> monthDetailList = <MonthDetailsModel>[];

    var weekDetailResponse = await Utils.networkcall.getWeeksDetailAPICall();
    weekDetailResponse.forEach((newMonthDetail) {


      MonthDetailsModel monthDetailsModel = new MonthDetailsModel(
          id: newMonthDetail['id'],
          name: newMonthDetail['name'],
          acf: newMonthDetail['acf'],
          addUrlVid: newMonthDetail['addUrlVid'],
          cartItemModelAddUrlVid: newMonthDetail['cartItemModelAddUrlVid'],
          cartItemModelDescMonth: newMonthDetail['cartItemModelDescMonth'],
          cartItemModelImageMonth: newMonthDetail['cartItemModelImageMonth'],
          count: newMonthDetail['count'],
          descMonth: newMonthDetail['descMonth'],
          description: newMonthDetail['description'],
          imageMonth: newMonthDetail['imageMonth'],
          link: newMonthDetail['link'],
          links: newMonthDetail['links'],
          meta: newMonthDetail['meta'],
          parent: newMonthDetail['parent'],
          slug: newMonthDetail['slug'],
          taxonomy: newMonthDetail['taxonomy']);
      monthDetailList.add(monthDetailsModel);
    });

    return monthDetailList;
  }

  Future<List<CategoriesModel>> categores_list(BuildContext context) async {
    List<CategoriesModel> categories_Lst = <CategoriesModel>[];

    var categoriesResponse =
        await Utils.networkcall.geAppCategoiresAPI(context);
    categoriesResponse['data'].forEach((newProduct) {

      CategoriesModel categoriesModel = new CategoriesModel(
          title: newProduct['title'],
          image: newProduct['image'],
          description: newProduct['description']);
      categories_Lst.add(categoriesModel);
    });

    return categories_Lst;
  }

  Future<List<CartItemModel>> cartItemsList() async {
    List<CartItemModel> cartItemss = <CartItemModel>[];

    var cartItemsResponse = await Utils.networkcall.getCartItems();
    cartItemsResponse['data'].forEach((newCartItem) {

      CartItemModel categoriesModel = new CartItemModel(
          cartHash: newCartItem['cartHash'],
          cartKey: newCartItem['cartKey'],
          currency: newCartItem['currency'],
          customer: newCartItem['customer'],
          items: newCartItem['items'],
          itemCount: newCartItem['itemCount'],
          itemsWeight: newCartItem['itemsWeight'],
          coupons: newCartItem['coupons'],
          needsPayment: newCartItem['needsPayment'],
          needsShipping: newCartItem['needsShipping'],
          shipping: newCartItem['shipping'],
          fees: newCartItem['fees'],
          taxes: newCartItem['taxes'],
          totals: newCartItem['totals'],
          removedItems: newCartItem['removedItems'],
          crossSells: newCartItem['crossSells'],
          notices: newCartItem['notices']);
      cartItemss.add(categoriesModel);
    });

    return cartItemss;
  }

  Future<void> addCartItems(String id, int quantity, String variation) async {
    await Utils.networkcall.addCartItem(id, quantity, variation);
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
}
