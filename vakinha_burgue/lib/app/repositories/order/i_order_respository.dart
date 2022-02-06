import 'package:vakinha_burgue/app/models/order.dart';
import 'package:vakinha_burgue/app/models/order_pix.dart';

abstract class IOrderRespository {
  Future<OrderPix> createOrder(Order order);
}
