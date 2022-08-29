import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:restapp_automa/firebase_options.dart';
import 'package:restapp_automa/screens/homepage_screen.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
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
