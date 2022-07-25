import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:restapp_automa/models/category.dart';

class CategoryItemWidget extends StatelessWidget {
  // final String imageCategory;
  // final String nameCategory;
  // final int kindsCategory;
  final CategoryModel category;

  const CategoryItemWidget( { Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _makeCategoryItem();
  }


  Widget _makeCategoryItem() => SizedBox(
      width: 125,
      //width: MediaQuery.of(context).size.width * 0.90,
      child: GestureDetector(
        child: Stack(clipBehavior: Clip.hardEdge, children: [
          Card(
            elevation: 0.7,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(6.0))),
            child: Row(
              children: [
                SizedBox(
                  width: 50.0,
                  child: Padding(
                    padding: const EdgeInsets.only(left:5.0, top:4, right: 0.0, bottom: 4.0),
                    child: Image.asset(category.image),
                  ),
                ),
                SizedBox(
                  width: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                            category.name,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            )
                        ),
                        Text(
                            "${category.kinds} kinds",
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                            )
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ]),
      )
  );
}
