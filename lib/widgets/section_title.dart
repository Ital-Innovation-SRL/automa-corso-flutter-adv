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
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.90,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.only(right: 5.0),
              child: Icon(icon ?? Icons.info, color: Colors.amber)), //icon == null ? icon : Icons.info
          Text(text),
        ],
      ),
    );
  }
}
