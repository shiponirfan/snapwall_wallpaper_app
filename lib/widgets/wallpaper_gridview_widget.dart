import 'package:flutter/material.dart';
import 'package:snapwall/model/image_model.dart';
import 'package:snapwall/views/wallpaper_full_screen.dart';

class WallpaperGridViewWidget extends StatelessWidget {
  const WallpaperGridViewWidget({
    super.key,
    required this.images,
  });

  final List<ImageModel> images;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          childAspectRatio: 0.6),
      itemCount: images.length,
      itemBuilder: (context, index) {
        ImageModel image = images[index];
        return Hero(
          tag: image.image,
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WallpaperFullScreen(
                      image: image.image,
                    ),
                  ));
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                      image: NetworkImage(image.image), fit: BoxFit.cover)),
            ),
          ),
        );
      },
    ));
  }
}
