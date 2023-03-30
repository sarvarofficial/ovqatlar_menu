import 'package:flutter/material.dart';

import '../models/category_model.dart';
import '../models/meal_model.dart';
import '../widgets/category_meal_screen.dart';

class HomePage extends StatelessWidget {
  final List<Category> categories;
  final List<Meal> meals;

  HomePage({
    Key? key,
    required this.categories,
    required this.meals,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ovqatlar menyusi"),
      ),
      body: Container(
        child: GridView(
            padding: EdgeInsets.all(16),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 3 / 2,
            ),
            children: categories.map(
              (category) {
                final categoryMeals = meals
                    .where((meal) => meal.categoryId == category.id)
                    .toList();
                return CategoryMealScreen(
                  categories: category,
                  categoryMeals: categoryMeals,
                );
              },
            ).toList()),
      ),
    );
  }
}
