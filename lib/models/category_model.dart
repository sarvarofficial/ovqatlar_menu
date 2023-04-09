class Category {
  final String id;
  final String title;
  final String imageUrl;

  Category({required this.id, required this.title, required this.imageUrl});
}

class Categories {
  List<Category> _list = [
    Category(
      id: "c1",
      title: "Fast food",
      imageUrl: "assets/images/burger.jpg",
    ),
    Category(
      id: "c2",
      title: "Milliy taomlar",
      imageUrl: "assets/images/polov.jpg",
    ),
    Category(
      id: "c3",
      title: "Italiya taomlari",
      imageUrl: "assets/images/pizza.jpg",
    ),
    Category(
      id: "c4",
      title: "Fransiya taomlari",
      imageUrl: "assets/images/pizza.jpg",
    ),
    Category(
      id: "c5",
      title: "Ichimliklar",
      imageUrl: "assets/images/cola.png",
    ),
    Category(
      id: "c6",
      title: "Saladlar",
      imageUrl: "assets/images/salad.png",
    ),
  ];

  List<Category> get list {
    return _list;
  }

}
