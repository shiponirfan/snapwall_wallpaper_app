import 'dart:convert';
import 'package:snapwall/model/image_model.dart';
import 'package:snapwall/utils/api_config.dart';
import 'package:http/http.dart' as http;

class ApiEndpoints {
  static Uri allImages = Uri.parse('${ApiConfig.baseApi}/curated?per_page=20');

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
}
