import 'package:flutter/material.dart';
import 'package:ovqatlar_menu/models/meal_model.dart';
import 'package:ovqatlar_menu/screens/add_product.dart';
import 'package:ovqatlar_menu/screens/category_screen.dart';
import 'package:ovqatlar_menu/screens/home_page.dart';
import 'package:ovqatlar_menu/screens/meal_deatails.dart';
import 'package:ovqatlar_menu/screens/products.dart';
import 'package:ovqatlar_menu/screens/tabs_screen.dart';

import 'models/category_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _categories = Categories();

  final _mealsModel = Meals();

  void toggleLike(String mealId) {
    setState(() {
      _mealsModel.toggleLike(mealId);
    });
  }
  addMeal(Meal meal){
    setState(() {
      _mealsModel.addMeal(meal);
    });
  }
  void delete(String mealId){
    setState(() {
      _mealsModel.delete(mealId);
    });
  }

  bool isFavorite(String mealId) {
    return _mealsModel.favorites.any((meal) => meal.id == mealId);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.amber),
      // home: HomePage(categories:_categories.list, meals: _meals.list, ),
      initialRoute: TabsScreen.routeName,
      routes: {
        TabsScreen.routeName: (context) => TabsScreen(
              categories: _categories.list,
              meals: _mealsModel,
              toggleLike: toggleLike,
              isFavorite: isFavorite,
            ),
        CategoryScreen.routeName: (context) => CategoryScreen(
              toggleLike: toggleLike,
              isFavorite: isFavorite,
            ),
        MealDetails.routeName: (context) => MealDetails(),
        ProductScreen.routeName:(context) =>ProductScreen(meals:_mealsModel.list,delete:delete),
        AddProductScreen.routeName:(context)=>AddProductScreen(categories:_categories.list,addMeal:addMeal),
      },
    );
  }
}
