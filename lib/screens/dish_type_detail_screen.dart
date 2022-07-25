import 'package:flutter/material.dart';
import 'package:restapp_automa/models/category.dart';

class DishTypeDetailScreen extends StatefulWidget {
  final CategoryModel cat;

  const DishTypeDetailScreen({Key? key, required this.cat}) : super(key: key);

  @override
  State<DishTypeDetailScreen> createState() => _DishTypeDetailScreenState();
}

class _DishTypeDetailScreenState extends State<DishTypeDetailScreen> {
  @override
  Widget build(BuildContext context) {
    //TODO utilizzare Hero()
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(widget.cat.name),
            MaterialButton(
              onPressed: () {
                // Navigator.of(context).pop();
                Navigator.pop(context, widget.cat.kinds);
              },
              color: Colors.red,
              child: const Text("Torna indietro"),
            ),
          ],
        ),
      ),
    );
  }
}
