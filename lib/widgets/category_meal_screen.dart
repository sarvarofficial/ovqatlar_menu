import 'package:flutter/material.dart';

import '../models/category_model.dart';
import '../models/meal_model.dart';
import '../screens/category_screen.dart';
class CategoryMealScreen extends StatelessWidget {
  final Category categories ;
  final List<Meal> categoryMeals;
   CategoryMealScreen({Key? key,required this.categories, required this.categoryMeals}) : super(key: key);

   void gotoCategoryScreen(BuildContext context){
     Navigator.of(context).pushNamed(CategoryScreen.routName ,arguments:{
       "categoryTitle": categories.title,
       "categoryMeals": categoryMeals
     });
   }

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: (){
        gotoCategoryScreen(context);
      },
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),

        child: Stack(
          children: [
            Image.asset(categories.imageUrl,fit: BoxFit.cover,height: double.infinity,),
            Container(

            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(categories.title,style: TextStyle(color: Colors.white,fontSize: 20),),
            )
          ],
        ),
      ),
    );
  }
}
