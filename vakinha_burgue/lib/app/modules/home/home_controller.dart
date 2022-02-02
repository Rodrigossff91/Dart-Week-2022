import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';
import 'package:vakinha_burgue/app/modules/menu/menu_bindings.dart';
import 'package:vakinha_burgue/app/modules/menu/menu_page.dart';

class HomeController extends GetxController {
  static const NAVIGATOR_KEY = 1;

  Route? onGeneratedRouter(RouteSettings settings) {
    if (settings.name == '/menu') {
      GetPageRoute(
          settings: settings,
          page: () => const MenuPage(),
          binding: MenuBindings(),
          transition: Transition.fadeIn);
    }
    if (settings.name == '/order/shopping_card') {}
  }
}
