import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      centerTitle: true,
      title: RichText(
          text: const TextSpan(
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 22),
              text: 'Snap',
              children: [
            TextSpan(style: TextStyle(color: Colors.blueAccent), text: 'Wall')
          ])),
      actions: [
        IconButton(onPressed: (){

        }, icon: const Icon(Icons.refresh))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
