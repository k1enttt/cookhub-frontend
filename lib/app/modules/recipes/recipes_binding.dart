import 'package:cookhub_frontend/app/modules/recipes/recipes_controller.dart';
import 'package:get/get.dart';

class RecipesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecipesController>(() => RecipesController());
  }
}
