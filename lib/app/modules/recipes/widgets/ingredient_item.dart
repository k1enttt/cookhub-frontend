import 'package:cookhub_frontend/app/data/models/ingredient.dart';
import 'package:flutter/material.dart';

class IngredientItem extends StatelessWidget {
  const IngredientItem(
      {super.key, required this.ingredients, required this.index});
  final List<Ingredient> ingredients;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Checkbox + Tên thành phần
        SizedBox(
          child: Row(children: [
            SizedBox(
              width: 20,
              height: 20,
              child: Checkbox(
                value: false,
                onChanged: (value) {},
              ),
            ),
            Text(
              ingredients[index].name,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
          ]),
        ),
        // Số lượng
        Text(
          '${ingredients[index].quantity == '' ? '' : ingredients[index].quantity}${ingredients[index].unit == '' ? '' : ' ${ingredients[index].unit}'}',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
        ),
      ],
    );
  }
}
