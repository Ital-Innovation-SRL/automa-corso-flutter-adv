import 'package:auto_size_text/auto_size_text.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import '../screens/cart_screen.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final IconData? icon;
  final String text;
  final int counter;
  final Color? backGroundColor;

  const CustomAppbar({
    Key? key,
    this.icon,
    required this.text,
    this.backGroundColor,
    required this.counter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      actions: [
        IconButton(
          icon: Badge(
            badgeContent: AutoSizeText(
              counter.toString(),
              style: Theme.of(context)
                  .textTheme
                  .caption!
                  .copyWith(color: Colors.white),
              maxLines: 1,
            ),
            padding: counter > 999
                ? const EdgeInsets.all(2)
                : const EdgeInsets.all(10),
            animationType: BadgeAnimationType.scale,
            badgeColor: Colors.green,
            borderRadius: counter > 999
                ? BorderRadius.circular(10)
                : BorderRadius.circular(0),
            shape: counter > 999 ? BadgeShape.square : BadgeShape.circle,
            position: BadgePosition.topStart(start: -15),
            child: const Icon(Icons.shopping_cart),
          ),
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return const CartScreen();
                },
              ),
            );
            debugPrint("Ciao");
          },
        ),
      ],
      elevation: 0,
      backgroundColor: backGroundColor ?? Colors.transparent,
      title: Text(text),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
