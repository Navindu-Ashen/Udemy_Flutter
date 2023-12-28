import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_6_meals_app_riverpod/models/meal.dart';

class FavoriteMealsNotifire extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifire() : super([]);

  bool toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorit = state.contains(meal);

    if (mealIsFavorit) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifire, List<Meal>>((ref) {
  return FavoriteMealsNotifire();
});
