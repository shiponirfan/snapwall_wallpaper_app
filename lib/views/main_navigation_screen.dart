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
    const HomeScreen(),
    const CategoryScreen(),
    const ProfileScreen(),
  ];

  void _changedCurrentIndex(int changedIndex) {
    setState(() {
      index = changedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      bottomNavigationBar: NavigationWidget(
        currentIndex: index,
        changedCurrentIndex: _changedCurrentIndex,
      ),
      body: views[index],
      drawer: _buildCustomDrawer(),
    );
  }

  Widget _buildCustomDrawer() {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.blueAccent),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                    text: const TextSpan(
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 28),
                        text: 'Snap',
                        children: [
                      TextSpan(
                          style: TextStyle(color: Colors.yellow),
                          text: 'Wall')
                    ])),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Wallpaper App Based On Pexels.com',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const ListTile(
            title: Text('Home'),
            leading: Icon(Icons.home),
            selectedColor: Colors.blueAccent,
            selected: true,
          ),
          const ListTile(
            title: Text('Category'),
            leading: Icon(Icons.category),
          ),
          const ListTile(
            title: Text('Profile'),
            leading: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
