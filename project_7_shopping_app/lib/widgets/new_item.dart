import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_7_shopping_app/data/categories.dart';
import 'package:project_7_shopping_app/data/dummy_items.dart';
import 'package:project_7_shopping_app/models/category.dart';
import 'package:project_7_shopping_app/models/grocery_item.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  final _formKey = GlobalKey<FormState>();
  var _enteredName = "";
  var _enteredQuantity = 1;

  var _selectedCategory = categories[Categories.vegetables]!;
  var isSending = false;

  void _saveItem() async {
    var _rollNumber = uuid.v4();
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        isSending = true;
      });
      final url = Uri.https(
        "flutter-test1-52276-default-rtdb.firebaseio.com",
        "shopping-app.json",
      );
      final responce = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode(
          {
            "name": _enteredName,
            "quantity": _enteredQuantity,
            "category": _selectedCategory.title,
            "rollnum": _rollNumber,
          },
        ),
      );

      final url2 = Uri.https(
        "flutter-test1-52276-default-rtdb.firebaseio.com",
        "shopping-app-copy.json",
      );
      final responce2 = await http.post(
        url2,
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode(
          {
            "name": _enteredName,
            "quantity": _enteredQuantity,
            "category": _selectedCategory.title,
            "rollnum": _rollNumber,
          },
        ),
      );

      final Map<String, dynamic> resData2 = json.decode(responce2.body);

      print(responce.statusCode);
      final Map<String, dynamic> resData = json.decode(responce.body);

      if (!context.mounted) {
        return;
      }

      print(resData["name"]);

      Navigator.of(context).pop(
        GroceryItem(
          id: resData["name"],
          rollNumber: _rollNumber,
          name: _enteredName,
          quantity: _enteredQuantity,
          category: _selectedCategory,
        ),
      );
    }
  }

  void _resetItem() {
    _formKey.currentState!.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a new item"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text("Name"),
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length <= 1 ||
                      value.trim().length > 50) {
                    return "Must be between 1 and 50 characters";
                  }
                  return null;
                },
                onSaved: (value) {
                  _enteredName = value!;
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        label: Text("Quantity"),
                      ),
                      initialValue: _enteredQuantity.toString(),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            int.tryParse(value) == null ||
                            int.tryParse(value)! <= 0) {
                          return "Must be a valid, positive number";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _enteredQuantity = int.parse(value!);
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: DropdownButtonFormField(
                      value: _selectedCategory,
                      items: [
                        for (final category in categories.entries)
                          DropdownMenuItem(
                            value: category.value,
                            child: Row(
                              children: [
                                Container(
                                  width: 16,
                                  height: 16,
                                  color: category.value.color,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(category.value.title),
                              ],
                            ),
                          )
                      ],
                      onChanged: (value) {
                        setState(() {
                          _selectedCategory = value!;
                        });
                      },
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: isSending ? null : _resetItem,
                    child: const Text("Reset"),
                  ),
                  ElevatedButton(
                    onPressed: isSending ? null : _saveItem,
                    child: isSending
                        ? const SizedBox(
                            height: 16,
                            width: 16,
                            child: CircularProgressIndicator(),
                          )
                        : const Text("Add Item"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
