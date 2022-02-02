import 'dart:developer';

import 'package:get/get.dart';
import 'package:vakinha_burgue/app/core/mixins/loader_mixin.dart';
import 'package:vakinha_burgue/app/core/mixins/messages_mixin.dart';
import 'package:vakinha_burgue/app/models/product_model.dart';
import 'package:vakinha_burgue/app/repositories/products/product_repository.dart';

class MenuController extends GetxController with LoaderMixin, MessagesMixin {
  final _loading = false.obs;
  final _message = Rxn<MessageModel>();
  final menu = <ProductModel>[].obs;

  final ProductRepository _productRepository;
  MenuController({required ProductRepository productRepository})
      : _productRepository = productRepository;

  @override
  void onInit() {
    loaderListener(_loading);
    messageListener(_message);
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    try {
      _loading.toggle();
      super.onReady();
      await findAllProducts();
      _loading.toggle();
    } catch (e) {
      _loading.toggle();
      log("Erro ao buscar produtos", error: e, stackTrace: StackTrace.current);
      _message(MessageModel(
          title: "Erro",
          message: "Erro ao buscar produtos",
          type: MessageType.error));
    }
  }

  Future<void> findAllProducts() async {
    final products = await _productRepository.findAll();
    menu.assignAll(products);
  }
}
