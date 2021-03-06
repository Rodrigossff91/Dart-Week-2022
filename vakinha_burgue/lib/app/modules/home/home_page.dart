import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakinha_burgue/app/core/ui/widgets/icon_badget.dart';
import 'package:vakinha_burgue/app/core/ui/widgets/vakinha_appbar.dart';
import 'package:vakinha_burgue/app/modules/home/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: VakinhaAppbar(
          elevation: 0,
        ),
        bottomNavigationBar: Obx(() {
          return BottomNavigationBar(
            onTap: (value) {
              controller.tabIndex = value;
            },
            currentIndex: controller.tabIndex,
            items: [
              const BottomNavigationBarItem(
                  icon: Icon(Icons.list), label: "Produtos"),
              BottomNavigationBarItem(
                  icon: IconBadget(
                    icon: Icons.shopping_cart,
                    number: controller.totalProductsInShoppingCard,
                  ),
                  label: "Carrinho"),
              const BottomNavigationBarItem(
                  icon: Icon(
                    Icons.exit_to_app,
                  ),
                  label: "Sair")
            ],
          );
        }),
        body: Navigator(
          initialRoute: '/menu',
          key: Get.nestedKey(HomeController.NAVIGATOR_KEY),
          onGenerateRoute: controller.onGeneratedRouter,
        ));
  }
}
