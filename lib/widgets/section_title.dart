import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final IconData? icon;
  final String text;

  const SectionTitle({
    Key? key,
    this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon ?? Icons.info), //icon == null ? icon : Icons.info
        Text(text),
      ],
    );
  }
}
