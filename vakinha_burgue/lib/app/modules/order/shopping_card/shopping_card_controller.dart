import 'package:get/get.dart';
import 'package:vakinha_burgue/app/core/services/auth_service.dart';
import 'package:vakinha_burgue/app/core/services/shopping_card_service.dart';
import 'package:vakinha_burgue/app/models/order.dart';
import 'package:vakinha_burgue/app/models/shopping_card_model.dart';
import 'package:vakinha_burgue/app/modules/home/home_controller.dart';
import 'package:vakinha_burgue/app/repositories/order/order_respository.dart';

class ShoppingCardController extends GetxController {
  final AuthService _authService;
  final ShoppingCardService _shoppingCardService;
  final OrderRespository _orderRespository;

  final _adress = ''.obs;
  final _cpf = ''.obs;

  ShoppingCardController({
    required AuthService authService,
    required ShoppingCardService shoppingCardService,
    required OrderRespository orderRespository,
  })  : _authService = authService,
        _shoppingCardService = shoppingCardService,
        _orderRespository = orderRespository;

  List<ShoppingCardModel> get products => _shoppingCardService.products;

  double get totalValue => _shoppingCardService.totalValue;

  set adress(String adress) => _adress.value = adress;
  set cpf(String cpf) => _cpf.value = cpf;

  void addQuatityInProduct(ShoppingCardModel shoppingCardModel) {
    _shoppingCardService.addAndRemoveProductInShoppingCard(
        shoppingCardModel.productModel,
        quantity: shoppingCardModel.quantity + 1);
  }

  void subtractQuatityInProduct(ShoppingCardModel shoppingCardModel) {
    _shoppingCardService.addAndRemoveProductInShoppingCard(
        shoppingCardModel.productModel,
        quantity: shoppingCardModel.quantity - 1);
  }

  void clear() => _shoppingCardService.clear();

  Future<void> createOrder() async {
    final userId = _authService.getUserId();
    final order = Order(
        userId: userId!,
        cpf: _cpf.value,
        adress: _adress.value,
        items: products);

    var orderPix = await _orderRespository.createOrder(order);
    orderPix = orderPix.copyWith(totalValue: totalValue);
    clear();
    Get.offNamed('/orders/finished', arguments: orderPix);
    Get.back(id: HomeController.NAVIGATOR_KEY);
  }
}
