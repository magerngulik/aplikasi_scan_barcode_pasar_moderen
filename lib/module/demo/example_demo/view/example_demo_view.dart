import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controller/example_demo_controller.dart';

class ExampleDemoView extends StatelessWidget {
  const ExampleDemoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExampleDemoController>(
      init: ExampleDemoController(),
      builder: (controller) {
        controller.view = this;

        List items = [
          {"icon": "https://i.ibb.co/PGv8ZzG/me.jpg", "name": "add", "kode": 1},
          {"icon": Icons.add, "name": "add", "kode": 0},
          {"icon": Icons.add, "name": "add", "kode": 0},
          {"icon": Icons.add, "name": "add", "kode": 0},
          {"icon": Icons.add, "name": "add", "kode": 0},
        ];

        return Scaffold(
          appBar: AppBar(
            title: const Text("ExampleDemo"),
            actions: [
              SizedBox(
                height: 40.0,
                width: 200,
                child: ListView.builder(
                  itemCount: controller.tapbarButton.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    String items = controller.tapbarButton[index];

                    return InkWell(
                      onTap: () {
                        controller.selectedItems = items;
                        controller.update();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(items,
                                style: const TextStyle(
                                  fontSize: 20.0,
                                )),
                            (controller.selectedItems == items)
                                ? const CircleAvatar(
                                    radius: 2,
                                    backgroundColor: Colors.red,
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: ListView(
                children: [
                  Container(
                    height: 300.0,
                    width: 400.0,
                    decoration: BoxDecoration(
                      color: Colors.red[200],
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          16.0,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 300.0,
                    width: 400.0,
                    decoration: BoxDecoration(
                      color: Colors.green[200],
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          16.0,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 300.0,
                    width: 400.0,
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          16.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
