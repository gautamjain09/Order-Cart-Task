import 'package:flutter/material.dart';
import 'package:intern_task/common.dart';
import 'package:intern_task/views/widgets/custom_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pageIndex = 0;

  List<Widget> pages = [
    Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: CustomButton(
              name: itemsName[index],
              itemsCount: itemsCount,
            ),
          );
        },
      ),
    ),
    Container(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("How can we serve you today?"),
      ),
      body: pages[_pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.grey.shade900,
        unselectedItemColor: Colors.grey.shade600,
        unselectedFontSize: 1,
        selectedFontSize: 1,
        onTap: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
        currentIndex: _pageIndex,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 28),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_rounded, size: 28),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline, size: 28),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer, size: 28),
            label: "",
          ),
        ],
      ),
    );
  }
}
