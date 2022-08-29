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
  Widget build(BuildContext context) => Container(
        width: MediaQuery.of(context).size.width * .9,
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: Icon(icon ?? Icons.info, color: Colors.amber),
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      );
}
