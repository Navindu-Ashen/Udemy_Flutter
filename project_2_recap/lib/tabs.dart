import 'package:flutter/material.dart';
import 'package:project_2_recap/background.dart';
import 'package:project_2_recap/care_me/welcome_page.dart';
import 'package:project_2_recap/count_app/count_page.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectPageIndex = 0;

  void pageSelect(int index) {
    setState(() {
      _selectPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = Background();

    if (_selectPageIndex == 1) {
      activeScreen = CountPage();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Testing"),
      ),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: pageSelect,
        currentIndex: _selectPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.question_answer), label: "Background"),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_box_rounded), label: "Count App"),
        ],
      ),
    );
  }
}
