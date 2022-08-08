import 'package:flutter/material.dart';
import 'package:restapp_automa/models/dish.dart';
import 'package:restapp_automa/screens/dish_detail_screen.dart';
import 'package:restapp_automa/screens/dish_type_detail_screen.dart';
import 'package:restapp_automa/widgets/dish_card.dart';
import 'package:restapp_automa/widgets/section_title.dart';

import '../models/category.dart';
import 'category_item_widget.dart';

class HomeWidget extends StatefulWidget {
  final VoidCallback onAddToCart;

  const HomeWidget({
    Key? key,
    required this.onAddToCart,
  }) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  List<CategoryModel>? _listCategories = [];
  bool isFetchingData = true;
  Dish _dish = Dish(
    id: 1,
    name: "Tiramisù",
    description: """
Il tiramisù è un dolce e prodotto agroalimentare tradizionale diffuso in tutto il territorio italiano, 
le cui origini sono dibattute e attribuite soprattutto al Veneto e al Friuli-Venezia Giulia. 
È un dessert al cucchiaio a base di savoiardi (oppure altri biscotti di consistenza friabile) inzuppati nel caffè e ricoperti di una crema, composta di 
mascarpone, uova e zucchero, che in alcune varianti è aromatizzata con il liquore.Il tiramisù è un dolce e prodotto agroalimentare tradizionale diffuso in tutto il territorio italiano, 
le cui origini sono dibattute e attribuite soprattutto al Veneto e al Friuli-Venezia Giulia. 
È un dessert al cucchiaio a base di savoiardi (oppure altri biscotti di consistenza friabile) inzuppati nel caffè e ricoperti di una crema, composta di 
mascarpone, uova e zucchero, che in alcune varianti è aromatizzata con il liquore.Il tiramisù è un dolce e prodotto agroalimentare tradizionale diffuso in tutto il territorio italiano, 
le cui origini sono dibattute e attribuite soprattutto al Veneto e al Friuli-Venezia Giulia. 
È un dessert al cucchiaio a base di savoiardi (oppure altri biscotti di consistenza friabile) inzuppati nel caffè e ricoperti di una crema, composta di 
mascarpone, uova e zucchero, che in alcune varianti è aromatizzata con il liquore.
                            """,
    imageUrl:
        "https://upload.wikimedia.org/wikipedia/commons/thumb/5/58/Tiramisu_-_Raffaele_Diomede.jpg/260px-Tiramisu_-_Raffaele_Diomede.jpg",
    price: 35.40,
  );

  @override
  void initState() {
    super.initState();
    //Business logic
    _fetchData();
  }

  void _fetchData() async {
    isFetchingData = true;
    setState(() {});
    // _listCategories = await getCategoryModels();
    // _listCategoryItemWidget = <CategoryItemWidget>[];
    // for (CategoryModel item in _listCategories) {
    //   CategoryItemWidget widget = CategoryItemWidget(category: item);
    //   _listCategoryItemWidget.add(widget);
    // }

    isFetchingData = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return /*isFetchingData
        ? const Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            ),
          )
        : */
        Column(
      children: [
        _buildCategoriesFB(),
        // _buildCategories(),
        _buildTodayDeals(),
        //_buildPopularItems(),
      ],
    );
  }

  Widget _buildCategoriesFB() {
    return FutureBuilder(
      future: getCategoryModels(),
      builder: (BuildContext context, AsyncSnapshot ass) {
        switch (ass.connectionState) {
          case ConnectionState.done:
            _listCategories = ass.data;
            return _buildCategories();
          case ConnectionState.waiting:
            return const Text("In attesa...");
          default:
            if (ass.hasError) {
              return const Text("Error");
            } else {
              return const Text("Non c'è niente");
            }
        }
      },
    );
  }

  Widget _buildCategories() => SizedBox(
        height: 70,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: _listCategories!.isEmpty
              ? const Text("Non ci sono elementi")
              : ListView.builder(
                  itemBuilder: (BuildContext context, int index) =>
                      CategoryItemWidget(
                    category: _listCategories![index],
                    onTap: () async {
                      int? res = await Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                          return DishTypeDetailScreen(
                            cat: _listCategories![index],
                          );
                        }),
                      );

                      if (res != null) debugPrint(res.toString());
                      // onItemAdded(_listCategories![index].id);
                      // Navigator.push(context, );
                    },
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

    // await Future.delayed(const Duration(seconds: 4));

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
                    DishCard(
                      dish: _dish,
                      onTap: () async {
                        bool? res = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                DishDetailScreen(dish: _dish),
                          ),
                        );
                        debugPrint("Risultato dal dettaglio $res");
                        if (res != null) {
                          widget.onAddToCart();
                        }
                      },
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
