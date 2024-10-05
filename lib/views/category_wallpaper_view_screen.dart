import 'package:flutter/material.dart';
import 'package:snapwall/api/api_endpoints.dart';
import 'package:snapwall/model/image_model.dart';
import 'package:snapwall/widgets/appbar_widget.dart';
import 'package:snapwall/widgets/wallpaper_gridview_widget.dart';

class CategoryWallpaperViewScreen extends StatefulWidget {
  const CategoryWallpaperViewScreen(
      {super.key, required this.categoryId, required this.categoryTitle});

  final String categoryId;
  final String categoryTitle;

  @override
  State<CategoryWallpaperViewScreen> createState() =>
      _CategoryWallpaperViewScreenState();
}

class _CategoryWallpaperViewScreenState
    extends State<CategoryWallpaperViewScreen> {
  List<ImageModel> categoryMedia = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _getCategoryMedia();
  }

  void _getCategoryMedia() async {
    isLoading = true;
    List<ImageModel> allCategoryMedia =
        await ApiEndpoints.getCollectionsMedia(widget.categoryId);
    setState(() {
      categoryMedia = allCategoryMedia;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCategoryText(),
            const SizedBox(
              height: 10,
            ),
            isLoading
                ? const Column(children: [
                    SizedBox(
                      height: 300,
                    ),
                    Center(
                      child: CircularProgressIndicator(
                        color: Colors.blueAccent,
                      ),
                    ),
                  ])
                : WallpaperGridViewWidget(
                    images: categoryMedia,
                  )
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.categoryTitle,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        const Text(
          'All The Images Get Form Pexels Website',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
