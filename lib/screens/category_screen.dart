import 'package:flutter/material.dart ';
import 'package:ovqatlar_menu/models/meal_model.dart';
import 'package:ovqatlar_menu/widgets/meal_item.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({
    Key? key,
  }) : super(key: key);
  static var routName = "/category-screen";

  @override
  Widget build(BuildContext context) {
    final categoryData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final title = categoryData["categoryTitle"];
    final meals = categoryData["categoryMeals"] as List<Meal>;

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
            itemCount: meals.length,
            itemBuilder: (context, int index) {
              return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: MealItem(
                    meals: meals[index],
                  ));
            }));
  }
}
