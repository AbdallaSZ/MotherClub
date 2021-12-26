import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:motherclub/app/modules/YourPregnancy/Controller/YourPregnancyController.dart';


class YourPregnancyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<YourPregnancyController>(
          () => YourPregnancyController(),
    );
    Get.put(YourPregnancyController());
  }
}