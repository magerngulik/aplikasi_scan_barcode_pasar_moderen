import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fhe_template/core.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class DashboardController extends GetxController {
  DashboardView? view;

  addDataUser() async {
    for (var i = 0; i < UserServices.dataUser.length; i++) {
      var item = UserServices.dataUser[i];
      debugPrint("idUser: 00${i + 3}");
      debugPrint("nama_user: ${item['name_user']}");

      await FirebaseFirestore.instance.collection("data_user").add({
        "id_user": "00${i + 1}",
        "name_user": "${item['name_user']}",
        "ttl_user": "${item['ttl_user']}",
        "alamat_user": "${item['alamat_user']}",
        "pekerjaan_user": "${item['pekerjaan_user']}",
        "image": "${item['image']}"
      });
    }
    update();
  }

  deleteAllData() async {
    Get.snackbar("dialog", "message");
    var context = Get.context;

    bool confirm = false;
    await showDialog<void>(
      context: context!,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Are you sure you want to delete this item?'),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[600],
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("No"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
              ),
              onPressed: () {
                confirm = true;
                Navigator.pop(context);
              },
              child: const Text("Yes"),
            ),
          ],
        );
      },
    );

    if (confirm) {
      var snapshot =
          await FirebaseFirestore.instance.collection("data_user").get();
      for (var i = 0; i < snapshot.docs.length; i++) {
        await FirebaseFirestore.instance
            .collection("data_user")
            .doc(snapshot.docs[i].id)
            .delete();
      }
    }
  }

  List dataSingleUser = [];
  getUser(String idUser) async {
    var snapshot = await FirebaseFirestore.instance
        .collection("data_user")
        .where("id_user", isEqualTo: idUser)
        .get();

    for (var i = 0; i < snapshot.docs.length; i++) {
      Map<String, dynamic> item = snapshot.docs[i].data();
      item["id"] = snapshot.docs[i].id;
      dataSingleUser.add(item);
    }

    update();
    if (dataSingleUser.isNotEmpty) {
      debugPrint("status: ${dataSingleUser.first}");
    } else {
      debugPrint("status: $dataSingleUser");
    }
  }
}
