import 'package:flutter/material.dart';
import 'package:flutter_demo_1/HomeScreen/Models/grid_items.dart';
import 'package:flutter_demo_1/SingleGridItems/Screens/single_item.dart';

class TabBody extends StatelessWidget {
  final String tabName;
  TabBody({Key? key, required this.tabName}) : super(key: key);

  List<GridItem> allGriditems = [
    GridItem("LIGHT", "FAN SW", false, 1),
    GridItem("LIGHT", "D-Light 2", false, 2),
    GridItem("LIGHT", "TubeLight", false, 3),
    GridItem("RGB", "Hall Strip", false, 4),
    GridItem("LIGHT", "D-Light 5", false, 5),
    GridItem("LIGHT", "D-Light 1", false, 6),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: allGriditems.length,
      itemBuilder: (BuildContext context, int index) {
        return SingleGridItem(item: allGriditems[index], tabName: tabName);
      },
    );
  }
}
