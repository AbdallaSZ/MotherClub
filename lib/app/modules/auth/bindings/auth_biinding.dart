import 'package:get/get.dart';
import 'package:motherclub/app/modules/auth/controllers/auth_controller.dart';



class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(
          () => AuthController(),
    );

  }
}