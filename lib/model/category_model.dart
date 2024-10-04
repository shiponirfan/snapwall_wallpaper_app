class CategoryModel {
  final String id;
  final String title;

  CategoryModel({required this.id, required this.title});
  static CategoryModel getCategoryFromApi(Map<String, dynamic> category) {
    return CategoryModel(
        id: category['id'],
        title: category['title']);
  }
}