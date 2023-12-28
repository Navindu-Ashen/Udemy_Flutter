import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:project_6_meals_app_riverpod/models/meal.dart';
import 'package:project_6_meals_app_riverpod/screens/categories.dart';
import 'package:project_6_meals_app_riverpod/screens/filters.dart';
import 'package:project_6_meals_app_riverpod/screens/meals.dart';
import 'package:project_6_meals_app_riverpod/widgets/main_drawer.dart';
import 'package:project_6_meals_app_riverpod/providers/meals_provider.dart';
import 'package:project_6_meals_app_riverpod/providers/favorities_provider.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactosFree: false,
  Filter.vegitarien: false,
  Filter.vegen: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;
  Map<Filter, bool> _selectedFilters = kInitialFilters;

  void selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == "filters") {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => FilterScreen(currentFilters: _selectedFilters),
        ),
      );

      setState(() {
        _selectedFilters = result ?? kInitialFilters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);
    final availableMeals = meals.where((meal) {
      if (_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[Filter.lactosFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilters[Filter.vegitarien]! && !meal.isVegetarian) {
        return false;
      }
      if (_selectedFilters[Filter.vegen]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
    Widget activePage = CategoriesScreen(
      availableMeals: availableMeals,
    );
    var activePageTitle = "Categories";

    if (_selectedPageIndex == 1) {
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      activePage = MealsScreen(
        meals: favoriteMeals,
      );
      activePageTitle = "Favourites";
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(onSelectScreen: setScreen),
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
