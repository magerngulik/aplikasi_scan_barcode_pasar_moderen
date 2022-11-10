import 'package:fhe_template/core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async {
  await initialize();

  // Widget mainView = const DashboardView();
  // Widget mainView = const NavigatorView();
  Widget mainView = const ExampleDemoView();
  // Widget mainView = const HomeView();

  if (FirebaseAuth.instance.currentUser != null) {
    mainView = Container();
  }
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitUp]);
  runApp(
    GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: mainView,
    ),
  );
}
