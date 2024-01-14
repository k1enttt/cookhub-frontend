import 'package:cookhub_frontend/app/modules/home/controllers/recipe_home_controller.dart';
import 'package:cookhub_frontend/app/modules/home/home_controller.dart';
import 'package:cookhub_frontend/core/constants/colors.dart';
import 'package:cookhub_frontend/core/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu(this.recipeHomeController, {super.key});

  final RecipeHomeController recipeHomeController;

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          elevation: 0,
          enableFeedback: false,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: ColorSelect.primaryColor,
          selectedFontSize: TSizes.heading_12,
          unselectedItemColor: ColorSelect.gray_200,
          showUnselectedLabels: true,
          currentIndex: controller.selectedIndex.value,
          onTap: (index) => controller.selectedIndex.value = index,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
              ),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle_outline_rounded,
              ),
              label: 'Recipe',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.playlist_add_check_outlined,
              ),
              label: 'Grocery',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.manage_accounts_outlined,
              ),
              label: 'Account',
            ),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}
