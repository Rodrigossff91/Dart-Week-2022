import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:vakinha_burgue/app/core/ui/widgets/vakinha_appbar.dart';
import 'package:vakinha_burgue/app/core/ui/widgets/vakinha_buttom.dart';
import 'package:vakinha_burgue/app/core/ui/widgets/vakinha_textformfield.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                const VakinhaTextformfield(label: "Nome"),
                const SizedBox(
                  height: 30,
                ),
                const VakinhaTextformfield(label: "E-mail"),
                const SizedBox(
                  height: 50,
                ),
                const VakinhaTextformfield(label: "Senha"),
                const SizedBox(
                  height: 50,
                ),
                const VakinhaTextformfield(label: "Confirma senha"),
                const SizedBox(
                  height: 30,
                ),
                Center(
                    child: VakinhaButton(
                  width: context.width,
                  label: "Cadastrar",
                  onPressed: () {},
                )),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
