import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakinha_burgue/app/core/formatter_helper.dart';
import 'package:vakinha_burgue/app/core/ui/widgets/plus_minus_box.dart';
import 'package:vakinha_burgue/app/core/ui/widgets/vakinha_buttom.dart';
import 'package:validatorless/validatorless.dart';

import './shopping_card_controller.dart';

class ShoppingCardPage extends GetView<ShoppingCardController> {
  final formKey = GlobalKey<FormState>();

  ShoppingCardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
                minWidth: constraints.maxWidth),
            child: IntrinsicHeight(
              child: Form(
                  key: formKey,
                  child: Visibility(
                    visible: controller.products.isNotEmpty,
                    replacement: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Carrinho",
                            style: context.textTheme.headline6?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: context.theme.primaryColor),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Nenhum item adicionado no carrinho",
                            style: context.textTheme.bodyText2?.copyWith(),
                          )
                        ],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Text(
                                "Carrinho",
                                style: context.textTheme.headline6?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: context.theme.primaryColor),
                              ),
                              IconButton(
                                  onPressed: () {
                                    controller.clear();
                                  },
                                  icon: const Icon(
                                    Icons.delete_forever_outlined,
                                    color: Colors.red,
                                  ))
                            ],
                          ),
                        ),
                        Obx(() {
                          return Column(
                              children: controller.products
                                  .map((e) => Container(
                                        margin: const EdgeInsets.all(10),
                                        child: PlusMinusBox(
                                          label: e.productModel.name,
                                          quantidade: e.quantity,
                                          elevated: true,
                                          backGroundColor: Colors.white,
                                          price: e.productModel.price,
                                          minusCallback: () => controller
                                              .subtractQuatityInProduct(e),
                                          plusCallback: () =>
                                              controller.addQuatityInProduct(e),
                                        ),
                                      ))
                                  .toList());
                        }),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Obx(() {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Total do pedido",
                                    style: context.textTheme.bodyText1
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    FormatterHelper.formatCurrency(
                                        controller.totalValue),
                                    style: context.textTheme.bodyText1
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  )
                                ],
                              );
                            })),
                        const Divider(),
                        const _AdressField(),
                        const Divider(),
                        const _CpfField(),
                        const Divider(),
                        const Spacer(),
                        Center(
                          child: SizedBox(
                            width: context.widthTransformer(reducedBy: 10),
                            child: VakinhaButton(
                              label: "FINALIZAR",
                              onPressed: () {
                                final formValid =
                                    formKey.currentState?.validate() ?? false;
                                if (formValid) {
                                  controller.createOrder();
                                }
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  )),
            ),
          ),
        );
      },
    ));
  }
}

class _AdressField extends GetView<ShoppingCardController> {
  const _AdressField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 35,
            child: Text(
              "Endereço de entrega",
              style: TextStyle(fontSize: 18),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: (value) {
              controller.adress = value;
            },
            validator: Validatorless.required("Endereço Obrigatório"),
            decoration: const InputDecoration(
                hintText: "Digite o endereço",
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey))),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

class _CpfField extends GetView<ShoppingCardController> {
  const _CpfField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 35,
            child: Text(
              "CPF",
              style: TextStyle(fontSize: 18),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: (value) {
              controller.cpf = value;
            },
            validator: Validatorless.multiple([
              Validatorless.required("CPF Obrigatório"),
              Validatorless.cpf('CPF inválido')
            ]),
            decoration: const InputDecoration(
                hintText: "Digite o CPF",
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey))),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
