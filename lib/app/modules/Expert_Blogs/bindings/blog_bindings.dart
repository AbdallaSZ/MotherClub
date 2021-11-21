import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:motherclub/app/modules/Expert_Blogs/controller/blog_controller.dart';
import 'package:motherclub/app/modules/YourBaby/controller/YourBabyController.dart';

class blog_binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<blog_controller>(
          () => blog_controller(),
    );
    Get.put(blog_controller());
  }
}