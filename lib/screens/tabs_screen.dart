import 'package:flutter/material.dart';
import 'package:ovqatlar_menu/screens/favorite_screen.dart';
import 'package:ovqatlar_menu/screens/home_page.dart';

import '../models/category_model.dart';
import '../models/meal_model.dart';
import '../widgets/my_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Category> categories;
  final Meals meals;
  final Function toggleLike;
  final Function isFavorite;

  TabsScreen(
      {Key? key,
      required this.categories,
      required this.meals,
      required this.toggleLike,
      required this.isFavorite})
      : super(key: key);

  static const routeName="/";
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, dynamic>> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages = [
      {
        "pages":
            HomePage(categories: widget.categories, meals: widget.meals.list),
        "title": "Ovqatlar menyusi"
      },
      {
        "pages": FavoriteScreen(
            favorites: widget.meals.favorites,
            isFavorite: widget.isFavorite,
            toggleLike: widget.toggleLike,
            meals: widget.meals.list),
        "title": "Favorite"
      }
    ];
  }

  var _currentIndex = 0;

  void changeTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_pages[_currentIndex]["title"]),
      ),
      body: _pages[_currentIndex]["pages"],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.amber,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        currentIndex: _currentIndex,
        onTap: changeTab,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite")
        ],
      ),
      drawer: MyDrawer(),
    );
  }
}
