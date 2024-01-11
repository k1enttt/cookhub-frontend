import 'package:cookhub_frontend/app/modules/beginning/model/beginning_model.dart';
import 'package:cookhub_frontend/core/constants/image_strings.dart';

const beginningData = BeginningModel(
  allergiesList: [
    {"tag": "milk"},
    {"tag": "eggs"},
    {"tag": "wheat"},
    {"tag": "soy"},
    {"tag": "gluten"},
    {"tag": "peanuts"},
    {"tag": "tree nuts"},
    {"tag": "fish"},
    {"tag": "shellfish"},
    {"tag": "sesame"},
    {"tag": "mustard"},
    {"tag": "sulfites"},
    {"tag": "celery"},
  ],
  dietariesList: [
    {
      "tag": "vegetarian",
      "imageSrc": TImages.vegetarianImage,
    },
    {
      "tag": "vegan",
      "imageSrc": TImages.veganImage,
    },
    {
      "tag": "I eat everything",
      "imageSrc": TImages.everythingImage,
    },
  ],
  ingredientsList: [
    {
      "tag": "egg",
      "imageSrc": TImages.eggImage,
    },
    {
      "tag": "tomato",
      "imageSrc": TImages.tomatoImage,
    },
    {
      "tag": "beef",
      "imageSrc": TImages.beefImage,
    },
    {
      "tag": "chicken",
      "imageSrc": TImages.chickenImage,
    },
    {
      "tag": "mushroom",
      "imageSrc": TImages.mushroomImage,
    },
    {
      "tag": "noodle",
      "imageSrc": TImages.noodleImage,
    },
    {
      "tag": "pork",
      "imageSrc": TImages.porkImage,
    },
    {
      "tag": "avocado",
      "imageSrc": TImages.avocadoImage,
    },
    {
      "tag": "broccoli",
      "imageSrc": TImages.broccoliImage,
    },
  ],
);
