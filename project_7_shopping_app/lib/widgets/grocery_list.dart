import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_7_shopping_app/data/categories.dart';
import 'package:project_7_shopping_app/models/grocery_item.dart';
import 'package:project_7_shopping_app/widgets/new_item.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  List<GroceryItem> _groceryItems = [];
  var isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  void _loadItems() async {
    final url = Uri.https(
      "flutter-test1-52276-default-rtdb.firebaseio.com",
      "shopping-app.json",
    );
    try {
      final response = await http.get(url);
      // print(response.statusCode);
      if (response.statusCode >= 400) {
        setState(() {
          _error = "Failed to fetch data. Please try again later.";
        });
      }

      // print(response.body);

      if (response.body == "null") {
        setState(() {
          isLoading = false;
        });
        return;
      }

      final Map<String, dynamic> listData = json.decode(response.body);

      final List<GroceryItem> loadedItems = [];
      for (final item in listData.entries) {
        final category = categories.entries
            .firstWhere(
              (catItem) => catItem.value.title == item.value["category"],
            )
            .value;
        loadedItems.add(
          GroceryItem(
            id: item.key,
            rollNumber: uuid.v4(),
            name: item.value["name"],
            quantity: item.value["quantity"],
            category: category,
          ),
        );
      }
      setState(() {
        _groceryItems = loadedItems;
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        _error =
            "Somthing went wrong.\nPlease Check your internet connection and try again.";
      });
    }
  }

  void _addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (ctx) => const NewItem(),
      ),
    );

    if (newItem == null) {
      return;
    }

    setState(() {
      _groceryItems.add(newItem);
    });
  }

  void _removeItem(GroceryItem item) async {
    final itemIndex = _groceryItems.indexOf(item);
    setState(() {
      _groceryItems.remove(item);
    });

    print(item.id);

    final url = Uri.https(
      "flutter-test1-52276-default-rtdb.firebaseio.com",
      "shopping-app/${item.id}.json",
    );

    final responce = await http.delete(url);

    if (responce.statusCode >= 400) {
      setState(() {
        _groceryItems.insert(itemIndex, item);
      });
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).clearSnackBars();
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Failed to remove item. Try again later.",
            style: TextStyle(
                color: Colors.red, fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
      );
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).clearSnackBars();
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 3),
          content: Text(
            "Item Removed.",
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 14,
            ),
          ),
        ),
      );
    }

    // ScaffoldMessenger.of(context).clearSnackBars();
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     content: const Text("Item Removed!"),
    //     action: SnackBarAction(
    //       label: "Undo",
    //       onPressed: () {
    //         setState(() {
    //           _groceryItems.insert(itemIndex, item);
    //         });
    //       },
    //     ),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text("Not available items!"),
    );

    if (isLoading) {
      content = const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_groceryItems.isNotEmpty) {
      content = ListView.builder(
        itemCount: _groceryItems.length,
        itemBuilder: (ctx, index) => Dismissible(
          key: ValueKey(_groceryItems[index].id),
          onDismissed: (direction) {
            _removeItem(_groceryItems[index]);
          },
          background: Container(
            color: Color.fromARGB(155, 255, 91, 79),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.delete,
                  color: Color.fromARGB(255, 255, 255, 255),
                  size: 40,
                ),
              ],
            ),
          ),
          child: ListTile(
            title: Text(_groceryItems[index].name),
            leading: Container(
              width: 24,
              height: 24,
              color: _groceryItems[index].category.color,
            ),
            trailing: Text(
              _groceryItems[index].quantity.toString(),
            ),
          ),
        ),
      );
    }

    if (_error != null) {
      content = Center(
        child: Text(
          _error!,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Your Groceries",
        ),
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: content,
    );
  }
}
