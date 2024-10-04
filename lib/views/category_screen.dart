import 'package:flutter/material.dart';
import 'package:snapwall/api/api_endpoints.dart';
import 'package:snapwall/model/category_media_model.dart';
import 'package:snapwall/model/category_model.dart';
import 'package:snapwall/utils/category_cover_image.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<CategoryModel> category = [];
  List<CategoryMediaModel> categoryMedia = [];

  @override
  void initState() {
    super.initState();
    _getCategory();
  }

  void _getCategory() async {
    List<CategoryModel> allCategory = await ApiEndpoints.getCollections();
    setState(() {
      category = allCategory;
    });
  }

  void _getCategoryMedia(String categoryId) async {
    List<CategoryMediaModel> allCategoryMedia =
        await ApiEndpoints.getCollectionsMedia(categoryId);
    setState(() {
      categoryMedia = allCategoryMedia;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
                child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2.2),
              itemCount: category.length,
              itemBuilder: (context, index) {
                CategoryModel singleCategory = category[index];
                return InkWell(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => const MainNavigationScreen(),
                    //     ));
                    _getCategoryMedia(singleCategory.id);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(
                            image:
                                NetworkImage(CategoryCoverImage.images[index]),
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
