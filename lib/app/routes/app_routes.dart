part of 'app_pages.dart';

abstract class Routes{
  Routes._();

  static const HOME = _Paths.HOME;
  static const SPLASH = _Paths.SPLASH;
  static const LOGIN = _Paths.LOGIN;
  static const REGISTER = _Paths.REGISTER;

  static const CATEGORY = _Paths.CATEGORY;
  static const YOURPREGNANCY  = _Paths.YOURPREGNANCY;
  static const YOURBABY  = _Paths.YOURBABY;
  static const EXPERTBLOG=_Paths.EXPERTBLOG;

  static const BOTTOM = _Paths.BOTTOM;
  static const STORE = _Paths.STORE;
  static const ACCOUNT = _Paths.ACCOUNT;
  static const FORUM = _Paths.FORUM;
  static const PREGNANCY = _Paths.PREGNANCY;
  static const BABY = _Paths.BABY;
  static const BLOG = _Paths.BLOG;
  static const COMMENT = _Paths.COMMENT;
  static const NONETWORKVIEW = _Paths.NONETWORKVIEW;
  static const FORGOT_OTP_VIEWS=_Paths.FORGOTOTP;
  static const FORGOT_OTPPIN_VIEWS=_Paths.FORGOTOTPPIN;
  static const PRODUCTDETAILS=_Paths.PRODUCTDETAILS;
  static const WISHLIST=_Paths.WishList;
  static const CART=_Paths.CART;
  static const ADD_ADDRESS=_Paths.Add_Address;
  static const CHOOSE_ADDRESS=_Paths.Choose_Address;
  static const Choose_PaymentMethods=_Paths.Choose_PaymentMethods;

}

abstract class _Paths {
  static const HOME = '/home';
  static const SPLASH = '/splash';
  static const LOGIN = '/login';
  static const REGISTER = '/register';

  static const CATEGORY ='/category';
  static const YOURPREGNANCY ='/YourPregnancy';
  static const YOURBABY ='/YourBaby';
  static const EXPERTBLOG ='/ExpertBlog';

  static const BOTTOM = '/bottom';
  static const STORE = '/store';
  static const ACCOUNT = '/account';
  static const FORUM = '/forum';
  static const PREGNANCY = '/pregnancy';
  static const BABY = '/baby';
  static const BLOG = '/blog';
  static const COMMENT = '/comment';
  static const NONETWORKVIEW='/NonetworkView';
  static const FORGOTOTP='/forgot_OTP_views';
  static const FORGOTOTPPIN='/forgot_OTPPIN_views';
  static const PRODUCTDETAILS='/productsdetails';
  static const WishList='/wishlist';
  static const CART='/cart';
  static const Add_Address='/Addaddress';
  static const Choose_Address='/Choose_Addaddress';
  static const Choose_PaymentMethods='/Choose_PaymentMethods';


}