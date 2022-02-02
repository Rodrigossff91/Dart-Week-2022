import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:vakinha_burgue/app/core/ui/vakinha_state.dart';
import 'package:vakinha_burgue/app/core/ui/vakinha_ui.dart';
import 'package:vakinha_burgue/app/core/ui/widgets/vakinha_appbar.dart';
import 'package:vakinha_burgue/app/core/ui/widgets/vakinha_buttom.dart';
import 'package:vakinha_burgue/app/core/ui/widgets/vakinha_textformfield.dart';
import 'package:vakinha_burgue/app/modules/auth/login/login_controller.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends VakinhaState<LoginPage, LoginController> {
  final formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

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
                  key: formKey,
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
                      VakinhaTextformfield(
                        label: "E-mail",
                        controller: _emailEC,
                        validator: Validatorless.multiple([
                          Validatorless.required("E-mail Obrigatório"),
                          Validatorless.email("E-email inválido")
                        ]),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      VakinhaTextformfield(
                        label: "Senha",
                        controller: _passwordEC,
                        obscureText: true,
                        validator: Validatorless.multiple([
                          Validatorless.required("Senha Obrigatória"),
                          Validatorless.min(
                              6, "Senha deve conter pelo menos 6 caracteres")
                        ]),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Center(
                          child: VakinhaButton(
                        width: context.width,
                        label: "Entrar",
                        onPressed: () {
                          var validatorForm =
                              formKey.currentState?.validate() ?? false;
                          if (validatorForm) {
                            controller.login(
                                email: _emailEC.text,
                                password: _passwordEC.text);
                          }
                        },
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
