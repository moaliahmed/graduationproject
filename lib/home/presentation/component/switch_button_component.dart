
import 'package:flutter/material.dart';
class SwitchButtonComponent extends StatelessWidget {
  const SwitchButtonComponent(
      {super.key,
        required this.title,
        required this.active,
        required this.left});

  final String title;
  final bool active;
  final bool left;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 36,

      decoration: BoxDecoration(
        border: Border.all(
            color: const Color(
              0xff0090ff,
            ),
            width: 2),
        borderRadius: left
            ? const BorderRadius.only(
          topLeft: Radius.circular(22),
          bottomLeft: Radius.circular(22),
        )
            : const BorderRadius.only(
          topRight: Radius.circular(22),
          bottomRight: Radius.circular(22),
        ),
        color: active ? const Color(0xff0090ff) : Colors.white,
      ),
      child: Text(
        title,
        style: TextStyle(
          color: active ? Colors.white : const Color(0xff0090ff),
          fontSize: 18,
        ),
      ),
    );
  }
}