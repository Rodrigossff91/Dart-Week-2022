import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:vakinha_burgue/app/core/ui/vakinha_ui.dart';
import 'package:vakinha_burgue/app/core/ui/widgets/vakinha_appbar.dart';
import 'package:vakinha_burgue/app/core/ui/widgets/vakinha_buttom.dart';
import 'package:vakinha_burgue/app/core/ui/widgets/vakinha_textformfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: VakinhaAppbar(
        elevation: 0,
      ),
      body: LayoutBuilder(builder: (_, constaints) {
        return ConstrainedBox(
          constraints: BoxConstraints(minHeight: constaints.maxHeight),
          child: IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: context.textTheme.headline6?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.theme.primaryColorDark),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const VakinhaTextformfield(label: "E-mail"),
                  const SizedBox(
                    height: 30,
                  ),
                  const VakinhaTextformfield(label: "Senha"),
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                      child: VakinhaButton(
                    width: context.width,
                    label: "Entrar",
                    onPressed: () {},
                  )),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Não possui uma conta?"),
                      TextButton(
                          onPressed: () {
                            Get.toNamed('/auth/register');
                          },
                          child: const Text(
                            "Cadastre-se",
                            style: VakinhaUI.textBold,
                          ))
                    ],
                  )
                ],
              )),
            ),
          ),
        );
      }),
    );
  }
}
