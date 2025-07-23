import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/main_navigation_controller.dart';
import '../controllers/home_controller.dart';
import '../widgets/bottom_navigation_widget.dart';
import 'home_page.dart';
import 'catalog_page.dart';
import 'profile_page.dart';

class MainNavigationPage extends StatelessWidget {
  const MainNavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final MainNavigationController controller = Get.put(MainNavigationController());
    Get.put(HomeController());

    final List<Widget> pages = [
      const HomePage(),
      const CatalogPage(),
      const ProfilePage(),
      //const MorePage(),
    ];

    return Scaffold(
      body: Obx(() => IndexedStack(
        index: controller.selectedIndex.value,
        children: pages,
      )),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}