import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {},
          currentIndex: 0,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: "Produtos"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: "Carrinho"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.exit_to_app,
                ),
                label: "Sair")
          ],
        ),
        body: Navigator(
          initialRoute: '/menu',
          key: Get.nestedKey(HomeController.NAVIGATOR_KEY),
          onGenerateRoute: controller.onGeneratedRouter,
        ));
  }
}
