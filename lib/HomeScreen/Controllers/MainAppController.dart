import 'package:flutter/material.dart';
import 'package:flutter_demo_1/HomeScreen/Models/grid_items.dart';

import 'package:get/get.dart';

class MainAppController extends GetxController
    with GetSingleTickerProviderStateMixin {
  List<String> allTabs = ["Hall", "Dining", "Bathroom", "Bedroom"];

  Map<String, List<GridItem>> selectedListMap = {};
  late TabController tabController;

  @override
  void onInit() {
    tabController = TabController(length: allTabs.length, vsync: this);

    for (var item in allTabs) {
      selectedListMap.putIfAbsent(item, () => []);
    }
    super.onInit();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
