import 'package:get/get.dart';
import 'package:vakinha_burgue/app/modules/home/home_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
