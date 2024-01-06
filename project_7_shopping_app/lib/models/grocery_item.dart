import 'package:project_7_shopping_app/models/category.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class GroceryItem {
  GroceryItem({
    required this.id,
    required this.name,
    required this.quantity,
    required this.category,
    required this.rollNumber,
  });
  final String id;
  final String rollNumber;
  final String name;
  final int quantity;
  final Category category;
}
