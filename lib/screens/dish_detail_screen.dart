import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:restapp_automa/models/dish.dart';

class DishDetailScreen extends StatefulWidget {
  final Dish dish;

  const DishDetailScreen({
    Key? key,
    required this.dish,
  }) : super(key: key);

  @override
  State<DishDetailScreen> createState() => _DishDetailScreenState();
}

class _DishDetailScreenState extends State<DishDetailScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (Platform.isIOS) AppBar(),
              // Platform.isIOS
              //     ? AppBar()
              //     : Container(
              //         height: 100,
              //         width: 10,
              //         color: Colors.amber,
              //       ),
              // Visibility(
              //   child: AppBar(),
              //   visible: Platform.isIOS,
              //   // replacement: Container(height: 100,width: 10, color: Colors.amber,),
              // ),
              Stack(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Hero(
                      tag: "dish-${widget.dish.id}",
                      child: Image.network(
                        widget.dish.imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          height: 50,
                          width: 50,
                          color: Colors.red[700],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // top: 30,
                    left: 10,
                    child: FloatingActionButton(
                      mini: true,
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Icon(Icons.chevron_left),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Hero(
                          tag: "text-${widget.dish.id}",
                          child: AutoSizeText(
                            widget.dish.name,
                            style: Theme.of(context).textTheme.headline4,
                            maxLines: 1,
                          ),
                        ),
                        const SizedBox(height: 10),
                        GestureDetector(
                          onLongPress: _showDescDialog,
                          child: AutoSizeText(
                            widget.dish.description,
                            style: Theme.of(context).textTheme.subtitle2,
                            // maxLines: 5,
                            // overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: ElevatedButton.icon(
                            onPressed: _addToCart,
                            icon: const Icon(Icons.add),
                            label: const Text("Aggiungi al carrello"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  void _showDescDialog() => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => AlertDialog(
          title: const Text("Descrizione"),
          content: Text(widget.dish.description),
          actions: [
            MaterialButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            ),
          ],
        ),
      );

  void _addToCart() => Navigator.of(context).pop(true);
}
