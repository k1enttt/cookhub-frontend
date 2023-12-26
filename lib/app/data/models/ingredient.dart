class Ingredient extends Object {
  String name;
  String quantity;
  String unit;
  bool isDone;
  Ingredient(
      {required this.name,
      this.quantity = '',
      this.unit = '',
      this.isDone = false});
}
