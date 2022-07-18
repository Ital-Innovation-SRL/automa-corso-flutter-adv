import 'package:flutter/material.dart';
import 'package:restapp_automa/widgets/section_title.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  void initState() {
    //Business logic
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildCategories(),
        // _buildTodayDeals(),
        _buildPopularItems(),
      ],
    );
  }

  Widget _buildCategories() => Container(height: 100, child: ListView());

  Widget _buildTodayDeals() => Column(
        children: [
          const SectionTitle(text: "Today's deals"),
          Row(
            children: [
              for (int i = 0; i < 100; i++) Text("$i - "),
            ],
          ),
          // Container(
          //   child: ListView(),
          //   height: 150,
          // ),
        ],
      );

  Widget _buildPopularItems() => Container(
        color: Colors.red,
        child: Column(
          children: [
            const SectionTitle(
              text: "Popular Items",
              icon: Icons.star,
            ),
            // ListView(
            //   scrollDirection: Axis.vertical,
            //   shrinkWrap: true,
            // ),
          ],
        ),
      );
}
