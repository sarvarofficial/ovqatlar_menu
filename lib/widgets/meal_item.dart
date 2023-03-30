import 'package:flutter/material.dart';
import 'package:ovqatlar_menu/screens/meal_deatails.dart';

import '../models/meal_model.dart';

class MealItem extends StatelessWidget {
  final Meal meals;


  void goToMealDetails(BuildContext context){
    Navigator.of(context).pushNamed(MealDetails.routeName,arguments:meals );
  }

  MealItem({Key? key, required this.meals}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>goToMealDetails(context),
      child: Card(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    meals.imageUrls[0],
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 100,
                      color: Colors.black.withOpacity(0.8),
                      child: Center(
                          child: Text(
                        meals.title,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        meals.isLike ? Icons.favorite : Icons.favorite_outline,
                        size: 22,
                      )),
                  Text(meals.prepairingTime),
                  Text("\$${meals.cost}"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
