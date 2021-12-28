import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:motherclub/app/modules/Categories/controllers/CalegoriesController.dart';
import 'package:motherclub/app/modules/splash/controllers/splash_controllers.dart';

class CategoriesBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoriesController>(
          () => CategoriesController(),
    );
    Get.put(CategoriesController());
  }
}