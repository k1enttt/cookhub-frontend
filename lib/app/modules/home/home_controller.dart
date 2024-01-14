import 'package:cookhub_frontend/app/modules/account/screens/profile_screen.dart';
import 'package:cookhub_frontend/app/modules/add_recipe/screen/add_recipe_screen.dart';
import 'package:cookhub_frontend/app/modules/explore/screens/explore_screen.dart';
import 'package:cookhub_frontend/app/modules/grocery_lists/screens/grocery_screen.dart';
import 'package:cookhub_frontend/app/modules/home/screens/home_page.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // Implement HomeController
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    HomePage(),
    const ExploreScreen(),
    const AddRecipeScreen(),
    const GroceryScreen(),
    const ProfileScreen(),
  ];
}
