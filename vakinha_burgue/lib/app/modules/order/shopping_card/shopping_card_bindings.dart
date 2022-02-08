import 'package:get/get.dart';
import 'package:vakinha_burgue/app/repositories/order/i_order_respository.dart';
import 'package:vakinha_burgue/app/repositories/order/order_respository.dart';

import './shopping_card_controller.dart';

class ShoppingCardBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IOrderRespository>(
        () => OrderRespository(restClient: Get.find()));

    Get.lazyPut(() => ShoppingCardController(
        authService: Get.find(),
        orderRespository: Get.find(),
        shoppingCardService: Get.find()));
  }
}
