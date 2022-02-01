import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakinha_burgue/app/core/ui/vakinha_ui.dart';
import 'package:vakinha_burgue/app/routes/auth_routers.dart';
import 'package:vakinha_burgue/app/routes/splash_routers.dart';

void main() {
  runApp(const VakinhaBurgueMainApp());
}

class VakinhaBurgueMainApp extends StatelessWidget {
  const VakinhaBurgueMainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vakinha Burguer',
      theme: VakinhaUI.theme,
      getPages: [...SplashRouters.routers, ...AuthRouters.routers],
    );
  }
}
