import 'package:flutter/material.dart';
import 'package:ovqatlar_menu/widgets/meal_item.dart';

import '../models/meal_model.dart';

class FavoriteScreen extends StatefulWidget {
  final List<Meal> favorites;
  final Function isFavorite;
  final Function toggleLike;
  final List<Meal>  meals;

  const FavoriteScreen(
      {Key? key, required this.favorites, required this.isFavorite, required this.toggleLike, required this.meals})
      : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();


}

class _FavoriteScreenState extends State<FavoriteScreen> {
  void _toggleLike(String mealId){
    setState(() {
      widget.toggleLike(mealId);
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Sevimli oyqat o'chirildi"),
    action: SnackBarAction(
      label: "BEKOR QILISH",
      onPressed: (){
        setState(() {
          widget.toggleLike(mealId);
        });
      },
    ),
    ));
  }
  @override
  Widget build(BuildContext context) {
    return widget.favorites.length
    >0 ? ListView.builder(itemCount: widget.favorites.length,itemBuilder: (context,index)=>MealItem(meals: widget.favorites[index], toggleLike: _toggleLike, isFavorite: widget.isFavorite)):Center(child: Text("Sevimli ovqatlar mavjud emas"),);
  }
}
