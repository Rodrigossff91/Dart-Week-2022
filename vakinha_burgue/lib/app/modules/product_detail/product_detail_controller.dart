import 'package:get/get.dart';
import 'package:vakinha_burgue/app/core/services/shopping_card_service.dart';
import 'package:vakinha_burgue/app/models/product_model.dart';

class ProductDetailController extends GetxController {
  final _product = Rx<ProductModel>(Get.arguments);

  ProductModel get product => _product.value;

  final _totalPrice = 0.0.obs;
  double get totalPrice => _totalPrice.value;

  final _alreadyAdded = false.obs;

  bool get alreadyAdded => _alreadyAdded.value;

  final _quantity = 1.obs;
  int get quantity => _quantity.value;

  final ShoppingCardService _shoppingCardService;

  ProductDetailController({required ShoppingCardService shoppingCardService})
      : _shoppingCardService = shoppingCardService;

  @override
  void onInit() {
    _totalPrice(product.price);
    listnerQuantity();
    super.onInit();
  }

  void addProduct() {
    _quantity.value += 1;
  }

  void removeProduct() {
    if (_quantity > 1) {
      _quantity.value -= 1;
    }
  }

  listnerQuantity() {
    ever<int>(_quantity, (quantity) {
      _totalPrice(product.price * quantity);
    });

    final producShoppingCard = _shoppingCardService.getById(product.id);
    if (producShoppingCard != null) {
      _quantity(producShoppingCard.quantity);
      _alreadyAdded(true);
    }
  }

  void addProductInShoppingCard() {
    _shoppingCardService.addAndRemoveProductInShoppingCard(product,
        quantity: quantity);
    Get.back();
  }
}
