import 'package:get/get.dart';
import 'package:vakinha_burgue/app/core/rest_Client/rest_client.dart';
import 'package:vakinha_burgue/app/core/services/shopping_card_service.dart';

class ApplicationBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RestClient(), fenix: true);

    Get.lazyPut(() => ShoppingCardService());
  }
}
