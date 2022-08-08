import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:restapp_automa/main.dart';
import 'package:restapp_automa/models/dish.dart';
import 'package:restapp_automa/screens/cart_screen.dart';
import 'package:restapp_automa/widgets/home_widget.dart';

class PageIndexes {
  static const int Home = 0;
  static const int Restaurant = 1;
  static const int Account = 2;
}

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = PageIndexes.Home;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text("RestApp"),
        // leading: IconButton(
        //   icon: const Icon(Icons.people),
        //   onPressed: () {
        //     //Apri il drawer
        //     _scaffoldKey.currentState?.openDrawer();
        //   },
        // ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
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
      ),
      // body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          CollectionReference<Map<String, dynamic>> dishes =
              firestore.collection("dishes");

          List.generate(
            5,
            (index) => dishes.add(
              Dish(
                name: "Torta $index",
                description: "Descrizione $index",
                imageUrl: "https://picsum.photos/200/300",
                price: (index * 10).toDouble(),
              ).toJson(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: _buildBody(),
      // bottomNavigationBar: _buildBottomBar(),
      drawer: _buildDrawer(),
    );
  }

  Widget _buildBody() {
    Widget result = Container();
    switch (_selectedIndex) {
      case PageIndexes.Home:
        //Business logic
        result = HomeWidget(
          onAddToCart: () async {
            debugPrint("Prodotto aggiunto al carrello!");
            //Aggiunge il prodotto ad una lista di prodotti del carrello
          },
        );
        break;
      case PageIndexes.Restaurant:
        // result = const RestaurantWidget();
        break;
      default:
        break;
    }
    return result;
  }

  Widget _buildBottomBar() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: (int index) {
        if (index == PageIndexes.Account) {
        } else {
          _selectedIndex = index;
          setState(() {});
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.restaurant),
          label: "Ristorante",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Account",
        ),
      ],
    );
  }

  Widget _buildDrawer() => Drawer(
        child: Column(
          children: const [
            DrawerHeader(child: Text("Ciao")),
            Divider(
              color: Colors.red,
            ),
            ListTile(
              title: Text("Title"),
            ),
          ],
        ),
      );
}
