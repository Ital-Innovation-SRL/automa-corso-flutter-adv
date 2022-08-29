import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:restapp_automa/models/dish.dart';

class DishCard extends StatelessWidget {
  final Dish dish;
  final VoidCallback onTap;
  final VoidCallback onRemove;

  const DishCard({
    Key? key,
    required this.dish,
    required this.onRemove,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.white,
        elevation: 3,
        child: ListTile(
          onLongPress: onRemove,
          leading: Hero(
            tag: "dish-${dish.id}",
            child: Image.network(
              dish.imageUrl,
              errorBuilder: (_, __, ___) => Container(
                height: 50,
                width: 50,
                color: Colors.red[700],
              ),
            ),
          ),
          title: Hero(
            tag: "text-${dish.id}",
            child: AutoSizeText(
              dish.name,
              maxLines: 1,
            ),
          ),
          subtitle: Text(dish.description),
          trailing: const Icon(Icons.chevron_right),
          onTap: onTap,
        ),
      );
}
