import 'package:get/get.dart';
import 'package:motherclub/app/modules/splash/controllers/splash_controllers.dart';


class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
          () => SplashController(),
    );
    Get.put(SplashController());
  }
}