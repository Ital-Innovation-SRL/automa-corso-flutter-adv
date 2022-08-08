import 'package:flutter/material.dart';
import 'package:restapp_automa/screens/homepage_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.grey[200],
          elevation: 3,
          enableFeedback: true,
        ),
        textTheme: Theme.of(context).textTheme.copyWith(
              // headline4: Theme.of(context).textTheme.headline4!.copyWith(
              //       fontSize: Theme.of(context).textTheme.headline1!.fontSize,
              //     ),
            ),
      ),
      home: const HomePageScreen(),
    );
  }
}
