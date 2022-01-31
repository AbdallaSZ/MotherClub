import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:motherclub/app/RegisterBloc/RegisterBloc.dart';
import 'package:motherclub/app/RegisterBloc/register_view.dart';
import 'package:motherclub/app/modules/Cart/views/cart_view.dart';
import 'package:motherclub/app/modules/Categories/bindings/CategoriesBindings.dart';
import 'package:motherclub/app/modules/Categories/views/categories_views.dart';
import 'package:motherclub/app/modules/Checkout/views/Add_Address_view.dart';
import 'package:motherclub/app/modules/Checkout/views/Choose_Payment_view.dart';
import 'package:motherclub/app/modules/Checkout/views/Select_Address_view.dart';
import 'package:motherclub/app/modules/Expert_Blogs/bindings/blog_bindings.dart';
import 'package:motherclub/app/modules/Expert_Blogs/views/blog_views.dart';
import 'package:motherclub/app/modules/Forgot_Password/views/forgot_OTPPIN_views.dart';
import 'package:motherclub/app/modules/Forgot_Password/views/forgot_OTP_views.dart';
import 'package:motherclub/app/modules/NoNetworkScreen/store_view.dart';
import 'package:motherclub/app/modules/Store/views/product_details_views.dart';
import 'package:motherclub/app/modules/WishList/views/wishList_view.dart';
import 'package:motherclub/app/modules/YourBaby/controller/YourBabyController.dart';
import 'package:motherclub/app/modules/YourBaby/views/YourbabyViews.dart';
import 'package:motherclub/app/modules/Store/views/store_view.dart';
import 'package:motherclub/app/modules/YourBaby/binding/YourBabyBinding.dart';
import 'package:motherclub/app/modules/YourBaby/views/YourbabyViews.dart';
import 'package:motherclub/app/modules/YourPregnancy/Views/YourPregnancyView.dart';
import 'package:motherclub/app/modules/YourPregnancy/bindings/YourPregnancyBinding.dart';
import 'package:motherclub/app/modules/account/views/account_view.dart';
import 'package:motherclub/app/modules/auth/bindings/auth_biinding.dart';
import 'package:motherclub/app/modules/auth/views/login_view.dart';
import 'package:motherclub/app/modules/bottomNavigation/binding/bottombinding.dart';
import 'package:motherclub/app/modules/bottomNavigation/views/bottom_screen.dart';
import 'package:motherclub/app/modules/forum/views/forum_topic_view.dart';
import 'package:motherclub/app/modules/forum/views/forum_view.dart';
import 'package:motherclub/app/modules/home/views/home_views.dart';
import 'package:motherclub/app/modules/splash/bindings/splash_binding.dart';
import 'package:motherclub/app/modules/splash/views/splash_view.dart';
part 'app_routes.dart';


class AppPages{
  AppPages._();



  static const INITIAL=Routes.SPLASH;



  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      // binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => BlocProvider(
          create: (c)=> RegisterBloc(),
          child: RegisterView()),
      binding: AuthBinding(),
    ),
    GetPage(

      name: _Paths.CATEGORY,
      page:() =>  CategoriesView(),
      binding: CategoriesBindings(),),

    GetPage(

      name: _Paths.YOURPREGNANCY,
      page:() =>  YourPregnancyView(),
      binding: YourPregnancyBinding(),
    ),
  GetPage(
      name: _Paths.BOTTOM,
      page: () => BottomScreen(),
      binding: BottomBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORY,
      page: () => RegisterView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.STORE,
      page: () => StoreView(),
      // binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNT,
      page: () => AccountView(),
      // binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.FORUM,
      page: () => ForumView(),
      // binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORY,
      page: () => CategoriesView(),
      // binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.YOURBABY,
      page: () => YourBabyViews(),
      binding: YourBabyBinding(),
    ),

    GetPage(
      name: _Paths.NONETWORKVIEW,
      page: () => NonetworkView(),
     // binding: blog_binding(),
    ),
    GetPage(
      name: _Paths.FORGOTOTP,
      page: () => forgot_otp_views(),
      // binding: blog_binding(),
    ),
    GetPage(
      name: _Paths.FORGOTOTPPIN,
      page: () => forgot_OTPPIN_views(),
      // binding: blog_binding(),
    ),
    GetPage(
      name: _Paths.PRODUCTDETAILS,
      page: () => product_details_views(),
      // binding: blog_binding(),
    ),

    GetPage(
      name: _Paths.CART,
      page: () => CartView(),
      // binding: blog_binding(),
    ),
    GetPage(
      name: _Paths.Add_Address,
      page: () => Add_Address_view(),
      // binding: blog_binding(),
    ),
    GetPage(
      name: _Paths.Choose_Address,
      page: () => Choose_Payment_view(),
      // binding: blog_binding(),
    ),
    GetPage(
      name: _Paths.Choose_PaymentMethods,
      page: () => Select_Address_view(),
      // binding: blog_binding(),
    ),



  ];
}