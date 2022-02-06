import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakinha_burgue/app/core/ui/widgets/vakinha_buttom.dart';
import 'package:vakinha_burgue/app/models/order_pix.dart';

class FinishedPage extends StatelessWidget {
  FinishedPage({Key? key}) : super(key: key);

  final OrderPix _orderPix = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverFillRemaining(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Image.asset(
                'assets/images/logo_rounded.png',
                width: context.widthTransformer(reducedBy: 50),
                height: context.heightTransformer(reducedBy: 70),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Pedido realizado com sucesso, cliente no botão abaixo para acesso o QRCode do pix",
                  style: context.textTheme.headline6?.copyWith(
                      color: context.theme.primaryColorDark,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: context.widthTransformer(reducedBy: 30),
                child: VakinhaButton(
                  color: context.theme.primaryColorDark,
                  label: "PIX",
                  onPressed: () {
                    Get.toNamed('/orders/pix', arguments: _orderPix);
                  },
                ),
              ),
              const Spacer(),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                width: context.widthTransformer(reducedBy: 10),
                child: VakinhaButton(
                  color: context.theme.primaryColor,
                  label: "FECHAR",
                  onPressed: () {
                    Get.offAllNamed('/home');
                  },
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
