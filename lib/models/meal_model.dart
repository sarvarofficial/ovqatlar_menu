class Meal {
  final String id;
  final String title;
  final String description;
  final List<String> imageUrls;
  final String prepairingTime;
  final int cost;
  final String categoryId;
  final List ingredient;

  Meal({
    required this.title,
    required this.imageUrls,
    required this.id,
    required this.cost,
    required this.description,
    required this.prepairingTime,
    required this.categoryId,
    required this.ingredient,
  });
}

class Meals {
  List<Meal> _list = [
    Meal(
      title: "Burger",
      imageUrls: ["assets/images/burger.jpg","assets/images/burger1.jpg","assets/images/burger2.jpg",],
      id: "m1",
      cost: 1,
      description: "Ajoyib burger",
      prepairingTime: "5 min",
      categoryId: 'c1',
      ingredient: ["go'sht", "bodring", "pomidor"],
    ),
    Meal(
      title: "Polov",
      imageUrls: ["assets/images/polov.jpg","assets/images/polov1.jpg","assets/images/polov2.jpg",],
      id: "m2",
      cost: 1,
      description: "Ajoyib polov",
      prepairingTime: "5 min",
      categoryId: 'c2',
      ingredient: ["guruch ", "yog'", "sabzi"],
    ),
    Meal(
      title: "Pizza",
      imageUrls: ["assets/images/pizza.jpg","assets/images/pizza1.jpg","assets/images/pizza2.jpg",],
      id: "m3",
      cost: 1,
      description: "Ajoyib pizza",
      prepairingTime: "5 min",
      categoryId: 'c3',
      ingredient: ["un", "pomidor", "pishloq"],
    ),
    Meal(
      title: "Burger",
      imageUrls: ["assets/images/burger.jpg","assets/images/burger1.jpg","assets/images/burger2.jpg",],
      id: "m4",
      cost: 1,
      description: "Ajoyib burger",
      prepairingTime: "5 min",
      categoryId: 'c4',
      ingredient: ["un", "pomidor", "pishloq"],
    ),
    Meal(
      title: "Coca cola",
      imageUrls: ["assets/images/cola.png","assets/images/cola1.jpg","assets/images/cola2.jpg",],
      id: "m5",
      cost: 1,
      description: "Ajoyib burger",
      prepairingTime: "5 min",
      categoryId: 'c5',
      ingredient: ["un", "pomidor", "pishloq"],
    ),
    Meal(
      title: "Salad",
      imageUrls: ["assets/images/salad.png","assets/images/salad.png","assets/images/salad.png",],
      id: "m5",
      cost: 1,
      description: "Ajoyib burger",
      prepairingTime: "5 min",
      categoryId: 'c6',
      ingredient: ["un", "pomidor", "pishloq"],
    ),
  ];

  List<Meal> get list {
    return _list;
  }

  List<Meal> _fovorites=[];
  
  List<Meal> get favorites{
    return _fovorites;
  }
  
  void toggleLike(String mealId){
    final mealIndex=_fovorites.indexWhere((meal) => meal.id==mealId);
    if(mealIndex<0){
      favorites.add(list.firstWhere((meal) => meal.id==mealId));
    }
    else{
      favorites.removeWhere((meal) => meal.id==mealId );
    }
    
  }

 void addMeal(Meal meal){
    _list.add(meal);
  }
   void delete(String mealId){
    _list.removeWhere((meal) => mealId==meal.id);
   }

}
