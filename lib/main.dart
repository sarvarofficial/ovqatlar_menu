import 'package:flutter/material.dart';
import 'package:ovqatlar_menu/models/meal_model.dart';
import 'package:ovqatlar_menu/screens/category_screen.dart';
import 'package:ovqatlar_menu/screens/home_page.dart';
import 'package:ovqatlar_menu/screens/meal_deatails.dart';

import 'models/category_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

   MyApp({super.key});
  final _categories=Categories();
  final _meals=Meals();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber
      ),
      home: HomePage(categories:_categories.list, meals: _meals.list, ),

      routes: {
        CategoryScreen.routName: (context)=>CategoryScreen(),
        MealDetails.routeName: (context)=> MealDetails()
      },

    );
  }

}
