class ImageModel {
  final String image;
  final String photographer;

  ImageModel({required this.image, required this.photographer});

  static ImageModel getImageFromApi(Map<String, dynamic> images) {
    return ImageModel(
        image: (images['src']['portrait']),
        photographer: images['photographer']);
  }
  // static ImageModel getCategoryImageFromApi(Map<String, dynamic> images) {
  //   return ImageModel(
  //       image: (images['src']['portrait']),
  //       photographer: images['photographer']);
  // }
}
