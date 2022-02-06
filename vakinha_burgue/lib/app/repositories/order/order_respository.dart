import 'dart:developer';

import 'package:vakinha_burgue/app/core/rest_Client/rest_client.dart';
import 'package:vakinha_burgue/app/models/order.dart';
import 'package:vakinha_burgue/app/models/order_pix.dart';

import './i_order_respository.dart';

class OrderRespository implements IOrderRespository {
  final RestClient _restClient;

  OrderRespository({required RestClient restClient}) : _restClient = restClient;

  @override
  Future<OrderPix> createOrder(Order order) async {
    final result = await _restClient.post('/order/', {
      'userId': order.userId,
      'cpf': order.cpf,
      'adress': order.adress,
      'items': order.items
          .map((e) => {'quantity': e.quantity, 'productId': e.productModel.id})
          .toList()
    });

    if (result.hasError) {
      log("Erro ao realizar pedido ${result.statusCode}",
          error: result.statusText, stackTrace: StackTrace.current);
      throw RestClientException(messsage: "Erro ao realizar pedido");
    }
    return OrderPix.fromMap(result.body);
  }
}
