import 'package:flutter/material.dart';
import 'package:project_6_meals_app/models/meal.dart';
import 'package:project_6_meals_app/screens/categories.dart';
import 'package:project_6_meals_app/screens/meals.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favouritMeals = [];

  void _toggleMealFavouritStatus(Meal meal) {
    final isExcisting = _favouritMeals.contains(meal);

    if (isExcisting) {
      _favouritMeals.remove(meal);
    } else {
      _favouritMeals.add(meal);
    }
  }

  void selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(
      onToggleFavourit: _toggleMealFavouritStatus,
    );
    var activePageTitle = "Categories";

    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
        meals: [],
        onToggleFavourit: _toggleMealFavouritStatus,
      );
      activePageTitle = "Favourites";
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
          onTap: selectPage,
          currentIndex: _selectedPageIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.set_meal), label: "Categories"),
            BottomNavigationBarItem(
                icon: Icon(Icons.star), label: "Favourites"),
          ]),
    );
  }
}
