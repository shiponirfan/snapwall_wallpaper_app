import 'package:flutter/material.dart';
import 'package:snapwall/api/api_endpoints.dart';
import 'package:snapwall/model/image_model.dart';
import 'package:snapwall/widgets/category_widget.dart';
import 'package:snapwall/widgets/search_widget.dart';
import 'package:snapwall/widgets/wallpaper_gridview_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ImageModel> images = [];

  @override
  void initState() {
    super.initState();
    _getAllImages();
  }

  void _getAllImages() async {
    List<ImageModel> allImages = await ApiEndpoints.getAllImages();
    setState(() {
      images = allImages;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            const SearchWidget(),
            const CategoryWidget(),
            const SizedBox(
              height: 10,
            ),
            WallpaperGridViewWidget(
              images: images,
            )
          ],
        ),
      ),
    );
  }
}
