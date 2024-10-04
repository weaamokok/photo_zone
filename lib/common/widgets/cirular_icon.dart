import 'package:flutter/material.dart';

class CircularIcon extends StatelessWidget {
  const CircularIcon(
      {super.key, required this.icon, required this.onTap, this.color});
  final Icon icon;
  final Color? color;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all()),
      width: 45,
      height: 45,
      padding: const EdgeInsets.only(bottom: 5),
      child: CircleAvatar(
        radius: 25,
        backgroundColor: color,
        child: IconButton(
          icon: icon,
          onPressed: onTap,
        ),
      ),
    );
  }
}
