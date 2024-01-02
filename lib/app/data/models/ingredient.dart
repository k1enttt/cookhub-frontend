class Ingredient extends Object {
  int id;
  String name;
  String quantity;
  String unit;
  bool isDone;
  Ingredient(
      {required this.id,
      required this.name,
      this.quantity = '',
      this.unit = '',
      this.isDone = false});
}
