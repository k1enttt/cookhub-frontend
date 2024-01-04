import 'package:cookhub_frontend/app/data/models/recipe.dart';

class DateModel {
  String alias;
  DateTime date;
  List<Recipe> recipes;
  bool isSelected;
  DateModel({
    required this.alias,
    required this.date,
    required this.recipes,
    required this.isSelected,
  });
}

class Date {
  String alias;
  String day;

  bool isSelected;
  Date({
    required this.alias,
    required this.day,
    required this.isSelected,
  });
}
