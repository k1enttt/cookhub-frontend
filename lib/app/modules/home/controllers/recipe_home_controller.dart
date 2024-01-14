import 'package:cookhub_frontend/app/data/models/home_recipe.dart';
import 'package:cookhub_frontend/app/data/services/api.dart';
import 'package:get/get.dart';

class RecipeHomeController extends GetxController {
  RxBool isLoading = true.obs;
  final postList = <HomeModel>[].obs;

  @override
  void onInit() {
    fetchAllData();
    super.onInit();
  }

  Future fetchAllData() async {
    try {
      isLoading(true);
      var homeRecipes =
          await Api.fetchHomeRecipe('api/v1/recipes/get-all-recipes');

      if (homeRecipes != null) {
        postList.value = homeRecipes as List<HomeModel>;
        print('Controller: ' + postList.length.toString());
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading(false);
    }
  }

}
