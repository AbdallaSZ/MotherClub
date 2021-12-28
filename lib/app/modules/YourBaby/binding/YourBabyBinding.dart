import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:motherclub/app/modules/YourBaby/controller/YourBabyController.dart';

class YourBabyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<YourBabyController>(
          () => YourBabyController(),
    );
    Get.put(YourBabyController());
  }
}