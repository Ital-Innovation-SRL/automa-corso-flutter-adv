import 'package:flutter/material.dart';
import 'package:restapp_automa/widgets/section_title.dart';

import '../models/category.dart';
import 'category_item_widget.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  List<CategoryItemWidget> _listCategoryItemWidget = <CategoryItemWidget>[];
  List<CategoryModel>? _listCategories;

  @override
  void initState() {
    super.initState();
    //Business logic
    _fetchData();
  }

  void _fetchData() async {
    _listCategories = await getCategoryModels();
    // _listCategoryItemWidget = <CategoryItemWidget>[];
    // for (CategoryModel item in _listCategories) {
    //   CategoryItemWidget widget = CategoryItemWidget(category: item);
    //   _listCategoryItemWidget.add(widget);
    // }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _listCategories != null ? _buildCategories() : Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircularProgressIndicator(),
          ),
        ),
        _buildTodayDeals(),
        //_buildPopularItems(),
      ],
    );
  }

  Widget _buildCategories() => SizedBox(
        height: 70,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: _listCategories!.isEmpty ? Text("Non ci sono elementi") : ListView.builder(
            itemBuilder: (BuildContext context, int index) =>
                CategoryItemWidget(
              category: _listCategories![index],
            ),
            itemCount: _listCategories!.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
          ),
          // child: ListView(
          //   scrollDirection: Axis.horizontal,
          //   shrinkWrap: true,
          //   children: [
          //     for(CategoryModel item in _listCategories)
          //       CategoryItemWidget(category: item),
          //   ],
          // ),
        ),
      );

  getCategoryModels() async {
    CategoryModel burger = CategoryModel(
        image: './assets/images/hamburger.png', name: "Burger", kinds: 55);
    CategoryModel pizza = CategoryModel(
        image: './assets/images/pizza.png', name: "Pizza", kinds: 23);
    CategoryModel sandwich = CategoryModel(
        image: './assets/images/sandwich.png', name: "Sandwich", kinds: 18);
    CategoryModel grill = CategoryModel(
        image: './assets/images/grill.png', name: "Grill", kinds: 15);
    CategoryModel dessert = CategoryModel(
        image: './assets/images/dessert.png', name: "Dessert", kinds: 60);
    var listCategories = <CategoryModel>[
      burger,
      pizza,
      sandwich,
      grill,
      dessert
    ];

    await Future.delayed(Duration(seconds: 4));

    return listCategories;
  }

  Widget _buildTodayDeals() => SizedBox(
        height: MediaQuery.of(context).size.height * 0.45,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(text: "Today's deals", icon: Icons.sell),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: [
                    SizedBox(
                      width: 125,
                      child: Column(
                        children: [
                          Container(
                            width: 160.0,
                            height: 150.0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child:
                                  Image.asset('./assets/images/bkforest2.jpg'),
                            ),
                          ),
                          Container(
                            width: 160.0,
                            color: Colors.blue,
                          ),
                          // SizedBox(
                          //   width: MediaQuery.of(context).size.width * 0.45,
                          //   height: 150,
                          //   child: Padding(
                          //     padding: const EdgeInsets.all(5.0),
                          //     child: Image.asset(
                          //         './assets/images/dessert.png' ),
                          //   ),
                          // ),
                          // SizedBox(
                          //   //width: 60,
                          //   child: Padding(
                          //     padding: const EdgeInsets.all(0.0),
                          //     child: Column(
                          //       mainAxisAlignment: MainAxisAlignment.center,
                          //       crossAxisAlignment: CrossAxisAlignment.center,
                          //       children: [
                          //         Container(
                          //           padding: const EdgeInsets.all(1.0),
                          //           child: const Text(
                          //               "Blackforest",
                          //               style: TextStyle(
                          //                 fontSize: 13,
                          //                 fontWeight: FontWeight.w600,
                          //               )
                          //           ),
                          //         ),
                          //         Container(
                          //           padding: const EdgeInsets.all(1.0),
                          //           child: const Text(
                          //               " 25 kinds",
                          //               style: TextStyle(
                          //                 fontSize: 13,
                          //                 fontWeight: FontWeight.w300,
                          //               )
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
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
