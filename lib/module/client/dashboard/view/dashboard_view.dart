import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fhe_template/core.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:get/get.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      init: DashboardController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Dashboard"),
            actions: [
              IconButton(
                onPressed: () {
                  controller.update();
                },
                icon: const Icon(
                  Icons.refresh,
                  size: 24.0,
                ),
              ),
              IconButton(
                onPressed: () => controller.deleteAllData(),
                icon: const Icon(
                  Icons.delete_forever_outlined,
                  size: 24.0,
                ),
              ),
              // IconButton(
              //   onPressed: () {
              //     controller.addDataUser();
              //   },
              //   icon: const Icon(
              //     Icons.data_array,
              //     size: 24.0,
              //   ),
              // ),
              IconButton(
                onPressed: () {
                  // controller.getUser("003");
                  Get.to(const ScannerView());
                },
                icon: const Icon(
                  Icons.add,
                  size: 24.0,
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          16.0,
                        ),
                      ),
                    ),
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection("data_user")
                          .orderBy('id_user', descending: false)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) return const Text("Error");
                        if (snapshot.data == null) return Container();
                        if (snapshot.data!.docs.isEmpty) {
                          return const Text("No Data");
                        }
                        final data = snapshot.data!;
                        return ListView.builder(
                          itemCount: data.docs.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            var item = data.docs[index];
                            return Card(
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.grey[200],
                                  backgroundImage: NetworkImage(
                                    "${item['image']}",
                                  ),
                                ),
                                title: Text("${item['name_user']}"),
                                subtitle: Text("${item['id_user']}"),
                                trailing: QrImage(
                                  data: "${item['id_user']}",
                                  version: QrVersions.auto,
                                  size: 50.0,
                                ),
                              ),
                            );
                          },
                        );
                      },
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
