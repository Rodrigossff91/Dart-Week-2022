import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:vakinha_burgue/app/core/ui/vakinha_state.dart';
import 'package:vakinha_burgue/app/core/ui/widgets/vakinha_appbar.dart';
import 'package:vakinha_burgue/app/core/ui/widgets/vakinha_buttom.dart';
import 'package:vakinha_burgue/app/core/ui/widgets/vakinha_textformfield.dart';
import 'package:vakinha_burgue/app/modules/auth/register/register_controller.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState
    extends VakinhaState<RegisterPage, RegisterController> {
  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _nameEC.dispose();
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
      body: SingleChildScrollView(
        child: IntrinsicHeight(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cadastro',
                      style: context.textTheme.headline6?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: context.theme.primaryColorDark),
                    ),
                    Text(
                      'Preencha os campos abaixo para criar o seu cadastro',
                      style: context.textTheme.bodyText1
                          ?.copyWith(color: context.theme.primaryColorDark),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    VakinhaTextformfield(
                      label: "Nome",
                      controller: _nameEC,
                      validator: Validatorless.required("Nome Obrigatorio"),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    VakinhaTextformfield(
                      label: "E-mail",
                      controller: _emailEC,
                      validator: Validatorless.multiple([
                        Validatorless.required("E-mail obrigatório"),
                        Validatorless.email("E-mail inválido")
                      ]),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    VakinhaTextformfield(
                      obscureText: true,
                      label: "Senha",
                      controller: _passwordEC,
                      validator: Validatorless.multiple([
                        Validatorless.required("Senha obrigatória"),
                        Validatorless.min(
                            6, 'Senha deve conter pelo menos 6 caracteres')
                      ]),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    VakinhaTextformfield(
                        obscureText: true,
                        label: "Confirma senha",
                        validator: Validatorless.multiple([
                          Validatorless.required("Confirmar senha obrigatória"),
                          Validatorless.compare(
                              _passwordEC, 'Senha diferente de confirma senha')
                        ])),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                        child: VakinhaButton(
                            width: context.width,
                            label: "Cadastrar",
                            onPressed: () {
                              final formValid =
                                  _formKey.currentState?.validate() ?? false;
                              if (formValid) {
                                controller.register(
                                    name: _nameEC.text,
                                    email: _emailEC.text,
                                    password: _passwordEC.text);
                              }
                            })),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
