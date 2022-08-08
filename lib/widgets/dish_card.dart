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

  //
  // @override
  // Widget build(BuildContext context) => InkWell(
  //       onTap: onTap,
  //       child: SizedBox(
  //         width: 125,
  //         child: Column(
  //           children: [
  //             SizedBox(
  //               width: 160.0,
  //               height: 150.0,
  //               child: Hero(
  //                 tag: "dish-${dish.id}",
  //                 child: Image.network(
  //                   dish.imageUrl,
  //                   errorBuilder: (_, __, ___) => Container(
  //                     height: 50,
  //                     width: 50,
  //                     color: Colors.red[700],
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             Hero(
  //               tag: "text-${dish.id}",
  //               child: AutoSizeText(
  //                 dish.name,
  //                 maxLines: 1,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     );
  @override
  Widget build(BuildContext context) => ListTile(
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
        onTap: onTap,
      );
}
