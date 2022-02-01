import 'package:flutter/material.dart';
import 'package:vakinha_burgue/app/core/ui/widgets/vakinha_textformfield.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Splash"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: VakinhaTextformfield(
                label: "TextForm",
              ),
            )
          ],
        ));
  }
}
