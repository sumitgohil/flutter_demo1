import 'package:flutter/material.dart';
import 'package:flutter_demo_1/FinalScreen/all_selected.dart';
import 'package:flutter_demo_1/HomeScreen/Controllers/MainAppController.dart';
import 'package:flutter_demo_1/SIngleTabPages/Screens/tab_body.dart';
import 'package:get/get.dart';

class HomeSCreen extends StatelessWidget {
  const HomeSCreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GestureDetector(
        onTap: (() => Get.to(() => const FinalScreen())),
        child: Container(
          height: 50,
          alignment: Alignment.center,
          color: Colors.blueGrey,
          child: const Text(
            "Check Selected Items",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      backgroundColor: const Color(0xff2d2d2d),
      body: SafeArea(
        child: GetBuilder<MainAppController>(
            init: Get.put(MainAppController()),
            builder: (controller) {
              return Column(
                children: [
                  TabBar(
                      controller: controller.tabController,
                      tabs: List<Widget>.generate(controller.allTabs.length,
                          (int index) {
                        return Tab(text: controller.allTabs[index]);
                      })),
                  Expanded(
                    child: TabBarView(
                        controller: controller.tabController,
                        children: List<Widget>.generate(
                            controller.allTabs.length, (int index) {
                          return TabBody(
                            tabName: controller.allTabs[index],
                          );
                        })),
                  )
                ],
              );
            }),
      ),
    );
  }
}
