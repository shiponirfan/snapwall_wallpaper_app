class CategoryMediaModel {
  final int id;
  final String image;
  final String type;

  CategoryMediaModel({
    required this.id,
    required this.image,
    required this.type,
  });

  static CategoryMediaModel getCategoryMediaFromApi(
      Map<String, dynamic> category) {
    return CategoryMediaModel(
        id: category['id'], image: category['src']['portrait'], type: category['type']);
  }
}
