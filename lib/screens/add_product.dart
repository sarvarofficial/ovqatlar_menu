import 'package:flutter/material.dart';
import 'package:ovqatlar_menu/models/meal_model.dart';
import 'package:ovqatlar_menu/widgets/custom_image_input.dart';

import '../models/category_model.dart';

class AddProductScreen extends StatefulWidget {
  final List<Category> categories;
  final Function addMeal;

  AddProductScreen({Key? key, required this.categories, required this.addMeal})
      : super(key: key);
  static const routeName = "ad-product-screen";

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  String? categoryId;

  final titleController = TextEditingController();
  final ingredientController = TextEditingController();
  final descController = TextEditingController();
  final priceController = TextEditingController();
  final prepController = TextEditingController();
  final firstImageController = TextEditingController();
  final secondImageController = TextEditingController();
  final thirdImageController = TextEditingController();

  void save() {
    final title = titleController.text;
    final ingred = ingredientController.text;

    final desc = descController.text;
    final cost = priceController.text;
    final prep = prepController.text;
    final first = firstImageController.text;
    final second = secondImageController.text;
    final third = thirdImageController.text;
    if (title.isEmpty ||
        ingred.isEmpty ||
        desc.isEmpty ||
        cost.isEmpty ||
        prep.isEmpty ||
        first.isEmpty ||
        second.isEmpty ||
        third.isEmpty) {
      return;
    }

    final List<String> ingreds = ingred.split(",");
    final List<String> imageUrls = [first, second, third];

    widget.addMeal(Meal(
        title: title,
        imageUrls: imageUrls,
        id: UniqueKey().toString(),
        cost: int.parse(cost),
        description: desc,
        prepairingTime: prep,
        categoryId: categoryId!,
        ingredient: ingreds));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                save();
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              DropdownButton(
                items: widget.categories
                    .map((category) => DropdownMenuItem(
                          child: Text(category.title),
                          value: category.id,
                        ))
                    .toList(),
                value: categoryId,
                onChanged: (id) {
                  setState(() {
                    categoryId = id as String;
                  });
                },
                isExpanded: true,
              ),
              TextField(
                controller: titleController,
                decoration:
                    InputDecoration(labelText: "Mahsulot nomini kiriting:"),
                textInputAction: TextInputAction.next,
              ),
              TextField(
                controller: ingredientController,
                decoration:
                    InputDecoration(labelText: "Mahsulot tarkibini kiriting:"),
                textInputAction: TextInputAction.next,
              ),
              TextField(
                controller: descController,
                decoration:
                    InputDecoration(labelText: " Mahsulotga tarif bering:"),
                textInputAction: TextInputAction.next,
              ),
              TextField(
                controller: priceController,
                decoration: InputDecoration(
                  labelText: "Mahsulot narxini kiriting:",
                ),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
              ),
              TextField(
                controller: prepController,
                keyboardType: TextInputType.number,
                decoration:
                    InputDecoration(labelText: "Kerakli vaqtini kiriting:"),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomImageInput(
                imageController: firstImageController,
                label: '  birinchi rasmni kiritng:',
              ),
              CustomImageInput(
                  imageController: secondImageController,
                  label: '  ikkinchi rasmni kiritng:'),
              CustomImageInput(
                  imageController: thirdImageController,
                  label: '  uchinchi rasmni kiritng:')
            ],
          ),
        ),
      ),
    );
  }
}
