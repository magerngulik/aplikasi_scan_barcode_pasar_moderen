import 'package:fhe_template/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigatorView extends StatelessWidget {
  const NavigatorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigatorController>(
      init: NavigatorController(),
      builder: (controller) {
        controller.view = this;

        return DefaultTabController(
          length: 4,
          initialIndex: controller.selectedIndex,
          child: Scaffold(
            body: IndexedStack(
              index: controller.selectedIndex,
              children: [
                const DashboardView(),
                const ScannerView(),
                const HomeView(),
                Container(
                  color: Colors.blue[100],
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: controller.selectedIndex,
              selectedItemColor: Colors.grey[700],
              unselectedItemColor: Colors.grey[500],
              onTap: (index) {
                controller.selectedIndex = index;
                controller.update();
              },
              items: const [
                BottomNavigationBarItem(
                  label: "Home",
                  icon: Icon(
                    Icons.home,
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Order",
                  icon: Icon(
                    Icons.list,
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Favorite",
                  icon: Icon(
                    Icons.favorite,
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Me",
                  icon: Icon(
                    Icons.person,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
