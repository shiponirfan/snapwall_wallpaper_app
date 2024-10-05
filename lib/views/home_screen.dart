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
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _getAllImages();
  }

  void _getAllImages() async {
    isLoading = true;
    List<ImageModel> allImages = await ApiEndpoints.getAllImages();
    setState(() {
      images = allImages;
      isLoading = false;
    });
  }

  TextEditingController searchTEController = TextEditingController();

  void getSearchImages() async {
    isLoading = true;
    List<ImageModel> allImages =
        await ApiEndpoints.getSearchImages(searchTEController.text);
    setState(() {
      images = allImages;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            SearchWidget(
              onTap: () => getSearchImages(),
              searchTEController: searchTEController,
            ),
            const CategoryWidget(),
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
                    images: images,
                  )
          ],
        ),
      ),
    );
  }
}
