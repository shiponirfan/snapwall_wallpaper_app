import 'package:flutter/material.dart';
import 'package:snapwall/api/api_endpoints.dart';
import 'package:snapwall/model/category_model.dart';
import 'package:snapwall/model/image_model.dart';
import 'package:snapwall/utils/category_cover_image.dart';
import 'package:snapwall/views/category_wallpaper_view_screen.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({
    super.key,
  });

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  List<CategoryModel> category = [];
  List<ImageModel> categoryMedia = [];
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

  void _getCategoryMedia(String categoryId) async {
    List<ImageModel> allCategoryMedia =
        await ApiEndpoints.getCollectionsMedia(categoryId);
    setState(() {
      categoryMedia = allCategoryMedia;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.sizeOf(context);
    return isLoading
        ? Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: LinearProgressIndicator(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(10)),
    )
        :  SizedBox(
      width: mediaQuery.width,
      height: 60,
      child: ListView.builder(
              itemCount: category.length,
              scrollDirection: Axis.horizontal,
              semanticChildCount: 3,
              itemBuilder: (context, index) {
                CategoryModel singleCategory = category[index];
                List<String> categoryTitleSplit =
                    singleCategory.title.split(' ');
                List<String> categoryTitle = categoryTitleSplit.sublist(0, 1);
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoryWallpaperViewScreen(
                              categoryId: singleCategory.id,
                              categoryTitle: singleCategory.title),
                        ));
                  },
                  child: Container(
                    width: 90,
                    height: 60,
                    margin: const EdgeInsets.only(top: 10, right: 10),
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
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
                        categoryTitle[0],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      )),
                    ]),
                  ),
                );
              },
            ),
    );
  }
}
