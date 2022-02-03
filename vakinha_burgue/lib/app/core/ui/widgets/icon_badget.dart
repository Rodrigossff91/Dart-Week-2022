import 'package:flutter/material.dart';
import 'package:vakinha_burgue/app/core/ui/vakinha_ui.dart';

class IconBadget extends StatelessWidget {
  final int number;
  final IconData icon;

  const IconBadget({
    Key? key,
    required this.number,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Icon(this.icon),
        Visibility(
          visible: number > 0,
          child: Positioned(
            top: 0,
            right: 0,
            child: CircleAvatar(
              maxRadius: 9,
              backgroundColor: Colors.red,
              child: Text(
                number.toString(),
                style: VakinhaUI.textBold.copyWith(fontSize: 9),
              ),
            ),
          ),
        )
      ],
    );
  }
}
