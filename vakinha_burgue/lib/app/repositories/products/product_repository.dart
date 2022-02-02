import 'package:vakinha_burgue/app/models/product_model.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> findAll();
}
