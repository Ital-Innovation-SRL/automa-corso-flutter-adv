import 'package:flutter/material.dart';
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
  static final List<Widget> _pages = [
    const HomeWidget(),
    Container(),
    Container(),
  ];

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
      ),
      // body: _buildBody(),
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: _buildBottomBar(),
      drawer: _buildDrawer(),
    );
  }

  Widget _buildBody() {
    Widget result = Container();
    switch (_selectedIndex) {
      case PageIndexes.Home:
        //Business logic
        result = const HomeWidget(
          onItemAdded: (int id){
            //Aggiunge il prodotto al carrello (_productList)

          }
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

  Widget _buildDrawer() {
    return Drawer(
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
}
