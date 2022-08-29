import 'package:flutter/material.dart';
import 'package:restapp_automa/utils/helper_function.dart';
import 'package:restapp_automa/utils/strings.dart';
import 'package:restapp_automa/widgets/custom_app_bar.dart';
import 'package:restapp_automa/widgets/home_widget.dart';
import 'package:restapp_automa/widgets/restaurant_widget.dart';

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
  Widget build(BuildContext context) => Scaffold(
        key: _scaffoldKey,
        appBar: const CustomAppbar(text: Strings.appName, counter: 0),
        floatingActionButton: const FloatingActionButton(
          onPressed: generateDummyDishes,
          child: Icon(Icons.add),
        ),
        body: _Body(index: _selectedIndex),
        bottomNavigationBar: _buildBottomBar(),
        drawer: const _Drawer(),
      );

  Widget _buildBottomBar() => BottomNavigationBar(
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
            activeIcon: Icon(Icons.home_outlined),
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

class _Body extends StatelessWidget {
  final int index;

  const _Body({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget result = Container();
    switch (index) {
      case PageIndexes.Home:
        //Business logic
        result = HomeWidget(
          //Aggiunge il prodotto ad una lista di prodotti del carrello
          onAddToCart: () async {
            debugPrint("Prodotto aggiunto al carrello!");
          },
        );
        break;
      case PageIndexes.Restaurant:
        result = const RestaurantWidget();
        break;
      default:
        break;
    }
    return result;
  }
}

class _Drawer extends StatelessWidget {
  const _Drawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        child: Column(
          children: const [
            DrawerHeader(child: Text("Ciao")),
            Divider(color: Colors.red),
            ListTile(title: Text("Title")),
          ],
        ),
      );
}
