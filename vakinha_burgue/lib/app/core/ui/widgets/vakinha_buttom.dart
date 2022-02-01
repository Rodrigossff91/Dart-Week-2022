import 'package:flutter/material.dart';

class VakinhaButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final double? width;
  final double height;
  final Color? color;

  const VakinhaButton(
      {Key? key,
      this.onPressed,
      required this.label,
      this.width,
      this.height = 50,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        style: ElevatedButton.styleFrom(
          primary: color,
          shape: const StadiumBorder(),
        ),
      ),
    );
  }
}
