import 'package:get/get.dart';
import 'package:cookhub_frontend/app/modules/explore/screens/filter_screen.dart';

class ExploreController extends GetxController {
  // Implement ExploreController
  final Rx<int> selectedIndex = 0.obs;
  final filterScreen = const FilterScreen();
}
