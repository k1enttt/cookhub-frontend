import 'package:cookhub_frontend/app/data/models/home_recipe.dart';
import 'package:cookhub_frontend/core/constants/constants.dart';
import 'package:http/http.dart' as http;

class Api {
  static var client = http.Client();

  static Future<List?> fetchHomeRecipe(String endpoint) async {
    String urlHomeRecipe = '$SERVER_URL/$endpoint';
    var response = await client.get(Uri.parse(urlHomeRecipe));

    if (response.statusCode == 200) {
      return recipesFromMap(response.body);
    } else {
      return null;
    }
  }
}
