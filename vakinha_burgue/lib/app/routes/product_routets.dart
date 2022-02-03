import 'package:get/get.dart';
import 'package:vakinha_burgue/app/modules/product_detail/product_detail_bindings.dart';
import 'package:vakinha_burgue/app/modules/product_detail/product_detail_page.dart';

class ProductDetailRouters {
  ProductDetailRouters._();

  static final routers = <GetPage>[
    GetPage(
        name: '/product_detail',
        page: () => const ProductDetailPage(),
        binding: ProductDetailBindings())
  ];
}
