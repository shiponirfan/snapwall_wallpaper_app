import 'package:flutter/material.dart';
import 'package:snapwall/api/api_endpoints.dart';
import 'package:snapwall/model/category_model.dart';
import 'package:snapwall/utils/category_cover_image.dart';
import 'package:snapwall/views/category_wallpaper_view_screen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<CategoryModel> category = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _getCategory();
  }

  void _getCategory() async {
    isLoading = true;
    List<CategoryModel> allCategory = await ApiEndpoints.getCollections();
    setState(() {
      category = allCategory;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                    color: Colors.blueAccent,
                  ))
                : Expanded(
                    child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            mainAxisSpacing: 10,
                            childAspectRatio: 2.2),
                    itemCount: category.length,
                    itemBuilder: (context, index) {
                      CategoryModel singleCategory = category[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CategoryWallpaperViewScreen(
                                        categoryId: singleCategory.id,
                                        categoryTitle: singleCategory.title),
                              ));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      CategoryCoverImage.images[index]),
                                  fit: BoxFit.cover)),
                          child: Stack(children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                            Center(
                                child: Text(
                              singleCategory.title,
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            )),
                          ]),
                        ),
                      );
                    },
                  )),
          ],
        ),
      ),
    );
  }
}
