import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.blueAccent,
      unselectedItemColor: Colors.black54,
      backgroundColor: Colors.blueAccent,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home), label: 'Home', tooltip: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
            tooltip: 'Category'),
        BottomNavigationBarItem(
            icon: Icon(Icons.image_search),
            label: 'Search',
            tooltip: 'Search'),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            tooltip: 'Settings'),
      ],
      showUnselectedLabels: false,
      showSelectedLabels: false,
    );
  }
}