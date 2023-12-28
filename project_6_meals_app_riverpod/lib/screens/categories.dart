import 'package:flutter/material.dart';
import 'package:project_6_meals_app_riverpod/data/dumy_data.dart';
import 'package:project_6_meals_app_riverpod/models/meal.dart';
import 'package:project_6_meals_app_riverpod/screens/meals.dart';
import 'package:project_6_meals_app_riverpod/widgets/category_grid_item.dart';
import 'package:project_6_meals_app_riverpod/models/category.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
    required this.onToggleFavourit,
    required this.availableMeals,
  });

  final void Function(Meal meal) onToggleFavourit;
  final List<Meal> availableMeals;

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
          onToggleFavourit: onToggleFavourit,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectCategory: () {
              _selectCategory(context, category);
            },
          )
      ],
    );
  }
}
