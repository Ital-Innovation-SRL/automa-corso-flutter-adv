// To parse this JSON data, do
//
//     final cart = cartFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/foundation.dart';

Cart cartFromJson(String str) => Cart.fromJson(json.decode(str));

String cartToJson(Cart data) => json.encode(data.toJson());

class Cart {
  Cart({
    required this.id,
    required this.productId,
    required this.productName,
    required this.initialPrice,
    required this.productPrice,
    required this.quantity,
    required this.unitTag,
    required this.image,
  });

  int id;
  String productId;
  String productName;
  int initialPrice;
  int productPrice;
  ValueNotifier<int> quantity;
  String unitTag;
  String image;

  Cart copyWith({
    required int id,
    required String productId,
    required String productName,
    required int initialPrice,
    required int productPrice,
    required ValueNotifier<int> quantity,
    required String unitTag,
    required String image,
  }) =>
      Cart(
        id: id ?? this.id,
        productId: productId ?? this.productId,
        productName: productName ?? this.productName,
        initialPrice: initialPrice ?? this.initialPrice,
        productPrice: productPrice ?? this.productPrice,
        quantity: quantity ?? this.quantity,
        unitTag: unitTag ?? this.unitTag,
        image: image ?? this.image,
      );

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
    id: json["id"],
    productId: json["productId"],
    productName: json["productName"],
    initialPrice: json["initialPrice"],
    productPrice: json["productPrice"],
    quantity: json["quantity"],
    unitTag: json["unitTag"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "productId": productId,
    "productName": productName,
    "initialPrice": initialPrice,
    "productPrice": productPrice,
    "quantity": quantity,
    "unitTag": unitTag,
    "image": image,
  };
}
