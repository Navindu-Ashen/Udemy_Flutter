import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_6_meals_app_riverpod/data/dumy_data.dart';

final mealsProvider = Provider((ref) {
  return dummyMeals;
});
