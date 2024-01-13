import 'package:cookhub_frontend/app/modules/grocery_lists/grocery_controller.dart';
import 'package:get/get.dart';

class GroceryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GroceryController>(
      () => GroceryController(),
    );
  }
}
