import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ovqatlar_menu/models/meal_model.dart';

class MealDetails extends StatefulWidget {
  const MealDetails({
    Key? key,
  }) : super(key: key);
  static var routeName = "/meal-details";

  @override
  State<MealDetails> createState() => _MealDetailsState();
}
int activeImageIndex=0;

class _MealDetailsState extends State<MealDetails> {
  @override
  Widget build(BuildContext context) {
    final meals = ModalRoute.of(context)!.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Text(meals.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CarouselSlider(
              options: CarouselOptions(height: 250.0,viewportFraction: 1,
              onPageChanged:(index,reason){
                setState(() {
                  activeImageIndex=index;
                });
              },
                initialPage: activeImageIndex,

              ),
              items: meals.imageUrls.map((image) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(

                        ),
                        child: Image.asset(image,fit: BoxFit.cover,width: double.infinity,)
                    );
                  },
                );
              }).toList(),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: meals.imageUrls.map((image) {
                final imageIndex=meals.imageUrls.indexOf(image);
                return Container(
                
                margin: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                    color:activeImageIndex==imageIndex? Colors.black:Colors.grey,
                    shape: BoxShape.circle),
              );}).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("\$${meals.cost}")],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tarif",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(meals.description)
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 250,
              child: Card(
                margin: EdgeInsets.all(15),
                child: ListView.separated(
                  itemBuilder: (context, int index) {
                    return Text(meals.ingredient[index]);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(

                      height: 20,
                    );
                  },
                  itemCount: meals.ingredient.length,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
