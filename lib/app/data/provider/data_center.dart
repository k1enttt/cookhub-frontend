import 'package:cookhub_frontend/app/data/models/home_recipe.dart';
import 'package:get/get.dart';

class DataCenter extends GetxController {
  static final DataCenter instance = DataCenter._internal();

  factory DataCenter() {
    return instance;
  }

  DataCenter._internal();

  RxList<HomeModel> homeRecipes = <HomeModel>[].obs;
}
