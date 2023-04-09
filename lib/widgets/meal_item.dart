import 'package:flutter/material.dart';
import 'package:ovqatlar_menu/screens/meal_deatails.dart';

import '../models/meal_model.dart';

class MealItem extends StatelessWidget {
  final Meal meals;
  final Function toggleLike;
  final Function isFavorite;

  void goToMealDetails(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetails.routeName, arguments: meals);
  }

  MealItem({
    Key? key,
    required this.meals,
    required this.toggleLike,
    required this.isFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => goToMealDetails(context),
      child: Card(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                      height: 250,
                      child: meals.imageUrls[0].startsWith("assets/")
                          ? Image.asset(
                              meals.imageUrls[0],
                              fit: BoxFit.cover,
                              width: double.infinity,
                            )
                          : Image.network(
                              meals.imageUrls[0],
                              fit: BoxFit.cover,
                              width: double.infinity,
                            )),
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
                      onPressed: () {
                        toggleLike(meals.id);
                      },
                      icon: Icon(
                        isFavorite(meals.id)
                            ? Icons.favorite
                            : Icons.favorite_outline,
                        size: 22,
                      )),
                  Text(meals.prepairingTime.toString()),
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
