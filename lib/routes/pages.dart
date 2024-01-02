import 'package:cookhub_frontend/app/modules/grocery_lists/screens/grocery_screen.dart';
import 'package:cookhub_frontend/app/modules/home/screens/home_screen.dart';
import 'package:cookhub_frontend/app/modules/recipes/screens/recipes_screen.dart';
import 'package:cookhub_frontend/routes/routes.dart';
import 'package:get/get.dart';

class AppPages {
  static List<GetPage> pages = [
    GetPage(name: AppRoutes.home, page: () => const HomeScreen()),
    GetPage(name: AppRoutes.recipes, page: () => const RecipesScreen()),
    GetPage(name: AppRoutes.grocery, page: () => const GroceryScreen()),
    // GetPage(
    //     name: AppRoutes.recipeDetail, page: () => RecipeDetailScreen()),
  ];
}
