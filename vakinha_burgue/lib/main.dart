import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vakinha_burgue/app/core/bindings/application_bindings.dart';
import 'package:vakinha_burgue/app/core/ui/vakinha_ui.dart';
import 'package:vakinha_burgue/app/routes/auth_routers.dart';
import 'package:vakinha_burgue/app/routes/home_routers.dart';
import 'package:vakinha_burgue/app/routes/product_routets.dart';
import 'package:vakinha_burgue/app/routes/splash_routers.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const VakinhaBurgueMainApp());
}

class VakinhaBurgueMainApp extends StatelessWidget {
  const VakinhaBurgueMainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vakinha Burguer',
      initialBinding: ApplicationBindings(),
      theme: VakinhaUI.theme,
      getPages: [
        ...SplashRouters.routers,
        ...AuthRouters.routers,
        ...HomeRouters.routers,
        ...ProductDetailRouters.routers
      ],
    );
  }
}
