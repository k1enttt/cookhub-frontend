import 'package:cookhub_frontend/app/data/data.dart';
import 'package:cookhub_frontend/app/data/models/comment.dart';
import 'package:cookhub_frontend/app/data/models/ingredient.dart';
import 'package:cookhub_frontend/app/data/models/recipe_step.dart';
import 'package:cookhub_frontend/app/data/models/tag.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class RecipesController extends GetxController {
  // Controllers
  TextEditingController commentController = TextEditingController();

  // Bước thực hiện
  List<RecipeStep> steps = [
    RecipeStep(
      text:
          'Place the bones and beef chuck in large stockpot and add water to cover. Bring to a boil and boil for 5 minutes. Drain in a colander and thoroughly clean the stockpot. This process removes any impurities/scum and will give you a much cleaner broth.',
    ),
    RecipeStep(
      text:
          'Meanwhile, char your ginger and onions. Use tongs to hold the ginger and onions (one at a time) over an open flame, or place each directly on a gas burner. Turn until they’re lightly blackened and fragrant, about 5 minutes. Rinse away all the blackened skins.',
    ),
    RecipeStep(
      text:
          'Add water (5 quarts/4.75 L, or more/less if you\'ve scaled the recipe up or down) to the stockpot and bring to a boil. Transfer the bones and meat back to the pot, along with the charred/cleaned ginger and onions. Add the scallions, fish sauce and sugar. Reduce the heat to low, and simmer until the beef chuck is tender, about 40 minutes. Skim the surface often to remove any foam and fat.',
      images: ['assets/steps_3_imgs_1.png'],
    ),
    RecipeStep(
      text:
          'Remove one piece of the chuck and transfer to a bowl of ice water to stop the cooking process. Then transfer this piece of beef to a container and refrigerate (you will slice this to serve with your pho later. If you were to leave it in the pot, it would be too dry to eat). Leave the other piece of chuck in the pot to flavor the broth.',
    ),
    RecipeStep(
      text:
          'Remove one piece of the chuck and transfer to a bowl of ice water to stop the cooking process. Then transfer this piece of beef to a container and refrigerate (you will slice this to serve with your pho later. If you were to leave it in the pot, it would be too dry to eat). Leave the other piece of chuck in the pot to flavor the broth.',
      images: const [
        'assets/steps_5_imgs_1.png',
        'assets/steps_5_imgs_2.png',
        'assets/steps_5_imgs_3.png',
      ],
    ),
  ];

  // Bình luận
  List<Comment> comments = [
    Comment(
      id: 1,
      userName: 'Tien Da',
      userAvt: 'assets/user_avt.png',
      rate: 4,
      body:
          'Made the authentic pho recipe and it was amazing! After roasting I put in the the pressure cooker for 60 min, and it was amazing! The closest I’ve ever tasted to what we had in Vietnam. Thanks for a great recipe',
    ),
    Comment(
      id: 2,
      userName: 'Tien Da',
      userAvt: 'assets/user_avt.png',
      rate: 2,
      body:
          'Made the authentic pho recipe and it was amazing! After roasting I put in the the pressure cooker for 60 min, and it was amazing! The closest I’ve ever tasted to what we had in Vietnam. Thanks for a great recipe',
    ),
  ];

  // Thành phần
  RxList<Ingredient> ingredientsList = MyData.ingredients.obs;

  // Thẻ tag
  List<Tag> tags = [
    Tag(id: 0, name: 'Vietnamese'),
    Tag(id: 1, name: 'Main dish'),
  ];

  // Step view là true, ingredient view là false
  RxBool isStepsViewOrIngredientView = true.obs;

  // Số lượng món ăn không thể < 0
  RxInt dishQuantity = 1.obs;
}
