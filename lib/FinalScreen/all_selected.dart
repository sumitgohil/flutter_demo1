import 'package:flutter/material.dart';
import 'package:flutter_demo_1/HomeScreen/Controllers/MainAppController.dart';
import 'package:flutter_demo_1/HomeScreen/Models/grid_items.dart';
import 'package:get/get.dart';

class FinalScreen extends StatelessWidget {
  const FinalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<MainAppController>(
            init: Get.find<MainAppController>(),
            builder: (c) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                      List<Widget>.generate(c.allTabs.length, (int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: Get.width,
                            height: Get.height * .03,
                            color: Colors.amber,
                            margin: EdgeInsets.all(8),
                            child: Text(c.allTabs[index])),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount:
                              c.selectedListMap[c.allTabs[index]]!.length,
                          itemBuilder: (BuildContext context, int index2) {
                            GridItem g =
                                c.selectedListMap[c.allTabs[index]]![index2];
                            return Text("${g.name} (${g.subTitle})");
                          },
                        ),
                      ],
                    );
                  }),
                ),
              );
            }),
      ),
    );
  }
}
