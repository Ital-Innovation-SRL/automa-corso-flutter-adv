import 'package:flutter/material.dart';

class PushedTextCounter extends StatelessWidget {
  final int counter;

  const PushedTextCounter({
    Key? key,
    required this.counter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            const Text(
              'You have pushed the button:',
            ),
            Text(
              '$counter',
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Colors.red),
            ),
          ],
        ),
      );
}
