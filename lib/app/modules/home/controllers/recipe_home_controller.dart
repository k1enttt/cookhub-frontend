import 'package:cookhub_frontend/app/data/models/home_recipe.dart';
import 'package:cookhub_frontend/app/data/services/api.dart';
import 'package:cookhub_frontend/core/constants/constants.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class RecipeHomeController extends GetxController {
  var isLoading = true.obs;
  final postList = <HomeModel>[].obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  Future fetchData() async {
    try {
      isLoading(true);
      var homeRecipes =
          await Api.fetchHomeRecipe('api/v1/recipes/get-all-recipes');

      if (homeRecipes != null) {
        postList.value = homeRecipes as List<HomeModel>;
        print('Controller: ' + postList.value.length.toString());
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading(false);
    }
  }
}
