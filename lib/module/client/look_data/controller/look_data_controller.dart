import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fhe_template/core.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LookDataController extends GetxController {
  LookDataView? view;
  List dataSingleUser = [];
  Map data = {};

  ScannerController scannerController = Get.find();

  getUser(String idUser) async {
    var snapshot = await FirebaseFirestore.instance
        .collection("data_user")
        .where("id_user", isEqualTo: idUser)
        .get();

    for (var i = 0; i < snapshot.docs.length; i++) {
      Map<String, dynamic> item = snapshot.docs[i].data();
      item["id"] = snapshot.docs[i].id;
      dataSingleUser.add(item);
      data.addAll(dataSingleUser.first);
    }

    update();
    if (dataSingleUser.isNotEmpty) {
      debugPrint("status: ${dataSingleUser.first}");
      data.addAll(dataSingleUser.first);
    } else {
      debugPrint("status: $dataSingleUser");
    }
  }

  @override
  void onInit() {
    String idUser = scannerController.idUser;
    getUser(idUser);
    super.onInit();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
