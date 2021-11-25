import 'package:flutter/material.dart';
import 'package:motherclub/app/Models/CategoriesModel.dart';
import 'package:motherclub/app/Models/FormsModel.dart';
import 'package:motherclub/app/Models/MonthsModel.dart';
import 'package:motherclub/app/Models/ProductModel.dart';
import 'package:motherclub/app/Models/UserDetailsModel.dart';
import 'package:motherclub/app/Models/WeeksDetail.dart';
import 'package:motherclub/app/Models/WeeksModel.dart';
import 'package:motherclub/app/Models/cart_item_model.dart';
import 'package:motherclub/app/Models/month_details.dart';
import 'package:motherclub/common/Utils/Utils.dart';

class BLoC{
  Future<List<ProductModel>> Product_list(BuildContext context) async {
    List<ProductModel> productsList = <ProductModel>[];

    var dataFromResponse = await Utils.networkcall.getProductsAPICall(context);
    dataFromResponse.forEach(
            (newProduct) {

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
              if(imagesOfProductList.length!=0) {
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

  Future<List<WeeksModel>> weeks_list(BuildContext context) async {
    List<WeeksModel> weeksLst = <WeeksModel>[];

    var weekResponse = await Utils.networkcall.getWeeksAPICall(context);
    weekResponse.forEach(
            (newWeek) {
          print('newdata ${newWeek['name'].toString()}');

          WeeksModel weeksModel=new  WeeksModel(Id: newWeek['id'].toString(), name: newWeek['name'], slug: newWeek['slug'], count: newWeek['count'].toString());
          weeksLst.add(weeksModel);

        });
    print('newdata ${weeksLst.toString()}');
    return weeksLst;
  }

 Future<List<WeeksDetail>> weeks_detail() async {
   List<WeeksDetail> weeksDetailList = <WeeksDetail>[];

   var weekDetailResponse = await Utils.networkcall.getWeeksDetailAPICall();
   weekDetailResponse.forEach(
           (newWeekDetail) {
         print('newweekdata ${newWeekDetail['link'].toString()}');

         WeeksDetail weeksDetailModel=new  WeeksDetail(name: newWeekDetail['name'].toString(),description: newWeekDetail['description'].toString(),video_link: newWeekDetail['link'].toString());
         weeksDetailList.add(weeksDetailModel);

       });
   print('newweekdata ${weeksDetailList.toString()}');
   return weeksDetailList;

  }



  Future<List<FormsModel>> Forms_list(BuildContext context) async {
    List<FormsModel> formsLst = <FormsModel>[];

    var FromResponse = await Utils.networkcall.getForumAPICall(context);
    FromResponse.forEach(
            (newFrom) {
          FormsModel formmodel=new FormsModel(Id: newFrom['id'].toString(),
              Date: newFrom['date'], Title: newFrom['title']['rendered'], Content: newFrom['content']['rendered']);
          formsLst.add(formmodel);

        }
        );
    return formsLst;
  }

  Future<UserDetailsModel> UsersDetails(BuildContext context) async {
    UserDetailsModel userDetailsModel ;//= UserDetailsModel();

    var FromResponse = await Utils.networkcall.getForumAPICall(context);
    // FromResponse

    return UserDetailsModel(userId: FromResponse['user']['id'],
        username: FromResponse['user']['username'], nicename: FromResponse['user']['nicename'], email: FromResponse['user']['email'],
        url: FromResponse['user']['url'], registered: FromResponse['user']['registered'], displayname: FromResponse['user']['displayname'],
        firstname: FromResponse['user']['firstname'], lastname: FromResponse['user']['lastname'], nickname: FromResponse['user']['nickname'],
        description: FromResponse['user']['description'], baby_age: FromResponse['user']['baby_age'],
        pregnancy_week: FromResponse['user']['pregnancy_week'], capabilities: FromResponse['user']['capabilities']);
  }





  Future<List<MonthsModel>> months_list(BuildContext context) async {
    List<MonthsModel> monthsLst = <MonthsModel>[];

    var weekResponse = await Utils.networkcall.getmonthAPICall();
    weekResponse.forEach(
            (month) {
          print('newdata ${month['name'].toString()}');

          MonthsModel monthsModel=new  MonthsModel(Id: month['id'].toString(), name: month['name'], slug: month['slug'], count: month['count'].toString());
          monthsLst.add(monthsModel);

        });
    print('newdata ${monthsLst.toString()}');
    return monthsLst;
  }

  Future<List<MonthDetailsModel>> monthDetail() async {
    List<MonthDetailsModel> monthDetailList = <MonthDetailsModel>[];
 
    var weekDetailResponse = await Utils.networkcall.getWeeksDetailAPICall();
    weekDetailResponse.forEach(
            (newMonthDetail) {
          print('newweekdata ${newMonthDetail['link'].toString()}');

          MonthDetailsModel monthDetailsModel=new  MonthDetailsModel(id: newMonthDetail['id'],name: newMonthDetail['name'],acf: newMonthDetail['acf'],addUrlVid: newMonthDetail['addUrlVid'],cartItemModelAddUrlVid: newMonthDetail['cartItemModelAddUrlVid'],cartItemModelDescMonth: newMonthDetail['cartItemModelDescMonth'],cartItemModelImageMonth: newMonthDetail['cartItemModelImageMonth'],count:newMonthDetail['count'] ,descMonth: newMonthDetail['descMonth'],description: newMonthDetail['description'],imageMonth: newMonthDetail['imageMonth'],link: newMonthDetail['link'],links:newMonthDetail['links'] ,meta:newMonthDetail['meta'] ,parent:newMonthDetail['parent'] ,slug: newMonthDetail['slug'],taxonomy:newMonthDetail['taxonomy'] );
          monthDetailList.add(monthDetailsModel);

        });
    print('newweekdata ${monthDetailList.toString()}');
    return monthDetailList;

  }


  Future<List<CategoriesModel>> categores_list(BuildContext context) async {
    List<CategoriesModel> categories_Lst = <CategoriesModel>[];

    var categoriesResponse = await Utils.networkcall.geAppCategoiresAPI(context);
    categoriesResponse['data'].forEach(
            (newProduct) {
              print('newdata ${newProduct}');
          CategoriesModel categoriesModel=new CategoriesModel(title: newProduct['title'], image: newProduct['image'], description: newProduct['description']);
          categories_Lst.add(categoriesModel);

        });

    return categories_Lst;
  }

  Future<List<CartItemModel>> cartItemsList() async {
    List<CartItemModel> cartItemss = <CartItemModel>[];

    var cartItemsResponse = await Utils.networkcall.getCartItems();
    cartItemsResponse['data'].forEach(
            (newCartItem) {
          print('newdata ${newCartItem}');
          CartItemModel categoriesModel=new CartItemModel(cartHash: newCartItem['cartHash'], cartKey: newCartItem['cartKey'], currency: newCartItem['currency'], customer: newCartItem['customer'], items: newCartItem['items'], itemCount: newCartItem['itemCount'], itemsWeight: newCartItem['itemsWeight'], coupons: newCartItem['coupons'], needsPayment: newCartItem['needsPayment'], needsShipping: newCartItem['needsShipping'], shipping: newCartItem['shipping'], fees: newCartItem['fees'], taxes: newCartItem['taxes'], totals: newCartItem['totals'], removedItems: newCartItem['removedItems'], crossSells: newCartItem['crossSells'], notices: newCartItem['notices']);
          cartItemss.add(categoriesModel);

        });

    return cartItemss;
  }


  Future<void> addCartItems(String id ,int quantity ,String variation) async {
 await Utils.networkcall.addCartItem(id,quantity,variation);
  }



  }