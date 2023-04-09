import 'package:flutter/material.dart';
import 'package:ovqatlar_menu/screens/add_product.dart';
import 'package:ovqatlar_menu/widgets/my_drawer.dart';

import '../models/meal_model.dart';

class ProductScreen extends StatelessWidget {
  final List<Meal> meals;
  final Function delete;

  const ProductScreen({
    required this.meals,
    Key? key, required this.delete,
  }) : super(key: key);

  static const routeName = "product-screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text("Mahsulotlar "),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, AddProductScreen.routeName);
          }, icon: Icon(Icons.add))

        ],
      ),
      body: ListView.builder(itemCount: meals.length, itemBuilder: (BuildContext context, int index) {
        return
        ListTile(
          leading:
             CircleAvatar(backgroundImage: AssetImage(meals[index].imageUrls[0], ) ,),
          title: Text(meals[index].title),
          trailing: IconButton(
            onPressed: (){delete(meals[index].id);},
            icon: Icon(Icons.delete),
          ),
        );
      }),
    );
  }
}
