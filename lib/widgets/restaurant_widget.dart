import 'package:flutter/material.dart';

class RestaurantWidget extends StatefulWidget {
  const RestaurantWidget({Key? key}) : super(key: key);

  @override
  State<RestaurantWidget> createState() => _RestaurantWidgetState();
}

class _RestaurantWidgetState extends State<RestaurantWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;
  String _content = "Ciao";
  final List<Tab> tabs = [
    const Tab(
      text: "Item 1",
    ),
    const Tab(
      text: "Item 2",
    )
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: tabs.length,
      vsync: this,
      animationDuration: const Duration(milliseconds: 300),
      initialIndex: _currentIndex,
    );
    // _tabController.addListener(() {
    // if (_tabController.indexIsChanging) debugPrint("Stampa");
    // if (_tabController.previousIndex != _currentIndex) debugPrint("Stampa");
    // });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: TabBar(
          controller: _tabController,
          tabs: tabs,
          indicatorColor: Colors.green,
          unselectedLabelColor: Colors.red,
          indicatorSize: TabBarIndicatorSize.label,
          onTap: (int index) {
            _tabController.animateTo(index);
            _currentIndex = index;
            setState(() {
              _content = "Contenuto $index";
            });
          },
        ),
        body: TabBarView(
          controller: _tabController,
          children: tabs.map((Tab item) => _buildDataTable(item)).toList(),
        ),
      );

  Widget _buildDataTable(Tab item) => DataTable(
        showCheckboxColumn: true,
        columns: [
          DataColumn(
            label: Text(
              item.text!,
            ),
          ),
          DataColumn(
            label: Text(
              item.text!,
            ),
          ),
          DataColumn(
            label: Text(
              item.text!,
            ),
          ),
        ],
        rows: [
          DataRow(
            onSelectChanged: (val) {},
            cells: [
              DataCell(
                Text(
                  "Cella ${item.text!}",
                ),
              ),
              DataCell(
                Text(
                  "Cella ${item.text!}",
                ),
              ),
              DataCell(
                Text(
                  "Cella ${item.text!}",
                ),
              ),
            ],
          ),
          DataRow(
            cells: [
              DataCell(
                Text(
                  "Cella ${item.text!}",
                ),
              ),
              DataCell(
                Text(
                  "Cella ${item.text!}",
                ),
              ),
              DataCell(
                Text(
                  "Cella ${item.text!}",
                ),
              ),
            ],
          ),
        ],
      );
}
