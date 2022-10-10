import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:restapp_automa/screens/bt_screen.dart';
import 'package:restapp_automa/screens/google_maps_screen.dart';
import 'package:restapp_automa/utils/helper_function.dart';
import 'package:restapp_automa/widgets/account_widget.dart';
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

  bool _errorOnConnection = false;

  @override
  void initState() {
    super.initState();
    _autoConnect();
  }

  void _autoConnect() async {
    List<BluetoothDevice> btDevices =
        await FlutterBluePlus.instance.connectedDevices;
    if (btDevices.isNotEmpty) {
      try {
        await btDevices.first.connect(timeout: const Duration(seconds: 4));
      } on TimeoutException {
        setState(() {
          _errorOnConnection = true;
        });
      } on Exception {
        setState(() {
          _errorOnConnection = true;
        });
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        key: _scaffoldKey,
        appBar: CustomAppbar(
          text: AppLocalizations.of(context)!.helloWorldWithName("Marco"),
          counter: 0,
        ),
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
        onTap: (int index) async {
          if (index == PageIndexes.Account) {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => const AccountWidget(),
              ),
            );
            setState(() {});
          } else {
            _selectedIndex = index;
            setState(() {});
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: AppLocalizations.of(context)!.helloWorld,
            activeIcon: const Icon(Icons.home_outlined),
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            label: "Ristorante",
          ),
          const BottomNavigationBarItem(
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
          children: [
            const DrawerHeader(child: Text("Ciao")),
            const Divider(color: Colors.red),
            ListTile(
              title: const Text("Bluetooth"),
              onTap: () async {
                Widget child = (await FlutterBluePlus.instance.isAvailable)
                    ? const FindDevicesScreen()
                    : const BluetoothOffScreen();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (BuildContext context) => child,
                  ),
                );
              },
            ),
            ListTile(
              title: const Text("Mappa"),
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => GoogleMapsScreen(),
                  ),
                ),
            ),
          ],
        ),
      );
}
