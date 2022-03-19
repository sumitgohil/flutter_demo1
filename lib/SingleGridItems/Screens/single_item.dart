import 'package:flutter/material.dart';

import 'package:flutter_demo_1/HomeScreen/Models/grid_items.dart';
import 'package:flutter_demo_1/SingleGridItems/Controllers/single_grid_controller.dart';
import 'package:get/get.dart';

class SingleGridItem extends StatelessWidget {
  final GridItem item;
  final String tabName;
  const SingleGridItem({Key? key, required this.item, required this.tabName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SingleGridItemController>(
        init: SingleGridItemController(item, tabName),
        tag: tabName + "_" + item.id.toString(),
        builder: (controller) {
          return Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            margin: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(fontSize: 28),
                ),
                Text(
                  item.subTitle,
                  style: const TextStyle(fontSize: 20, color: Colors.black45),
                ),
                Row(
                  children: [
                    Text(controller.gridItem.isSelected ? "ON" : "OFF"),
                    Switch(
                        value: controller.gridItem.isSelected,
                        onChanged: (_val) {
                          controller.changeSwtich(_val);
                        })
                  ],
                )
              ],
            ),
          );
        });
  }
}
