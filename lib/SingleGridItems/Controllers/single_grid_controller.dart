import 'package:flutter_demo_1/HomeScreen/Controllers/MainAppController.dart';
import 'package:flutter_demo_1/HomeScreen/Models/grid_items.dart';
import 'package:get/get.dart';

class SingleGridItemController extends GetxController {
  GridItem gridItem;
  String tabName;

  SingleGridItemController(this.gridItem, this.tabName);

  changeSwtich(bool changeState) {
    gridItem.isSelected = changeState;

    if (changeState) {
      Get.find<MainAppController>().selectedListMap[tabName]!.add(gridItem);
    } else {
      Get.find<MainAppController>().selectedListMap[tabName]!.remove(gridItem);
    }

    update();
  }
}
