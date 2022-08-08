// To parse this JSON data, do
//
//     final dish = dishFromJson(jsonString);

import 'dart:convert';

Dish dishFromJson(String str) => Dish.fromJson(json.decode(str));

String dishToJson(Dish data) => json.encode(data.toJson());

class Dish {
  Dish({
    this.id,
    required this.name,
    required this.description,
    this.firebaseId,
    required this.imageUrl,
    required this.price,
  });

  int? id;
  String name;
  String? firebaseId;
  String description;
  String imageUrl;
  double price;

  Dish copyWith({
    int? id,
    required String name,
    required String firebaseId,
    required String description,
    required String imageUrl,
    required double price,
  }) =>
      Dish(
        id: id ?? this.id,
        name: name,
        firebaseId: firebaseId,
        description: description,
        imageUrl: imageUrl,
        price: price,
      );

  factory Dish.fromJson(Map<String, dynamic> json) => Dish(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        imageUrl: json["image_url"],
        price: json["price"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image_url": imageUrl,
        "price": price,
      };
}
