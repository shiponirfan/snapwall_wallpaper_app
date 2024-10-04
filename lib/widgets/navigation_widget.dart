import 'package:flutter/material.dart';

class NavigationWidget extends StatelessWidget {
  const NavigationWidget(
      {super.key,
      required this.currentIndex,
      required this.changedCurrentIndex});

  final int currentIndex;
  final Function(int) changedCurrentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (value) {
        changedCurrentIndex(value);
      },
      currentIndex: currentIndex,
      selectedItemColor: Colors.blueAccent,
      unselectedItemColor: Colors.black54,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home), label: 'Home', tooltip: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.category), label: 'Category', tooltip: 'Category'),
        BottomNavigationBarItem(
            icon: Icon(Icons.person), label: 'Profile', tooltip: 'Profile'),
      ],
      showUnselectedLabels: false,
      showSelectedLabels: false,
    );
  }
}
