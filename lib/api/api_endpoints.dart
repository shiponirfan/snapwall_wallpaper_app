import 'dart:convert';
import 'package:snapwall/model/category_model.dart';
import 'package:snapwall/model/image_model.dart';
import 'package:snapwall/utils/api_config.dart';
import 'package:http/http.dart' as http;

class ApiEndpoints {
  static Uri allImages = Uri.parse('${ApiConfig.baseApi}/curated?per_page=20');
  static Uri collections =
      Uri.parse('${ApiConfig.baseApi}/collections/featured');
  static String collectionsMedia = '${ApiConfig.baseApi}/collections';
  static String searchImages = '${ApiConfig.baseApi}/search?query=';

  static Future<List<ImageModel>> getAllImages() async {
    final response = await http.get(ApiEndpoints.allImages, headers: {
      'Authorization': ApiConfig.pexelsApiHeader,
    });

    Map<String, dynamic> jsonData = jsonDecode(response.body);

    List<ImageModel> allImages = [];
    List photos = jsonData['photos'];
    for (var images in photos) {
      allImages.add(ImageModel.getImageFromApi(images));
    }
    return allImages;
  }

  static Future<List<CategoryModel>> getCollections() async {
    final response = await http.get(ApiEndpoints.collections, headers: {
      'Authorization': ApiConfig.pexelsApiHeader,
    });

    Map<String, dynamic> jsonData = jsonDecode(response.body);

    List<CategoryModel> allCollections = [];
    List collectionsList = jsonData['collections'];

    for (var category in collectionsList) {
      allCollections.add(CategoryModel.getCategoryFromApi(category));
    }

    return allCollections;
  }

  static Future<List<ImageModel>> getCollectionsMedia(String categoryId) async {
    final response = await http.get(Uri.parse('$collectionsMedia/$categoryId'), headers: {
      'Authorization': ApiConfig.pexelsApiHeader,
    });

    Map<String, dynamic> jsonData = jsonDecode(response.body);

    List<ImageModel> allCollectionsMedia = [];
    List collectionsMediaList = jsonData['media'];

    for (var category in collectionsMediaList) {
      allCollectionsMedia
          .add(ImageModel.getImageFromApi(category));
    }

    return allCollectionsMedia;
  }

  static Future<List<ImageModel>> getSearchImages(String searchItem) async {
    final response = await http.get(Uri.parse('${ApiEndpoints.searchImages}$searchItem'), headers: {
      'Authorization': ApiConfig.pexelsApiHeader,
    });

    Map<String, dynamic> jsonData = jsonDecode(response.body);

    List<ImageModel> allImages = [];
    List photos = jsonData['photos'];
    for (var images in photos) {
      allImages.add(ImageModel.getImageFromApi(images));
    }
    return allImages;
  }
}
