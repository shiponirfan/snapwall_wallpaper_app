import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({
    super.key,
    required this.searchTEController,
    required this.onTap,
  });

  final TextEditingController searchTEController;
  final Function() onTap;

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.sizeOf(context);
    return Container(
      width: mediaQuery.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.blueAccent, width: 2)),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: widget.searchTEController,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
              decoration: const InputDecoration(
                hintText: 'Search Wallpaper',
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          InkWell(
            onTap: widget.onTap,
            child: const Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}
