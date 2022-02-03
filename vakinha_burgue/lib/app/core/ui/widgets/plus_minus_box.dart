import 'package:flutter/material.dart';
import 'package:vakinha_burgue/app/core/formatter_helper.dart';
import 'package:vakinha_burgue/app/core/ui/widgets/vakinha_rounded_button.dart';

class PlusMinusBox extends StatelessWidget {
  final bool elevated;
  final Color? backGroundColor;
  final String? label;
  final int quantidade;
  final double price;
  final VoidCallback minusCallback;
  final VoidCallback plusCallback;
  final bool calcularTotal;

  const PlusMinusBox({
    Key? key,
    this.elevated = false,
    this.backGroundColor,
    this.label,
    required this.quantidade,
    required this.price,
    required this.minusCallback,
    required this.plusCallback,
    this.calcularTotal = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevated ? 5 : 0,
      borderRadius: BorderRadius.circular(20),
      shadowColor: Colors.black26,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: backGroundColor, borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Visibility(
              visible: label != null,
              child: Text(
                label ?? '',
                style: const TextStyle(fontSize: 15),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              children: [
                VakinhaRoundedButton(
                  onPressed: minusCallback,
                  label: "-",
                ),
                Text("$quantidade"),
                VakinhaRoundedButton(
                  onPressed: plusCallback,
                  label: "+",
                ),
              ],
            ),
            Visibility(visible: label == null, child: const Spacer()),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 10),
              constraints: const BoxConstraints(minWidth: 70),
              child: Text(
                FormatterHelper.formatCurrency(
                    calcularTotal ? price * quantidade : price),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
