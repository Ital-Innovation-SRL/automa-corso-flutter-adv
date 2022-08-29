import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restapp_automa/main.dart';
import 'package:restapp_automa/models/dish.dart';

generateDummyDishes() {
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
}
