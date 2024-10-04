import 'package:flutter/material.dart';
import 'package:snapwall/widgets/category_widget.dart';
import 'package:snapwall/widgets/search_widget.dart';
import 'package:snapwall/widgets/wallpaper_gridview_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            SearchWidget(),
            CategoryWidget(),
            SizedBox(
              height: 10,
            ),
            WallpaperGridViewWidget()
          ],
        ),
      ),
    );
  }
}
