import 'package:flutter/material.dart';
import 'package:snapwall/views/category_screen.dart';
import 'package:snapwall/views/home_screen.dart';
import 'package:snapwall/views/main_navigation_screen.dart';
import 'package:snapwall/views/profile_screen.dart';
import 'package:snapwall/widgets/appbar_widget.dart';
import 'package:snapwall/widgets/navigation_widget.dart';
import 'package:snapwall/widgets/wallpaper_gridview_widget.dart';

class CategoryWallpaperViewScreen extends StatefulWidget {
  const CategoryWallpaperViewScreen({super.key});

  @override
  State<CategoryWallpaperViewScreen> createState() =>
      _CategoryWallpaperViewScreenState();
}

class _CategoryWallpaperViewScreenState
    extends State<CategoryWallpaperViewScreen> {
  int currentIndex = 1;

  void changedIndex(int index) {
    setState(() {
      currentIndex = index;
    });
    // Navigator.push(context, MaterialPageRoute(builder: (context) {
    //   return currentIndex == 0 ? MainNavigationScreen() : currentIndex == 1
    //       ? CategoryScreen()
    //       : currentIndex == 2 ? ProfileScreen() : CategoryWallpaperViewScreen();
    // },));

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MainNavigationScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      bottomNavigationBar: NavigationWidget(
          currentIndex: currentIndex, changedCurrentIndex: changedIndex),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCategoryText(),
            const SizedBox(
              height: 10,
            ),
            const WallpaperGridViewWidget()
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryText() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Category Name',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        Text(
          'Category Name Details From Pexiels Api',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
