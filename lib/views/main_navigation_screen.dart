import 'package:flutter/material.dart';
import 'package:snapwall/views/category_screen.dart';
import 'package:snapwall/views/home_screen.dart';
import 'package:snapwall/views/profile_screen.dart';
import 'package:snapwall/widgets/appbar_widget.dart';
import 'package:snapwall/widgets/navigation_widget.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int index = 0;
  List<Widget> views = [
    HomeScreen(),
    CategoryScreen(),
    ProfileScreen(),
  ];

  void _changedCurrentIndex(int changedIndex) {
    setState(() {
      index = changedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      bottomNavigationBar: NavigationWidget(
        currentIndex: index,
        changedCurrentIndex: _changedCurrentIndex,
      ),
      body: views[index],
    );
  }
}
