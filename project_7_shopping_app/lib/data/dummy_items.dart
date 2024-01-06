import 'package:project_7_shopping_app/models/category.dart';
import 'package:project_7_shopping_app/models/grocery_item.dart';
import 'package:project_7_shopping_app/data/categories.dart';

final groceryItems = [
  GroceryItem(
      id: 'a',
      rollNumber: "asd123",
      name: 'Milk',
      quantity: 1,
      category: categories[Categories.dairy]!),
    
  GroceryItem(
      id: 'b',
      name: 'Bananas',
      rollNumber: "asd234",
      quantity: 5,
      category: categories[Categories.fruit]!),
  GroceryItem(
      id: 'c',
      name: 'Beef Steak',
      rollNumber: "asd345",
      quantity: 1,
      category: categories[Categories.meat]!),
];