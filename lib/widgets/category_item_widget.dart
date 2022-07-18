import 'package:flutter/material.dart';

class CategoryItemWidget extends StatelessWidget {
  final String imageCategory;
  final String nameCategory;
  final int kindsCategory;

  const CategoryItemWidget( { Key? key, required this.imageCategory,
    required this.nameCategory, required this.kindsCategory}) : super(key: key);

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
              //mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  width: 50.0,
                  child: Padding(
                    padding: const EdgeInsets.only(left:5.0, top:4, right: 0.0, bottom: 4.0),
                    child: Image.asset(imageCategory),
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
                            nameCategory,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            )
                        ),
                        Text(
                            "$kindsCategory kinds",
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
