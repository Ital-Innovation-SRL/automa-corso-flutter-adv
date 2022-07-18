
import 'package:flutter/material.dart';
import 'package:restapp_automa/widgets/section_title.dart';

import 'category_item_widget.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
   List<CategoryItemWidget> _listCategoryItemWidget = <CategoryItemWidget>[];

  @override
  void initState() {
    //Business logic
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CategoryItemWidget hamburger = const CategoryItemWidget( imageCategory: './assets/images/hamburger.png', nameCategory: "Burger", kindsCategory: 55);
    CategoryItemWidget pizza = const CategoryItemWidget( imageCategory: './assets/images/pizza.png', nameCategory: "Pizza", kindsCategory: 23);
    CategoryItemWidget sandwich = const CategoryItemWidget( imageCategory: './assets/images/sandwich.png', nameCategory: "Sandwich", kindsCategory: 18);
    CategoryItemWidget grill = const CategoryItemWidget( imageCategory: './assets/images/grill.png', nameCategory: "Grill", kindsCategory: 15);
    CategoryItemWidget dessert = const CategoryItemWidget( imageCategory: './assets/images/dessert.png', nameCategory: "Dessert", kindsCategory: 60);
    //Azzero la lista ogni volta che viene renderizzato il widget altrimenti duplica gli elementi
    _listCategoryItemWidget = <CategoryItemWidget>[];
    _listCategoryItemWidget.add(hamburger);
    _listCategoryItemWidget.add(pizza);
    _listCategoryItemWidget.add(sandwich);
    _listCategoryItemWidget.add(grill);
    _listCategoryItemWidget.add(dessert);

    return Column(
      children: [
        _buildCategories(),
         _buildTodayDeals(),
        //_buildPopularItems(),
      ],
    );
  }

  Widget _buildCategories() => SizedBox(
      height: 70,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: _listCategoryItemWidget,
    ),
      ),
  );

  Widget _buildTodayDeals() => Column(
        children: [
          const SectionTitle(text: "Today's deals"),
          // Row(
          //   children: [
          //     for (int i = 0; i < 100; i++) Text("$i - "),
          //   ],
          // ),
          Container(
            child: ListView(

            ),
            height: 150,
          ),
        ],
      );

  // Widget _buildPopularItems() => SizedBox(
  //   height: 200,
  //       child: ListView(
  //         scrollDirection: Axis.horizontal,
  //         shrinkWrap: true,
  //         children: [
  //         ],
  //       ),
  //     );

}
